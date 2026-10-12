#!/usr/bin/env python3
"""Restore figure-and-caption crops for Longair's translated chapters."""

from __future__ import annotations

import re
import subprocess
import tempfile
from dataclasses import dataclass
from html import unescape
from pathlib import Path

PDF = Path(
    "/Users/jackyansongli/Downloads/Theoretical Concepts in Physics An Alternative View of Theoretical Reasoning in Physics (Malcolm S. Longair) (z-library.sk, 1lib.sk, z-lib.sk).pdf"
)
ROOT = Path(__file__).resolve().parents[1]
CHAPTERS = ROOT / "docs/content/docs/zh/theoretical-concepts-in-physics"
IMAGES = ROOT / "public/images/theoretical-concepts-in-physics"
FIGURE_PAGES = {
    9: [179, 180, 183, 184, 186, 187, 188, 190, 193, 194, 195, 197, 202, 203, 206, 207, 208],
    11: [253, 258, 261, 263, 264, 265, 267, 269, 270, 272, 274, 276, 277, 277, 278, 278, 279, 280, 281, 283, 285],
    12: [297, 303, 304, 307, 309, 310, 311, 313, 313, 314, 325, 326],
}
CHAPTER_FILES = {
    9: "ch09-motion-of-fluids.md",
    11: "ch11-basic-thermodynamics.md",
    12: "ch12-kinetic-theory-statistical-mechanics.md",
}
CAPTION_LINE_GAP = 14
CONNECTED_ARTWORK_GAP = 40
CROP_PADDING = 24
CROP_TOP_OVERRIDES = {
    "11.13": 58.3,
    "12.8": 53.1,
}


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


def page_text(page: int) -> tuple[float, list[Word]]:
    text = subprocess.check_output(
        ["pdftotext", "-bbox", "-f", str(page), "-l", str(page), str(PDF), "-"],
        text=True,
    )
    page_match = re.search(r'<page width="([\d.]+)" height="[\d.]+">', text)
    if page_match is None:
        raise RuntimeError(f"Could not read dimensions from PDF page {page}")

    word_pattern = re.compile(r'<word xMin="([\d.]+)" yMin="([\d.]+)" xMax="([\d.]+)" yMax="([\d.]+)">(.*?)</word>')
    words = [
        Word(
            float(match.group(1)),
            float(match.group(2)),
            float(match.group(3)),
            float(match.group(4)),
            unescape(match.group(5)),
        )
        for match in word_pattern.finditer(text)
    ]
    return float(page_match.group(1)), words


def caption_bounds(page: int, figure_name: str) -> tuple[float, float, float, float, float]:
    """Return PDF-point bounds for one complete source caption."""

    page_width, words = page_text(page)
    label = f"Fig. {figure_name}"

    def caption_label(index: int) -> str:
        number = words[index + 1].text.rstrip(".").translate(str.maketrans({"(": "8", ")": "9"}))
        return f"{words[index].text} {number}"

    start = next(
        (
            index
            for index in range(len(words) - 1)
            if caption_label(index) == label
        ),
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
    rendered: Path, page: int, figure_name: str, previous_figure_name: str | None
) -> tuple[int, int, int, int]:
    """Find the artwork connected to a caption and keep a conservative margin."""

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
        raise RuntimeError(f"Could not find artwork above Fig. {figure_name} on PDF page {page}")

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
    if figure_name in CROP_TOP_OVERRIDES:
        top = round(CROP_TOP_OVERRIDES[figure_name] * scale)
    bottom = min(height, caption_bottom_pixel + CROP_PADDING)
    crop_pixels = pixels[top * width : bottom * width]
    ink_positions = [
        index
        for index, value in enumerate(crop_pixels)
        if value == 0 and left_margin <= index % width < right_margin
    ]
    if not ink_positions:
        raise RuntimeError(f"Could not determine width for Fig. {figure_name} on PDF page {page}")

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
        f'<img src="/images/theoretical-concepts-in-physics/{name}" '
        f'alt="图 {chapter}.{figure}：原书扫描页" loading="lazy" decoding="async" />'
    )


def insert_figures(chapter: int) -> None:
    path = CHAPTERS / CHAPTER_FILES[chapter]
    source = path.read_text(encoding="utf-8")

    for figure in range(1, len(FIGURE_PAGES[chapter]) + 1):
        tag = figure_tag(chapter, figure)
        if tag in source:
            continue
        reference = re.compile(rf"^(.*图 {chapter}\.{figure}(?!\d).*\n)", re.MULTILINE)
        match = reference.search(source)
        if match is None:
            raise RuntimeError(f"Could not find 图 {chapter}.{figure} in {path.name}")
        source = source[:match.end()] + f"\n{tag}\n" + source[match.end():]

    _ = path.write_text(source, encoding="utf-8")


def main() -> None:
    if not PDF.exists():
        raise RuntimeError(f"Source PDF is missing: {PDF}")

    _ = IMAGES.mkdir(parents=True, exist_ok=True)
    with tempfile.TemporaryDirectory() as temporary_directory:
        cache = Path(temporary_directory)
        for chapter, pages in FIGURE_PAGES.items():
            for figure, page in enumerate(pages, start=1):
                rendered = cache / f"page-{page}"
                rendered_png = rendered.with_suffix(".png")
                if not rendered_png.exists():
                    render_page(page, rendered)
                destination = IMAGES / f"fig-{chapter}-{figure}.png"
                previous_figure_name = (
                    f"{chapter}.{figure - 1}"
                    if figure > 1 and pages[figure - 2] == page
                    else None
                )
                crop_figure(
                    rendered_png,
                    page,
                    f"{chapter}.{figure}",
                    previous_figure_name,
                    destination,
                )
            insert_figures(chapter)


if __name__ == "__main__":
    main()
