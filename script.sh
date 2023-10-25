#!/usr/bin/env bash

# SPDX-FileCopyrightText: Copyright (c) 2023 Thomas Foerster
# SPDX-License-Identifier: MIT
output=generate_quarto_presentation

#-- INPUT -------------------#
header_file=header.txt
qmd_slide_file=slides.qmd
scss_file=quarto.scss
readme_file=README.txt
function_file=functions.sh
main_file=main.sh


#-- CONFIG ------------------#
folder_slides=c_slides
file_qmd=index.qmd
file_quarto_scss=default.scss

#---------------------#
name_qmd_script=qmd_script
name_quarto_scss_script=quarto_scss_script
name_readme=readme_content


#== (1) Add script header
bash header.sh $folder_slides $file_qmd $file_quarto_scss > $output

#== (2) Add qmd base input to the script
echo "$name_qmd_script=\"" >> $output
cat $qmd_slide_file >> $output
echo '"' >> $output
echo '#-----------------------#' >> $output

#== (3) Add scss content to the script
echo "$name_quarto_scss_script=\"" >> $output

#-- (3.1) replace $ with \$
sed 's/\\/\\\\/g' $scss_file | sed 's/\$/\\\$/g' >> $output
echo "\"" >> $output

#== (4) Add readme content to the script
echo "$name_readme=\"" >> $output
cat $readme_file >> $output
echo '"' >> $output

#== (5) Add functions to the script
cat $function_file >> $output

#== (6) Add main routine to the script
echo "
#=======================#
#===== MAIN SCRIPT =====#
#=======================#
    
#-- Argument parser --#
argparser \$@

if [ -z \"\$(ls -A .)\" ]; then
  if [ "\$solo" = true ]; then
    
    slide_structure
    echo \"\$readme_content\" > README.md

  elif [ "\$solo" = false ]; then

    base_structure
    cd \$folder_slides
    slide_structure

  fi
else
    msg_not_empty
fi
" >> $output

#-- (6.1) Change output to an executable for the current user
chmod 755 $output

