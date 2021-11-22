#!/bin/bash

set +v

# Change this accordingly
export BIBINPUTS='.\bib'
#

read -p 'Enter target: ' target
lrefaux=lref-$target.aux
lrefbbl=lref-$target.bbl
# echo $lrefaux, $lrefbbl
# read -p "Press enter to continue"

latex $target
bibtex lref.aux
latex $target
bibtex lref.aux
cp lref.aux $lrefaux
cp lref.bbl $lrefbbl
latex $target
latex $target
latex $target
pdflatex -synctex=-1 -interaction=nonstopmode $target
rm $target.dvi