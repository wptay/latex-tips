@ECHO OFF

latex response
bibtex lref.aux
latex response
bibtex lref.aux
copy lref.aux lrefc.aux
copy lref.bbl lrefc.bbl
latex response
latex response
latex response
pdflatex -synctex=-1 -interaction=nonstopmode response
