# Build `bibliography.md
build:
	@sh ./scripts/make-bib.sh

# Validate `biliography.bib` with `biber`
validate: build
	@biber -V --tool ./bibliography.bib

# Export PhD bibliography
export-phd-bib: build
	@(pubs list "tags:PhD" -k | xargs pubs export) > /tmp/references.bib
	@echo "Exported to '/tmp/references.bib'"
