#!/bin/bash

# Directory paths
input_dir="/Users/vincent/Desktop/Printjobs"
output_dir="/Users/vincent/Desktop/Printjobs/Printouts"

libreoffice_path="/opt/homebrew/Caskroom/libreoffice/24.2.0/LibreOffice.app/Contents/MacOS/soffice"

# Convert PPTX to PDF using LibreOffice
for file in "$input_dir"/*.pptx; do
    if [[ -f "$file" ]]; then
        filename=$(basename -- "$file")
        filename_noext="${filename%.*}"
        pdf_file="$input_dir/${filename_noext}.pdf"

        # Convert PPTX to PDF using LibreOffice
        "$libreoffice_path" --headless --convert-to pdf "$file" --outdir "$input_dir"

        # Create A4 portrait file with 3 slides per page using psnup with a margin
        psnup -3 -pa4 -m 20 "$pdf_file" "$output_dir/${filename_noext}_3slides.pdf"

        # Remove input PPTX file
        rm "$file"

        rm "$pdf_file"
    fi
done

# Convert PPTX to PDF using LibreOffice
for file in "$input_dir"/*.pdf; do
    if [[ -f "$file" ]]; then
        filename=$(basename -- "$file")
        filename_noext="${filename%.*}"
        pdf_file="$input_dir/${filename_noext}.pdf"

        # Create A4 portrait file with 3 slides per page using psnup with a margin
        psnup -3 -pa4 -m 20 "$pdf_file" "$output_dir/${filename_noext}_printout.pdf"

        # Remove input PPTX file
        rm "$file"
    fi
done