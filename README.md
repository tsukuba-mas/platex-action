platex-action
---

[platex-action](https://github.com/tsukuba-mas/platex-action) is a GitHub Action that compiles TeX files and create the PDF.

[Japanese README](README.ja.md)

## Description

platex-action compiles your TeX files on GitHub and create the PDF.  
You specify the name of the TeX file you want to compile as `LATEX_FILE_NAME`.  

Note that platex-action **only** compiles your Tex files and create the PDF.  
You can easily upload your compiled PDF to GitHub Release with `Release Action` created by GitHub Official.  

## Usage

We call a repository where your TeX files are located `X`.

In the X' repository, you should create `main.yml` in `.github/workflows` directory.  
However, it does not have to be named `main.yml`, but can be `tex.yml` or something similar.

In the YAML file you made, you write the following.  
Please specify the name fo Tex file which is located in X's repository as `LATEX_FILE_NAME`.

```yml
# The Example of Compiling LaTeX File
# In your latex repository, make .github/workflows/main.yml like below.
# You only have to change `LATEX_FILE_NAME` as your tex file.

on:
  push:
    tags:
      - "v*"

jobs:
  test_job:
    runs-on: ubuntu-latest
    name: Example of compiling pdf
    steps:
      # make pdf
      # LATEX_FILE_NAME -> main.pdf generated
      - name: Set up Git repository
        uses: actions/checkout@v2
      - name: Compile Tex File
        id: compile_tex_file
        uses: tsukuba-mas/platex-action@main
        with:
          LATEX_FILE_NAME: "main.tex"
      # Create Release
      - name: Create Release
        id: create_release
        uses: actions/create-release@v1
        env:
          GITHUB_TOKEN: ${{secrets.GITHUB_TOKEN}}
        with:
          tag_name: ${{github.ref}}
          release_name: Release ${{ github.ref }}
          body: |
            Compiled PDF ${{github.ref}}
          draft: false
          prerelease: false
      # Upload Asset main.pdf
      - name: Upload Release Asset
        id: upload_release_asset
        uses: actions/upload-release-asset@v1
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        with:
          upload_url: ${{ steps.create_release.outputs.upload_url }}
          asset_path: ./main.pdf
          asset_name: main.pdf
          asset_content_type: application/pdf
```

`secrets.GITHUB_TOKEN` and `github.ref` are automatically set by GitHub, so users do not need to set by themselves.  
Therefore, you only need to change `LATEX_FILE_NAME`.

After that, if you push tag `vX.X.X` to GitHub, the PDF will be created at GitHub Releases.
