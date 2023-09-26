#!/usr/bin/env bash

# SPDX-FileCopyrightText: Copyright (c) 2023 Thomas Foerster
# SPDX-License-Identifier: MIT
output=generate_quarto_presentation

#---------------------#
header_file=header.txt
qmd_slide_file=slides.qmd
scss_file=quarto.scss
readme_file=readme.txt
function_file=functions.sh
main_file=main.sh





#---------------------#
name_qmd_script=qmd_script
name_quarto_scss_script=quarto_scss_script
name_readme=readme_content
#---------------------#



echo "#!/usr/bin/env bash

# SPDX-FileCopyrightText: Copyright (c) 2023 Thomas Foerster
# SPDX-License-Identifier: MIT

#===== VARIABLES =====#
folder_slides=c_slides
qmd_file=index.qmd
quarto_scss_file=default.scss

#-----------------------#
" > $output

#---------------------#
echo "$name_qmd_script=\"" >> $output
cat $qmd_slide_file >> $output
echo '"' >> $output
echo '#-----------------------#' >> $output

#--------------------------#
#-- Add scss to the script
#--------------------------#
echo "$name_quarto_scss_script=\"" >> $output
#-- replace $ with \$
sed 's/\\/\\\\/g' $scss_file | sed 's/\$/\\\$/g' >> $output
echo "\"" >> $output
#--------------------------#

echo "$name_readme=\"" >> $output
cat $readme_file >> $output
echo '"' >> $output

#---------------------#
echo "#===== FUNCTIONS =====#
" >> $output
cat $function_file >> $output

#---------------------#
echo "
#=======================#
#===== MAIN SCRIPT =====#
#=======================#
    
#-- Argument parser --#
argparser \$@

if [ -z \"\$(ls -A .)\" ]; then

    base_structure
    slide_structure
else
    msg_not_empty
fi
" >> $output

chmod 755 $output

