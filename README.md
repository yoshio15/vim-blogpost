# vim-blogpost

ブログ投稿用のテンプレートファイル/ディレクトリを作成する。

## 概要
vim-blogpostは、[gatsby-starter-bee](https://github.com/JaeYeopHan/gatsby-starter-bee)テンプレート上で新しい記事を簡単に作成してくれるプラグイン。  

## 使用方法

### 1. vimrcにベースパスを設定
```vim
let g:blogpost_base_path = '~/{記事を投稿したいパス}/'
```

### 2. Vim上でコマンド実行
引数1つ目に「カテゴリ名」、2つ目に「作成したいファイル名( `.md` は除く)」を指定する。
```vim
:BlogPost {カテゴリ名} {作成したいファイル名}
```
※ 指定したカテゴリ名のディレクトリが存在しない場合は自動で新規作成してくれる。
