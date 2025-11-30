# Linux Process Manager - LaTeX Report

This directory contains the comprehensive LaTeX report for the Linux Process Manager project.

## Structure

```
report/
├── main.tex                    # Main document
├── chapters/                   # Chapter files
│   ├── 01-introduction.tex     # Project motivation and objectives
│   ├── 02-requirements.tex     # Functional & non-functional requirements
│   ├── 03-architecture.tex     # Architecture & design
│   ├── 04-implementation.tex   # Implementation details
│   ├── 05-usage.tex            # Usage guide
│   ├── 06-testing.tex          # Testing & evaluation
│   ├── 07-security.tex         # Security & resilience
│   ├── 08-evaluation.tex       # Evaluation & discussion
│   ├── 09-conclusions.tex      # Conclusions & future work
│   ├── appendix-a-code.tex     # Code samples
│   ├── appendix-b-benchmarks.tex # Benchmark results
│   ├── appendix-c-screenshots.tex # Screenshots
│   └── appendix-d-api.tex      # API documentation
├── figures/                    # Figures and diagrams
├── references.bib              # Bibliography
└── README.md                   # This file
```

## Building the Report

### Prerequisites

Install LaTeX distribution:

**Ubuntu/Debian:**
```bash
sudo apt-get install texlive-full
```

**macOS:**
```bash
brew install mactex
```

**Windows:**
Download and install MiKTeX or TeX Live from their websites.

### Compile

```bash
cd report
pdflatex main.tex
bibtex main
pdflatex main.tex
pdflatex main.tex
```

Or use the build script:
```bash
chmod +x build.sh
./build.sh
```

The compiled PDF will be `main.pdf`.

## Required LaTeX Packages

- geometry
- graphicx
- hyperref
- listings
- xcolor
- fancyhdr
- titlesec
- tikz
- pgfplots
- booktabs
- algorithm
- algpseudocode

All packages are included in texlive-full distribution.

## Adding Screenshots

Place screenshot files in `figures/` directory:
- Use PNG or PDF format
- Recommended resolution: 300 DPI
- Name files descriptively (e.g., `tui-main-view.png`)

## Citations

Add bibliographic entries to `references.bib` in BibTeX format.

## Notes

- The report is structured to meet academic requirements
- All figures are generated using TikZ for consistency
- Code listings use custom syntax highlighting
- Hyperlinks are enabled throughout the document
