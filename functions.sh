function base_structure(){

mkdir \
    a_literature \
    b_images \
    $folder_slides \
    d_orga
echo "$readme_content" > README.md

}

#-----------------------#

function custom_structure(){

local theme_folder="custom/themes"
local images_folder="custom/images"
mkdir -p \
    custom/fonts \
    custom/plugins \
    custom/templates \
    $theme_folder \
    $images_folder
convert -size 100x60 xc:none -fill "#005aa0" -draw "rectangle 0,0 100,20 rectangle 0,40 100,60" $images_folder/logo.png

touch ref.bib

echo "$quarto_scss_script" > "$theme_folder/$quarto_scss_file"

}

#-----------------------#


function slide_structure(){

cd $folder_slides

mkdir \
    images
echo "$qmd_script" > $qmd_file
#-- structure of the custom folder
custom_structure
}

#-----------------------#

function msg() {
    local scrname=$(basename "$0")
    echo "$scrname: $1" >&2
}


#-----------------------#

function msg_not_empty {
    echo "-----------------------------------"
    echo "-- Folder not empty! --------------"
    echo "-- Project will be NOT generate! --"
    echo "-----------------------------------"
    exit 1
}

#---------------------#

function argparser {
while [ -n "$1" ]; do
  case $1 in
    -h        | --help  ) printhelp && exit 0 ;;
    -*                  ) msg "unknown option (ignored): $1" && exit 1 ;;
    --                  ) shift; break ;;
    *                   ) break ;;
  esac
done
}

#---------------------#

function printhelp() {
cat <<-EOM

Generates a quarto presentation.

REQUIREMENTS:
  - quarto

USAGE: 
  project [OPTION] 

EXAMPLES:
  project pres
  project pres --help

OPTIONS:
 -h   --help           print help message and exit
   
DESCRIPTION: 
  ... 
EOM
}

