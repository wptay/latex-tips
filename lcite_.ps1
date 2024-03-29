
# Change this accordingly
$env:BIBINPUTS = ".\bib"


$target = Read-Host "Enter target"
$lrefaux = "lref-$target.aux"
$lrefbbl = "lref-$target.bbl"
# Write-Host "$lrefaux, $lrefbbl"
# Read-Host -Prompt "Press Enter to continue"

latex $target
bibtex lref.aux
latex $target
bibtex lref.aux
Copy-Item lref.aux $lrefaux
Copy-Item lref.bbl $lrefbbl
latex $target
latex $target
latex $target
pdflatex -synctex=-1 -interaction=nonstopmode $target
Remove-Item "$target.dvi"
Remove-Item lref.aux
Remove-Item lref.bbl
Remove-Item lref.blg
