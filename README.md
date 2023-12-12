# Introduction

The main purpose of this repo is to generate an executable shell script which on the other hand generates a ready-to-use structure for a quarto presentations. The emphasis is on top-row presentations (PowerPoint-like). 

The generated script is per default named `generate_quarto_presentation`. It will build a project structure including all the needed files included in the `src` folder (for easier adjustments).

# Installation

The `script.sh` routine creates a script `generation_quarto_presentation` which on the other hand will generate for you the folders and a file structure to get quickly started with your `quarto` presentation. To improve the development of the script, I decided to split the generation process into individual input files, which can be added using your favorite IDE (like vscode for the scss files in the `src` folder). Two custom `scss` files, the base `default.scss` and a second, based on `default.scss`, allow you to do minor adaptions to gain the necessary changes. When left empty it will use the default `emptry.scss` file.

 **Syntax**

```
$> ./script.sh [name of your additional scss file]
```

**Example**

```
$> ./script.sh hifis
```

Second, you can move the generated file by utilizing the `mv` bash routine (default file name is `generate_quarto_presentation`, which can be changed in `script.sh`) to a location part of the `$PATH` variable, most likely `~/bin`. You can check the content of the `$PATH` variable by using

```
$ echo $PATH
```

**Example of the valid location on your Linux system**

```
$> mv generate_quarto_presentation ~/bin/
```

# Usage of the bash script `generate_quarto_presentation`

`generate_quarto_presentation` generates the structure for a custom quarto presentation out of the box. This includes a custom style sheet and logo.
**Syntax**

```
$ generate_quarto_presentation [option]
```

**Example**

```
$ generate_quarto_presentation
$ tree
.
├── a_literature
├── b_images
├── c_slides
│   ├── custom
│   │   ├── fonts
│   │   ├── images
│   │   │   └── logo.png
│   │   ├── plugins
│   │   ├── templates
│   │   └── themes
│   │       ├── additional.scss
│   │       └── default.scss
│   ├── images
│   ├── index.qmd
│   └── ref.bib
├── d_orga
├── ABSTRACT.md
└── README.md
```

Available options are: 

- `-h   --help` Help output
- `--solo` generates just the presentation structure

    ```bash
    .
    ├── custom
    │   ├── fonts
    │   ├── images
    │   │   └── logo.png
    │   ├── plugins
    │   ├── templates
    │   └── themes
    │       ├── additional.scss
    │       └── default.scss
    ├── images
    ├── index.qmd
    └── ref.bib
    ```
    
You could simply replace or adapt the `additional.scss` or even the `default.scss` to your needs. If you want to use a default `revealjs` template just simple change it in the metablock in the `index.qmd` file. 

**Example**

You can change the theme by using `theme: [your chosen theme]` option.

```
---
title: "Presentation"
format:
  revealjs: 
    theme: dark
...
---
```

For more information on custom style sheets see [link](https://quarto.org/docs/presentations/revealjs/themes.html).

# Example Presentation

An example can be found [here](https://tfoerst3r.github.io/generate_quarto_presentation/).

