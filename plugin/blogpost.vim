" 1. :BlogPostコマンドで起動
" 2. yoshionote/contents/ 配下に {任意の名前}/ フォルダ作成
" 3. yoshionote/contents/ 配下に images/ フォルダ作成
" 4. yoshionote/contents/{任意の名前}/ 配下に {任意の名前}.md ファイル作成
" 5. {任意の名前}.md ファイルの中にテンプレートを書き込む

command! -nargs=1 BlogPost call BlogPost(<f-args>)
function! BlogPost(foldername)
  let newDir = expand('<sfile>:p:h') . '/test/' . a:foldername
  echo 'New Directory PATH: ' . newDir
  call mkdir(newDir, "p")
endfunction

