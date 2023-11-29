# Introduction

The main purpose of this repo is the make the generation of a default template project generator for quarto presentations, with an emphasis on top-row presentations (more PowerPoint-like).

# Installation

The script `script.sh` creates a script `generation_quarto_presentation` which on the other hand will generate for you the folders and a file structure to get quickly started with your `quarto` presentation. This includes a custom style sheet and logo. To add more flexibility one additional scss file needs to be given besides your base template can be added. To be more flexible, the components of the script are stored in the `src`.

**Syntax**

```
$> ./script.sh [name of your additional scss file]
```

**Example**

```
$> ./script.sh hifis
```

Second, you should mv the generated file (default file name is `generate_quarto_presentation`) in a location which is part of the `$PATH` variable, most likely `~/bin`. You can check your content of the `$PATH` variable by using `echo` (`$ echo $PATH`).

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

You could simply replace or adapt the `additional.scss` (or even the `default.scss`) file to your needs with your own settings. If you want to use a default `revealjs` template just simple change it in the Metablock in the `index.qmd` file. For more information on custom style sheets see [link](https://quarto.org/docs/presentations/revealjs/themes.html).
