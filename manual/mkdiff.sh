#! /bin/bash

# script to track changes in *.tex files. Uses latexdiff.
# Get it from here:
# 
#   http://www.ctan.org/get/support/latexdiff.zip
#
# Requires the old documentation tree in
#   docs-old/manual/en
# 
# and the new tree in
#   docs/manual/en
#
# The diff tree will be created in
#   docs-diff/manual/en
# 
# Nic Doebelin

rm -rf ../../docs-diff
mkdir -p ../../docs-diff/manual/en
cp -r images ../../docs-diff/manual/
cp en/titlepage.pdf ../../docs-diff/manual/en/
cp en/titlepage-author.pdf ../../docs-diff/manual/en/

for file in en/*.tex; do
	bname=`basename $file .tex`
	echo $bname
	latexdiff ../../docs-old/manual/en/$bname.tex en/$bname.tex > ../../docs-diff/manual/en/$bname.tex
done

cd ../../docs-diff/manual/en
pdflatex traverso-manual01.tex
pdflatex traverso-manual01.tex
pdflatex traverso-manual01.tex
okular traverso-manual01.pdf
