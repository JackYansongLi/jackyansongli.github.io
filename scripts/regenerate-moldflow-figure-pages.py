#!/usr/bin/env python3
"""Regenerate complete Moldflow source-page images for every translated figure."""

from __future__ import annotations

import argparse
import os
import re
import subprocess
import tempfile
from collections.abc import Iterable
from pathlib import Path


PDF = Path(
    os.environ.get(
        "MOLDFLOW_DESIGN_GUIDE_PDF",
        "/Users/jackyansongli/Library/Containers/com.tencent.xinWeChat/Data/Documents/xwechat_files/wxid_bk0rw2pj57ka22_b9ec/msg/file/2026-09/Moldflow Design Guide A Resource for Plastics Engineers (Jay Shoemaker) (z-library.sk, 1lib.sk, z-lib.sk).pdf",
    )
)
CHAPTERS = Path("docs/content/docs/zh/moldflow-design-guide")
IMAGES = Path("public/images/moldflow-design-guide")
IMAGE_REFERENCE = re.compile(r"!\[[^\]]*\]\(/images/moldflow-design-guide/([^\)]+)\)")
APPENDIX_PAGE_RANGES = {
    "appendix-a": range(267, 277),
    "appendix-b": range(279, 288),
    "appendix-c": range(290, 300),
    "appendix-d": range(301, 305),
}


def source_pages() -> list[str]:
    return subprocess.check_output(["pdftotext", "-layout", str(PDF), "-"]).decode(
        "utf-8", "ignore"
    ).split("\f")


def candidate_pages(chapter: Path, pages: list[str], label: str) -> Iterable[tuple[int, str]]:
    if label.startswith("A."):
        appendix = next((name for name in APPENDIX_PAGE_RANGES if chapter.stem.startswith(name)), None)
        if appendix is not None:
            return ((index + 1, pages[index]) for index in APPENDIX_PAGE_RANGES[appendix])
    return enumerate(pages, start=1)


def figure_label(asset_name: str) -> str:
    chapter_figure = re.fullmatch(r"ch\d+-fig-(\d+)-(\d+)\.png", asset_name)
    if chapter_figure:
        return f"{chapter_figure.group(1)}.{chapter_figure.group(2)}"
    appendix_figure = re.fullmatch(r"appendix-[a-d]-figure-a-(\d+)\.png", asset_name)
    if appendix_figure:
        return f"A.{appendix_figure.group(1)}"
    raise RuntimeError(f"Unrecognized figure asset name: {asset_name}")


def figure_sources() -> dict[Path, int]:
    pages = source_pages()
    sources: dict[Path, int] = {}

    for chapter in sorted(CHAPTERS.glob("*.md")):
        asset_names = [asset_name for asset_name in IMAGE_REFERENCE.findall(chapter.read_text()) if isinstance(asset_name, str)]
        for asset_name in asset_names:
            label = figure_label(asset_name)
            caption = re.compile(rf"Figure\s+{re.escape(label)}\b[ \t]{{2,}}\S", re.IGNORECASE)
            matches = [page for page, content in candidate_pages(chapter, pages, label) if caption.search(content)]
            if not matches:
                raise RuntimeError(f"Could not locate a caption for Figure {label} in {chapter.name}")
            if len(matches) != 1:
                raise RuntimeError(f"Ambiguous caption pages for Figure {label} in {chapter.name}: {matches}")
            sources[IMAGES / asset_name] = matches[0]

    if len(sources) != 256:
        raise RuntimeError(f"Expected 256 figure assets, found {len(sources)}")
    return sources


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


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--write", action="store_true")
    args = parser.parse_args()
    sources = figure_sources()
    _ = print(f"Mapped {len(sources)} figure assets to {len(set(sources.values()))} PDF pages.")
    write_assets = args.write if isinstance(args.write, bool) else False
    if not write_assets:
        return

    with tempfile.TemporaryDirectory() as temporary_directory:
        cache = Path(temporary_directory)
        for asset, page in sources.items():
            rendered = cache / f"page-{page}"
            rendered_png = rendered.with_suffix(".png")
            if not rendered_png.exists():
                render_page(page, rendered)
            _ = subprocess.run(
                ["magick", str(rendered_png), "-bordercolor", "white", "-border", "50", str(asset)],
                check=True,
            )


if __name__ == "__main__":
    main()
