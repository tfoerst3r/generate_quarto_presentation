#===== FUNCTIONS =====#

function base_structure(){

mkdir \
    a_literature \
    b_raw-data \
    $folder_slides \
    d_orga
echo "$readme_content" > README.md
echo "$abstract_content" > ABSTRACT.md

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
convert -size 100x60 xc:none -fill "#002864" -draw "rectangle 0,0 100,20 rectangle 0,40 100,60" $images_folder/logo.png

touch reference.bib

echo $titlepage > "$images_folder/titlepage.svg"
echo "$quarto_scss_script" > "$theme_folder/$file_quarto_scss"
echo "$quarto_scss_script_add" > "$theme_folder/$file_quarto_add_scss"

}

#-----------------------#

function slide_structure(){
mkdir \
    images
echo "$qmd_script" > $file_qmd
#-- structure of the custom folder
custom_structure
}

#-----------------------#

function generate_abstract {
echo $abstract > $abstractfile
}


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
}

#-----------------------#

function argparser {
while [ -n "$1" ]; do
  case $1 in
    -h        | --help  ) printhelp && exit 0 ;;
                --solo  ) solo=true; shift ;;
    -*                  ) msg "unknown option (ignored): $1" && exit 1 ;;
    --                  ) shift; break ;;
    *                   ) break ;;
  esac
done
}

#-----------------------#

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
 -h   --help     print help message and exit
      --solo     only the presentation structure
   
DESCRIPTION: 
  ... 
EOM
}

