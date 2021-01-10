
platex-action

---

[platex-action](https://github.com/tsukuba-mas/platex-action)はTeXファイルをコンパイルしてPDFを作成するGitHub Actionです。

## Description

platex-actionは、GitHub上であなたのTeXファイルをコンパイルし、`main.pdf`を作成します。  
コンパイルしたいTeXファイルの名前は`LATEX_FILE_NAME`で指定します。  

注意点として、platex-actionはTeXファイルのコンパイルならびにPDFの作成のみを行います。  
GitHubの公式が作成している`Release Action`を併用することでコンパイルしたPDFを簡単にReleaseにアップロードできます。  

## Usage

あなたのTeXファイルが置かれているリポジトリをXと呼ぶことにします。

Xのリポジトリにおいて、`.github/workflows`ディレクトリに`main.yml`ファイルを作成します。  
ただし、`main.yml`という名前である必要はなく`tex.yml`などでも構いません。  

作成したYAMLファイルに以下のように記述します。  
`LATEX_FILE_NAME`にはXのリポジトリにあるTeXファイルの名前を指定してください。

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

`secrets.GITHUB_TOKEN`や`github.ref`などは、GitHub側で自動設定されるため、ユーザが設定を行う必要はありません。  
そのため、`LATEX_FILE_NAME`のみの変更で良いはずです。

あとはGitHubにタグ`vX.X.X`をプッシュすると自動でGitHub ReleasesにPDFが作成されます。

## Example

[tsukuba-mas/how-to-revise](https://github.com/tsukuba-mas/how-to-revise)

## Licence

[MIT](https://github.com/tcnksm/tool/blob/master/LICENCE)

## Author

Tsukuba Multi Agent System Research Lab
