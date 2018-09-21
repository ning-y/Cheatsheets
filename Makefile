TEX_GARBAGE = *.aux *.bcf *.log *.out *.run.xml
TEX_FILES = $(wildcard src/*.tex)
PDF_FILES = $(patsubst src/%.tex,pdf/%.pdf,$(TEX_FILES))
PNG_FILES = $(patsubst src/%.tex,docs/%-0.png,$(TEX_FILES))

all : pdf docs

pdf: $(PDF_FILES)

pdf/%.pdf : src/%.tex
	cd src && pdflatex -output-directory ../pdf $(patsubst src/%,%,$<)

docs: $(PNG_FILES)

docs/%-0.png : pdf/%.pdf
	convert -density 300 $< -quality 90 $(patsubst pdf/%,docs/%,$(<:.pdf=.png))

clean :
	cd pdf && rm -f $(TEX_GARBAGE)
