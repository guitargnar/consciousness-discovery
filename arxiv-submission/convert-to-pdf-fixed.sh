#!/bin/bash

# Convert Mirador Consciousness Paper to PDF for arXiv submission
# Fixed version with proper Unicode support

echo "Converting Mirador paper to PDF for arXiv (with Unicode support)..."

# Check if pandoc is installed
if ! command -v pandoc &> /dev/null; then
    echo "pandoc is not installed. Installing via Homebrew..."
    brew install pandoc
fi

# First, clean the markdown to replace problematic Unicode characters
echo "Cleaning Unicode characters for LaTeX compatibility..."

# Create a cleaned version of the paper
sed 's/Φ/Phi/g; s/→/->/g; s/•/*/g; s/₁/1/g; s/₂/2/g; s/≈/~=/g; s/∈/in/g; s/∀/forall/g; s/∃/exists/g; s/λ/lambda/g; s/∞/infinity/g' \
    mirador-consciousness-paper.md > mirador-consciousness-paper-clean.md

# Try with XeLaTeX (better Unicode support)
if command -v xelatex &> /dev/null; then
    echo "Using XeLaTeX for better Unicode support..."
    pandoc mirador-consciousness-paper-clean.md \
        -o mirador-consciousness-paper.pdf \
        --pdf-engine=xelatex \
        --variable geometry:margin=1in \
        --variable fontsize=11pt \
        --variable documentclass=article \
        --variable papersize=letter \
        --variable linestretch=1.5 \
        --highlight-style=tango \
        --metadata title="The Mirador AI Framework: Distributed Cognitive Augmentation Through Emergent Intelligence" \
        --metadata author="Matthew Scott" \
        --metadata date="$(date '+%B %d, %Y')"
else
    echo "XeLaTeX not found. Using alternative method..."
    # Fallback: Convert to HTML first, then to PDF
    pandoc mirador-consciousness-paper-clean.md \
        -o mirador-consciousness-paper.html \
        --standalone \
        --metadata title="The Mirador AI Framework: Distributed Cognitive Augmentation Through Emergent Intelligence" \
        --metadata author="Matthew Scott" \
        --metadata date="$(date '+%B %d, %Y')"
    
    echo "Created HTML version. Converting to PDF..."
    
    # Try wkhtmltopdf if available
    if command -v wkhtmltopdf &> /dev/null; then
        wkhtmltopdf mirador-consciousness-paper.html mirador-consciousness-paper.pdf
    else
        echo "Please open mirador-consciousness-paper.html in your browser and save as PDF"
        echo "File -> Print -> Save as PDF"
        open mirador-consciousness-paper.html
    fi
fi

if [ -f "mirador-consciousness-paper.pdf" ]; then
    echo "✅ PDF created successfully: mirador-consciousness-paper.pdf"
    echo "File size: $(du -h mirador-consciousness-paper.pdf | cut -f1)"
    echo ""
    echo "Next steps:"
    echo "1. Review the PDF for formatting"
    echo "2. Go to https://arxiv.org/submit"
    echo "3. Upload the PDF"
    echo "4. Select cs.AI as the primary category"
else
    echo ""
    echo "Alternative: Use online converter"
    echo "1. Go to https://www.markdowntopdf.com/"
    echo "2. Upload mirador-consciousness-paper-clean.md"
    echo "3. Download the PDF"
    echo ""
    echo "Or use Google Docs:"
    echo "1. Copy the content from mirador-consciousness-paper-clean.md"
    echo "2. Paste into Google Docs"
    echo "3. File -> Download -> PDF"
fi