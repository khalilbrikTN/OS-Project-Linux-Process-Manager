#!/bin/bash

# Linux Process Manager Report Build Script

echo "Building Linux Process Manager Report..."
echo "========================================"

# Clean previous builds
echo "Cleaning previous builds..."
rm -f *.aux *.log *.out *.toc *.lof *.lot *.bbl *.blg *.lol

# First pass
echo "First LaTeX pass..."
pdflatex -interaction=nonstopmode main.tex

# BibTeX
echo "Running BibTeX..."
bibtex main

# Second pass
echo "Second LaTeX pass..."
pdflatex -interaction=nonstopmode main.tex

# Third pass (for references)
echo "Third LaTeX pass..."
pdflatex -interaction=nonstopmode main.tex

# Check if successful
if [ -f main.pdf ]; then
    echo "========================================"
    echo "✓ Build successful!"
    echo "Output: main.pdf"
    echo "========================================"

    # Open PDF if on macOS or Linux with xdg-open
    if command -v open &> /dev/null; then
        open main.pdf
    elif command -v xdg-open &> /dev/null; then
        xdg-open main.pdf
    fi
else
    echo "========================================"
    echo "✗ Build failed!"
    echo "Check the .log file for errors"
    echo "========================================"
    exit 1
fi
