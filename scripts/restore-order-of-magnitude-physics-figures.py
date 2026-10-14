#!/usr/bin/env python3
"""Restore figure-and-caption crops for the Order-of-Magnitude Physics translation."""

from __future__ import annotations

import re
import subprocess
import tempfile
from collections import defaultdict
from dataclasses import dataclass
from functools import cache
from html import unescape
from pathlib import Path

PDF = Path("/Users/jackyansongli/git/injec-translation/book-a4.pdf")
ROOT = Path(__file__).resolve().parents[1]
CHAPTERS = ROOT / "docs/content/docs/zh/order-of-magnitude-physics"
IMAGES = ROOT / "public/images/order-of-magnitude-physics"
FIGURE_PAGES = {
    1: [5, 8, 9, 13, 14, 15, 19, 21, 22],
    2: [26, 28, 30, 31, 32, 33, 33, 38, 43, 43],
    3: [45, 48, 50, 52, 56, 56, 57, 58, 60],
    4: [66],
    5: [91, 92, 91, 93, 94, 94, 95, 96, 97, 101, 102, 104, 107, 108, 109, 109, 109, 110, 110, 111],
}
CHAPTER_FILES = {
    1: "ch01-wetting-your-feet.md",
    2: "ch02-dimensional-analysis.md",
    3: "ch03-materials-i.md",
    4: "ch04-materials-ii.md",
    5: "ch05-waves.md",
}
# These source-PDF pagination corrections are required because the supplied map
# points 5.3, 5.5, and 5.9 at pages without their corresponding captions.
CROP_PAGE_OVERRIDES = {
    "5.3": 90,
    "5.5": 93,
    "5.9": 99,
}
CAPTION_LINE_GAP = 14
CONNECTED_ARTWORK_GAP = 40
CROP_PADDING = 24
PROTECTED_START = '<div data-moldflow-protected-content>'


@dataclass(frozen=True)
class Word:
    """A word and its coordinates in PDF points."""

    x_min: float
    y_min: float
    x_max: float
    y_max: float
    text: str


def render_page(page: int, destination: Path) -> None:
    _ = subprocess.run(
        [
            "pdftocairo",
            "-f",
            str(page),
            "-l",
            str(page),
            "-r",
            "200",
            "-png",
            "-singlefile",
            str(PDF),
            str(destination),
        ],
        check=True,
    )


@cache
def page_text(page: int) -> tuple[float, tuple[Word, ...]]:
    text = subprocess.check_output(
        ["pdftotext", "-bbox", "-f", str(page), "-l", str(page), str(PDF), "-"],
        text=True,
    )
    page_match = re.search(r'<page width="([\d.]+)" height="[\d.]+">', text)
    if page_match is None:
        raise RuntimeError(f"Could not read dimensions from PDF page {page}")

    word_pattern = re.compile(r'<word xMin="([\d.]+)" yMin="([\d.]+)" xMax="([\d.]+)" yMax="([\d.]+)">(.*?)</word>')
    words = tuple(
        Word(
            float(match.group(1)),
            float(match.group(2)),
            float(match.group(3)),
            float(match.group(4)),
            unescape(match.group(5)),
        )
        for match in word_pattern.finditer(text)
    )
    return float(page_match.group(1)), words


@cache
def caption_bounds(page: int, figure_name: str) -> tuple[float, float, float, float, float]:
    """Return PDF-point bounds for one complete source caption."""

    page_width, words = page_text(page)
    label = f"Figure {figure_name}"

    def is_caption_label(index: int) -> bool:
        line_y = words[index].y_min
        return (
            f"{words[index].text} {words[index + 1].text.rstrip('.')}" == label
            and not any(
                word.y_min == line_y and word.x_min < words[index].x_min
                for word in words
            )
        )

    start = next(
        (index for index in range(len(words) - 1) if is_caption_label(index)),
        None,
    )
    if start is None:
        raise RuntimeError(f"Could not find {label} on PDF page {page}")

    caption = [words[start], words[start + 1]]
    line_y = words[start].y_min
    for next_line_y in sorted({word.y_min for word in words if word.y_min > line_y}):
        if next_line_y - line_y > CAPTION_LINE_GAP:
            break
        caption.extend(word for word in words if word.y_min == next_line_y)
        line_y = next_line_y

    return (
        page_width,
        min(word.x_min for word in caption),
        min(word.y_min for word in caption),
        max(word.x_max for word in caption),
        max(word.y_max for word in caption),
    )


def dark_pixels(rendered: Path) -> tuple[int, int, bytes]:
    """Return a thresholded grayscale raster suitable for crop detection."""

    dimensions = subprocess.check_output(
        ["magick", "identify", "-format", "%w %h", str(rendered)], text=True
    ).split()
    width, height = map(int, dimensions)
    pixels = subprocess.check_output(
        [
            "magick",
            str(rendered),
            "-colorspace",
            "Gray",
            "-threshold",
            "80%",
            "-depth",
            "8",
            "gray:-",
        ]
    )
    if len(pixels) != width * height:
        raise RuntimeError(f"Unexpected raster size while analysing {rendered.name}")
    return width, height, pixels


def crop_bounds(
    rendered: Path,
    page: int,
    figure_name: str,
    previous_figure_name: str | None,
) -> tuple[int, int, int, int]:
    """Find artwork attached to a caption and keep a conservative margin."""

    page_width, _caption_left, caption_top, _caption_right, caption_bottom = caption_bounds(
        page, figure_name
    )
    width, height, pixels = dark_pixels(rendered)
    scale = width / page_width
    left_margin = round(width * 0.04)
    right_margin = width - left_margin
    caption_top_pixel = round(caption_top * scale)
    caption_bottom_pixel = round(caption_bottom * scale)
    minimum_top = 0
    if previous_figure_name is not None:
        previous_caption_bottom = caption_bounds(page, previous_figure_name)[4]
        minimum_top = round(previous_caption_bottom * scale) + 1

    def row_has_ink(y: int) -> bool:
        row = pixels[y * width + left_margin : y * width + right_margin]
        return row.count(0) >= 3

    artwork_bottom = next(
        (
            y
            for y in range(caption_top_pixel - CROP_PADDING, minimum_top - 1, -1)
            if row_has_ink(y)
        ),
        None,
    )
    if artwork_bottom is None:
        raise RuntimeError(f"Could not find artwork above Figure {figure_name} on PDF page {page}")

    artwork_top = artwork_bottom
    empty_rows = 0
    for y in range(artwork_bottom - 1, minimum_top - 1, -1):
        if row_has_ink(y):
            artwork_top = y
            empty_rows = 0
        else:
            empty_rows += 1
            if empty_rows >= CONNECTED_ARTWORK_GAP:
                break

    top = max(minimum_top, artwork_top - CROP_PADDING)
    bottom = min(height, caption_bottom_pixel + CROP_PADDING)
    crop_pixels = pixels[top * width : bottom * width]
    ink_positions = [
        index
        for index, value in enumerate(crop_pixels)
        if value == 0 and left_margin <= index % width < right_margin
    ]
    if not ink_positions:
        raise RuntimeError(f"Could not determine width for Figure {figure_name} on PDF page {page}")

    left = max(0, min(index % width for index in ink_positions) - CROP_PADDING)
    right = min(width, max(index % width for index in ink_positions) + CROP_PADDING + 1)
    return left, top, right, bottom


def crop_figure(
    rendered: Path,
    page: int,
    figure_name: str,
    previous_figure_name: str | None,
    destination: Path,
) -> None:
    left, top, right, bottom = crop_bounds(rendered, page, figure_name, previous_figure_name)
    _ = subprocess.run(
        [
            "magick",
            str(rendered),
            "-crop",
            f"{right - left}x{bottom - top}+{left}+{top}",
            "+repage",
            str(destination),
        ],
        check=True,
    )


def figure_tag(chapter: int, figure: int) -> str:
    name = f"fig-{chapter}-{figure}.png"
    return (
        f'<img src="/images/order-of-magnitude-physics/{name}" '
        f'alt="图 {chapter}.{figure}：原书扫描页" loading="lazy" decoding="async" />'
    )


def protected_bounds(source: str, path: Path) -> tuple[int, int]:
    start = source.find(PROTECTED_START)
    end = source.find("</div>", start)
    if start < 0 or end <= start:
        raise RuntimeError(f"Could not find protected content block in {path.name}")
    return start, end


def insert_figures(chapter: int) -> None:
    path = CHAPTERS / CHAPTER_FILES[chapter]
    source = path.read_text(encoding="utf-8")

    for figure in range(1, len(FIGURE_PAGES[chapter]) + 1):
        tag = figure_tag(chapter, figure)
        protected_start, protected_end = protected_bounds(source, path)
        tag_index = source.find(tag)
        if tag_index >= 0:
            if not protected_start < tag_index < protected_end:
                raise RuntimeError(f"{tag} is outside protected content in {path.name}")
            continue

        reference = re.compile(rf"^(.*图 {chapter}\.{figure}(?!\d).*\n)", re.MULTILINE)
        match = reference.search(source)
        if match is None:
            raise RuntimeError(f"Could not find 图 {chapter}.{figure} in {path.name}")
        if not protected_start < match.start() < protected_end:
            raise RuntimeError(f"图 {chapter}.{figure} is outside protected content in {path.name}")
        source = source[:match.end()] + f"\n{tag}\n" + source[match.end():]

    _ = path.write_text(source, encoding="utf-8")


def figures_by_page() -> dict[int, list[tuple[int, int]]]:
    grouped: dict[int, list[tuple[int, int]]] = defaultdict(list)
    for chapter, pages in FIGURE_PAGES.items():
        for figure, page in enumerate(pages, start=1):
            figure_name = f"{chapter}.{figure}"
            grouped[CROP_PAGE_OVERRIDES.get(figure_name, page)].append((chapter, figure))
    return grouped


def main() -> None:
    if not PDF.exists():
        raise RuntimeError(f"Source PDF is missing: {PDF}")

    _ = IMAGES.mkdir(parents=True, exist_ok=True)
    with tempfile.TemporaryDirectory() as temporary_directory:
        cache_directory = Path(temporary_directory)
        for page, figures in figures_by_page().items():
            rendered = cache_directory / f"page-{page}"
            render_page(page, rendered)
            ordered_figures = sorted(
                figures,
                key=lambda item: caption_bounds(page, f"{item[0]}.{item[1]}")[2],
            )
            previous_figure_name: str | None = None
            for chapter, figure in ordered_figures:
                figure_name = f"{chapter}.{figure}"
                crop_figure(
                    rendered.with_suffix(".png"),
                    page,
                    figure_name,
                    previous_figure_name,
                    IMAGES / f"fig-{chapter}-{figure}.png",
                )
                previous_figure_name = figure_name

    for chapter in FIGURE_PAGES:
        insert_figures(chapter)


if __name__ == "__main__":
    main()
