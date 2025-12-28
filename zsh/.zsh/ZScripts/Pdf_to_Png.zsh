#!/usr/bin/env zsh

pdf_file=$1
png_file="${pdf_file:t:r}"
echo "$pdf_file to png"
pdftoppm -png $pdf_file $png_file
ls -ltr *.png
