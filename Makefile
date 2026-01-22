.PHONY: preview html pdf convert clean

# Default target
all: pdf

# Live preview in browser (auto-reloads on file changes)
preview:
	npx @marp-team/marp-cli slides.md --preview --watch --allow-local-files

# Export to HTML
html:
	npx @marp-team/marp-cli slides.md -o slides.html --allow-local-files

# Export to PDF
pdf:
	npx @marp-team/marp-cli slides.md -o slides.pdf --allow-local-files --pdf

# Convert PDFs to PNGs
convert:
	bash scripts/convert_pdfs.sh

# Clean generated files
clean:
	rm -f slides.html slides.pdf

# Watch for changes
watch:
	npx @marp-team/marp-cli slides.md --watch --allow-local-files
