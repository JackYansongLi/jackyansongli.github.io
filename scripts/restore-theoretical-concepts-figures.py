#!/usr/bin/env python3
"""Restore complete source-page figures for Longair's translated chapters."""

from __future__ import annotations

import re
import subprocess
import tempfile
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
                _ = subprocess.run(
                    ["magick", str(rendered_png), "-bordercolor", "white", "-border", "50", str(destination)],
                    check=True,
                )
            insert_figures(chapter)


if __name__ == "__main__":
    main()
