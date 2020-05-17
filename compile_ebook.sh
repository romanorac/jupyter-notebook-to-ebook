#!/bin/bash

nbmerge Chapter1.ipynb Chapter2.ipynb  > Ebook.ipynb
jupyter nbconvert --to html Ebook.ipynb --template=basic
/Applications/calibre.app/Contents/MacOS/ebook-convert Ebook.html Ebook.epub
/Applications/calibre.app/Contents/MacOS/ebook-convert Ebook.html Ebook.azw3


jupyter nbconvert --to html Chapter1.ipynb
jupyter nbconvert --to html Chapter2.ipynb

wkhtmltopdf --enable-internal-links -L 10mm -R 9.5mm -T 10mm -B 9.5mm Chapter1.html Chapter1.pdf
wkhtmltopdf --enable-internal-links -L 10mm -R 9.5mm -T 10mm -B 9.5mm Chapter2.html Chapter2.pdf

./cpdf Chapter1.pdf Chapter2.pdf -o Ebook.pdf 
