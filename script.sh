#!/usr/bin/env bash

# SPDX-FileCopyrightText: Copyright (c) 2023 Thomas Foerster
# SPDX-License-Identifier: MIT

output=generate_quarto_presentation
rootfolder=src

#-- INPUT -------------------#
template_qmd="./$rootfolder/slides.qmd"
template_scss="./$rootfolder/hifis.scss"
template_readme="./$rootfolder/template_README.md"
template_abstract="./$rootfolder/template_ABSTRACT.md"
file_function="./$rootfolder/functions.sh"
folder_for_slides_name=c_slides
file_qmd=index.qmd
file_quarto_scss_name=default.scss


#-- VARIABLES ------------------#
folder_slides_variable=folder_slides
file_qmd_variable=file_qmd
file_quarto_scss_variable=file_quarto_scss
solo_variable=solo

name_qmd_script=qmd_script
name_quarto_scss_script=quarto_scss_script
name_readme=readme_content
name_abstract=abstract_content


#==================================#
#== (1) Add header to $output
#bash $rootfolder/header.sh $folder_slides $file_qmd $file_quarto_scss > $output

cat $rootfolder/header.sh > $output
echo "$folder_slides_variable=$folder_for_slides_name" >> $output
echo "$file_qmd_variable=$file_qmd" >> $output
echo "$file_quarto_scss_variable=$file_quarto_scss_name" >> $output
echo "$solo_variable=false" >> $output
echo '' >> $output
echo '#-----------------------#' >> $output

#==================================#
#== (2) Add qmd base input to the script
echo "$name_qmd_script=\"\\" >> $output
cat $template_qmd >> $output
echo '"' >> $output
echo '#-----------------------#' >> $output

#==================================#
#== (3.1) Add scss content to the script
echo "$name_quarto_scss_script=\"\\" >> $output

#-- (3.2) replace $ with \$
sed 's/\\/\\\\/g' $template_scss | sed 's/\$/\\\$/g' >> $output
echo "\"" >> $output

#==================================#
#== (4.1) Add readme content to the script

#-- string input
echo "$name_readme=\"\\" >> $output
#-- content input
cat $template_readme >> $output
#-- string input
echo '"' >> $output

#== (4.2) Add abstract content to the script

#-- string input
echo "$name_abstract=\"\\" >> $output
#-- content input
cat $template_abstract >> $output
#-- string input
echo '"' >> $output


#==================================#
#== (5) Add functions to the script
cat $file_function >> $output
sed -i "s/folder_slides/$folder_slides_variable/" $output

#==================================#
#== (6) Add main routine to the script
echo "
#=======================#
#===== MAIN SCRIPT =====#
#=======================#
    
#-- Argument parser --#
argparser \$@

if [ -z \"\$(ls -A .)\" ]; then
  if [ "\$$solo_variable" = true ]; then
    
    slide_structure
    echo \"\$$name_readme\" > README.md

  elif [ "\$$solo_variable" = false ]; then

    base_structure
    cd \$$folder_slides_variable
    slide_structure

  fi
else
    msg_not_empty
    exit 1
fi
" >> $output

#-- (6.1) Change output to an executable for the current user
chmod 755 $output
#================================================#

