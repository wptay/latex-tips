@ECHO OFF

REM Change this accordingly
set BIBINPUTS=.\bib
REM

set /P target=Enter target: 
set lrefaux=lref-%target%.aux
set lrefbbl=lref-%target%.bbl
@ECHO %lrefaux%, %lrefbbl%
pause

latex %target%
bibtex lref.aux
latex %target%
bibtex lref.aux
copy lref.aux %lrefaux%
copy lref.bbl %lrefbbl%
latex %target%
latex %target%
latex %target%
pdflatex -synctex=-1 -interaction=nonstopmode %target%
