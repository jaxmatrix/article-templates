FILES=meta.yaml Article/Main.md Article/Introduction/Intro.md

all : generate

generate : latex
	mkdir -p out
	pandoc -s $(FILES) -o out/Article.pdf

latex : 
	mkdir -p out/latex
	pandoc -s $(FILES) -o out/latex/Article.tex \
	--template templates/template.latex
	pdflatex -output-directory=out/latex/ out/latex/Article.tex

doc : latex 
	mkdir -p out/doc
	pandoc -s out/latex/Article.tex -o out/doc/Article.docx

opendoc : 
	mkdir -p out/odt
	pandoc -s $(FILES) -o out/odt/Article.odt \
	--template=templates/template.fodt
#	--reference-doc=templates/template.

clean : 
	rm -r out