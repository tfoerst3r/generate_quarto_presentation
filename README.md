# Introduction

The main purpose of this repo is the make the generation of a default template project generator for quarto presentations, with an emphasis on top-row presentations (more PowerPoint-like).

# Installation

Those files build a bash script, which creates folders and a file structure to get started with your `quarto` presentation, incl. a custom style sheet and logo. To add more flexibility one additional scss file needs to be given besides your base template can be added. 

```
$> ./script.sh [name of your additional scss file]
```

**Example**

```
$> ./script.sh hifis
```

Second, you should mv the generated file (default file name is `generate_quarto_presentation`) in a location which is part of the `$PATH` variable, most likely `~/bin`.

**Example of the valid location on your Linux system**

```
$> mv generate_quarto_presentation ~/bin/
```

# Usage of the bash script

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

    ```
    .
    ├── custom
    │   ├── fonts
    |   ├── images
    |   |   └── logo.png
    |   ├── plugins
    │   ├── templates
    │   └── themes
    │       ├── additional.scss
    │       └── default.scss
    ├── images
    ├── index.qmd
    └── ref.bib
    ```

You could simply replace the `additional.scss` with your own settings.    
