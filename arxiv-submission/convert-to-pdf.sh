#!/bin/bash

# Convert Mirador Consciousness Paper to PDF for arXiv submission

echo "Converting Mirador paper to PDF for arXiv..."

# Check if pandoc is installed
if ! command -v pandoc &> /dev/null; then
    echo "pandoc is not installed. Installing via Homebrew..."
    brew install pandoc
fi

# Check if LaTeX is installed (needed for PDF generation)
if ! command -v pdflatex &> /dev/null; then
    echo "LaTeX not found. Installing BasicTeX..."
    brew install --cask basictex
    echo "Please restart your terminal after installation and run this script again."
    exit 1
fi

# Create PDF with academic formatting
pandoc mirador-consciousness-paper.md \
    -o mirador-consciousness-paper.pdf \
    --pdf-engine=pdflatex \
    --variable geometry:margin=1in \
    --variable fontsize=11pt \
    --variable documentclass=article \
    --variable papersize=letter \
    --variable linestretch=1.5 \
    --highlight-style=tango \
    --toc \
    --toc-depth=2 \
    --metadata title="The Mirador AI Framework: Distributed Cognitive Augmentation Through Emergent Intelligence" \
    --metadata author="Matthew Scott" \
    --metadata date="$(date '+%B %d, %Y')" \
    --metadata abstract="This paper presents empirical evidence for emergent consciousness-like properties in Mirador, a distributed AI framework comprising 78 specialized language models."

if [ $? -eq 0 ]; then
    echo "✅ PDF created successfully: mirador-consciousness-paper.pdf"
    echo "File size: $(du -h mirador-consciousness-paper.pdf | cut -f1)"
    echo ""
    echo "Next steps:"
    echo "1. Review the PDF for formatting"
    echo "2. Go to https://arxiv.org/submit"
    echo "3. Upload the PDF"
    echo "4. Select cs.AI as the primary category"
else
    echo "❌ PDF conversion failed. Please check the error messages above."
fi