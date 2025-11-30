# Linux Process Manager - LaTeX Report Compilation Guide

## 📋 Complete Report Structure

Your professional academic report is now ready with the following structure:

```
report/
├── main.tex                        ✅ Main document (cover, abstract, TOC)
├── references.bib                  ✅ Bibliography (30+ references)
├── build.sh                        ✅ Build automation script
│
├── chapters/                       ✅ All chapters complete
│   ├── 01-introduction.tex         ✅ Motivation, objectives, scope
│   ├── 02-requirements.tex         ✅ Functional & non-functional specs
│   ├── 03-architecture.tex         ✅ Design, diagrams, data structures
│   ├── 04-implementation.tex       ✅ Rust code, algorithms, challenges
│   ├── 05-usage.tex                ✅ Compilation, running, examples
│   ├── 06-testing.tex              ✅ Test plan, 121 tests, benchmarks
│   ├── 07-security.tex             ✅ Security analysis, threat model
│   ├── 08-evaluation.tex           ✅ Results, comparison, limitations
│   ├── 09-conclusions.tex          ✅ Achievements, future work
│   ├── appendix-a-code.tex         ✅ Code samples
│   ├── appendix-b-benchmarks.tex   ✅ Detailed benchmark results
│   ├── appendix-c-screenshots.tex  ✅ UI screenshots documentation
│   └── appendix-d-api.tex          ✅ REST API reference
│
├── figures/                        📁 (create and populate)
│   ├── rust-logo.png              ⚠️  Download from rust-lang.org
│   ├── tui-main-view.png          📸 Screenshot needed
│   ├── tui-tree-view.png          📸 Screenshot needed
│   ├── tui-graphs.png             📸 Screenshot needed
│   ├── web-ui-dashboard.png       📸 Screenshot needed
│   └── ... (see section below)
│
└── README.md                       ✅ Documentation
```

## 🚀 Quick Start

### Prerequisites

**Ubuntu/Debian:**
```bash
sudo apt-get update
sudo apt-get install texlive-full texlive-latex-extra texlive-science
```

**Fedora/RHEL:**
```bash
sudo dnf install texlive-scheme-full
```

**macOS:**
```bash
brew install --cask mactex
# Then add to PATH:
export PATH="/Library/TeX/texbin:$PATH"
```

**Windows:**
- Download and install MiKTeX: https://miktex.org/download
- Or TeX Live: https://tug.org/texlive/windows.html

### Build the Report

**Option 1: Using build script (Linux/macOS):**
```bash
cd report
chmod +x build.sh
./build.sh
```

**Option 2: Manual compilation:**
```bash
cd report
pdflatex main.tex
bibtex main
pdflatex main.tex
pdflatex main.tex
```

**Option 3: Using latexmk (recommended):**
```bash
cd report
latexmk -pdf main.tex
```

The compiled PDF will be: `report/main.pdf`

## 📸 Adding Screenshots

### Required Screenshots

Create the `figures/` directory and add these images:

#### 1. Logos and Branding
- **rust-logo.png** - Download from https://www.rust-lang.org/logos/rust-logo-512x512.png

#### 2. Terminal UI (TUI) Screenshots
Capture these using your actual running application:

```bash
# Run the process manager
./target/release/process-manager

# Use a screenshot tool:
# - Linux: gnome-screenshot, flameshot, or scrot
# - macOS: Cmd+Shift+4
# - Windows: Snipping Tool
```

Required TUI screenshots:
- **tui-main-view.png** - Main process list view
- **tui-tree-view.png** - Tree view mode (press 't')
- **tui-graphs.png** - System graphs visible (press 'g')
- **tui-kill-dialog.png** - Kill dialog (press 'k' on a process)
- **tui-search.png** - Search mode (press '/')
- **tui-help.png** - Help screen (press 'h')

#### 3. Web UI Screenshots
Start API server and capture web interface:

```bash
# Start API server
./target/release/process-manager --api --api-port 8080

# Open in browser: http://localhost:8080
# Open web/index.html
```

Required Web UI screenshots:
- **web-ui-dashboard.png** - Main dashboard
- **web-ui-process-details.png** - Process details view
- **web-ui-history.png** - Historical data charts

#### 4. Command-Line Output
- **cli-help.png** - `./process-manager --help` output
- **metrics-export.png** - Metrics export output
- **api-curl.png** - API curl example

### Screenshot Guidelines

- **Resolution**: 1920x1080 or higher
- **Format**: PNG (lossless)
- **DPI**: 150-300 for print quality
- **Terminal**: Use a clean terminal theme with good contrast
- **Font Size**: Increase terminal font for readability
- **Window**: Maximize or use standard size (80x24 minimum)

### Quick Screenshot Commands

**Linux (with scrot):**
```bash
cd report/figures
scrot -d 3 tui-main-view.png  # 3 second delay
```

**macOS:**
```bash
# Cmd+Shift+4, then press Space, click window
# Or use screencapture:
screencapture -w -x tui-main-view.png
```

**Convert Terminal to PNG:**
If you want to convert terminal output to image:
```bash
# Install ansifilter and imagemagick
sudo apt-get install ansifilter imagemagick

# Capture terminal output and convert
./process-manager | head -n 30 > output.txt
cat output.txt | ansifilter -H > output.html
wkhtmltoimage output.html tui-main-view.png
```

## 🔧 Troubleshooting

### Common LaTeX Errors

**Error: "File not found: rust-logo.png"**
```bash
# Download Rust logo
cd report/figures
wget https://www.rust-lang.org/logos/rust-logo-512x512.png -O rust-logo.png
# Or create a placeholder:
convert -size 512x512 xc:orange -pointsize 72 -draw "text 100,256 'RUST'" rust-logo.png
```

**Error: Missing package**
```bash
# Ubuntu/Debian
sudo apt-get install texlive-latex-extra texlive-pictures texlive-science

# Or install missing packages on-the-fly (MiKTeX)
# MiKTeX will auto-install on first compile
```

**Error: "Undefined control sequence"**
- Usually means a LaTeX command is not recognized
- Install missing packages or check spelling
- Look at the .log file for details

**Bibliography not showing:**
```bash
# Make sure to run bibtex
pdflatex main.tex
bibtex main      # <-- Don't forget this!
pdflatex main.tex
pdflatex main.tex
```

### Build Script Not Working

**Linux/macOS:**
```bash
# Make sure it's executable
chmod +x build.sh

# If bash not found, edit shebang:
# Change #!/bin/bash to #!/usr/bin/env bash
```

**Windows:**
Use Git Bash or WSL, or compile manually with MiKTeX.

## 📝 Customization Tips

### Update Team Information

Edit `main.tex` line ~85:
```latex
\author{
    \textbf{Team Members}\\[0.5cm]
    \begin{tabular}{ll}
        Your Name & ID: XXXXXX \\
        ...
    \end{tabular}
}
```

### Add Instructor Name

Edit `main.tex` around line 95:
```latex
\textbf{Instructor}\\
[Professor Name]\\[0.5cm]
```

### Add University Information

Edit `main.tex` around line 98:
```latex
\textbf{Institution}\\
[Your University Name]\\
[Department of Computer Science]
```

### Adjust Formatting

**Change font size:**
```latex
% In main.tex line 7
\documentclass[11pt,a4paper]{report}  % Change from 12pt to 11pt
```

**Change margins:**
```latex
% In main.tex around line 38
\geometry{
    left=1.25in,  % Adjust margins
    right=1.25in,
    top=1.25in,
    bottom=1.25in
}
```

## 📊 Expected Output

### Document Statistics

- **Total Pages**: ~120-150 pages
- **Chapters**: 9 main chapters
- **Appendices**: 4 sections
- **Figures**: ~25-30 (with screenshots)
- **Tables**: ~15-20
- **Code Listings**: ~30-40
- **References**: 30+ citations

### Table of Contents Structure

```
Abstract
Executive Summary
Table of Contents
List of Figures
List of Tables
List of Listings

Chapter 1: Introduction (8-10 pages)
Chapter 2: Requirements Analysis (12-15 pages)
Chapter 3: Architecture and Design (15-18 pages)
Chapter 4: Implementation Details (18-20 pages)
Chapter 5: Usage Guide (10-12 pages)
Chapter 6: Testing and Evaluation (12-15 pages)
Chapter 7: Security and Resilience (10-12 pages)
Chapter 8: Evaluation and Discussion (8-10 pages)
Chapter 9: Conclusions (6-8 pages)

References (3-4 pages)

Appendix A: Code Samples (8-10 pages)
Appendix B: Benchmark Results (5-6 pages)
Appendix C: Screenshots (6-8 pages)
Appendix D: API Documentation (6-8 pages)
```

## 🎯 Quality Checklist

Before submission, verify:

- [ ] All chapters compile without errors
- [ ] All figures are present (no missing image warnings)
- [ ] All references cited and bibliography complete
- [ ] Team member names and IDs correct
- [ ] Instructor name added
- [ ] University name and department added
- [ ] Screenshots clear and readable
- [ ] Code listings have proper syntax highlighting
- [ ] Page numbers correct
- [ ] Table of contents matches content
- [ ] Hyperlinks work (click to test)
- [ ] No "TODO" or placeholder text remains
- [ ] Consistent formatting throughout
- [ ] Spell check completed
- [ ] PDF metadata correct (title, author)

## 🚢 Final Submission

### Generate Final PDF

```bash
cd report

# Clean build
rm -f *.aux *.log *.out *.toc *.lof *.lot *.bbl *.blg *.lol

# Full compile
pdflatex main.tex && bibtex main && pdflatex main.tex && pdflatex main.tex

# Rename for submission
cp main.pdf "Linux_Process_Manager_Final_Report_Fall2025.pdf"
```

### Submission Package

Create a complete submission archive:

```bash
cd ..
zip -r process-manager-report.zip report/ \
    -x "report/*.aux" "report/*.log" "report/*.out" \
       "report/*.toc" "report/*.lof" "report/*.lot" \
       "report/*.bbl" "report/*.blg" "report/*.lol"
```

Package should include:
- All .tex source files
- references.bib
- All figures/
- README.md
- Compiled main.pdf

## 📧 Support

If you encounter issues:

1. Check the LaTeX .log file for specific errors
2. Verify all required packages are installed
3. Ensure all figure files exist
4. Try compiling individual chapters to isolate issues
5. Use online LaTeX editors (Overleaf) as fallback

## 🎓 Academic Integrity

This report template provides structure. Ensure all content accurately represents your project work. Customize examples and descriptions to match your actual implementation.

---

**Good luck with your submission! 🚀**

Your comprehensive report demonstrates professional software engineering practices and deep understanding of operating systems concepts.
