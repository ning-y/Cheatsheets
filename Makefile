TEX_GARBAGE = *.aux *.bcf *.log *.out *.run.xml
TEX_FILES = $(wildcard src/*.tex)
PDF_FILES = $(patsubst src/%,pdf/%,$(TEX_FILES:.tex=.pdf))

clean :
	cd pdf && rm -f $(TEX_GARBAGE)

$(info $$TEX_FILES is [${TEX_FILES}])
$(info $$PDF_FILES is [${PDF_FILES}])

pdf: $(PDF_FILES)

pdf/%.pdf : src/%.tex
	cd src && pdflatex -output-directory ../pdf $(patsubst src/%,%,$<)
