#!/bin/bash
# Convert all PDFs in assets/pdfs to high-res PNGs in assets/images

cd "$(dirname "$0")/../assets/pdfs"

for f in *.pdf; do
    if [ -f "$f" ]; then
        name="${f%.pdf}"
        echo "Converting $f -> ../images/${name}.png"
        pdftoppm -png -r 400 -singlefile "$f" "../images/${name}"
    fi
done

echo "Done! Converted $(ls -1 *.pdf 2>/dev/null | wc -l) PDFs"
