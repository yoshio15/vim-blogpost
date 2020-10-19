" 1. :BlogPostコマンドで起動
command! -nargs=1 BlogPost call BlogPost(<f-args>)

" main関数
function! BlogPost(foldername)
  let newBaseDir = expand('<sfile>:p:h') . '/test/'
  echo 'New Base PATH: ' . newBaseDir
  echo 'New Folder Name: ' . a:foldername
  let s:newDirPath = newBaseDir . a:foldername
  echo 'New Directory Path: ' . s:newDirPath
  call MakeNewCategoryDir(s:newDirPath)
endfunction

" 2 yoshionote/contents/ 配下に {任意の名前}/ フォルダ作成
function! s:MakeNewCategoryDir(newDirPath)
  echo 'New Directory PATH: ' . a:newDirPath
  " call mkdir(a:folderpath, "p")
  call MakeImagesDir(a:newDirPath)
endfunction

" 3. yoshionote/contents/{任意の名前}/ 配下に images/ フォルダ作成
function! s:MakeImagesDir(newfolderpath)
  let imagesDir = a:newfolderpath . '/images'
  echo 'New images Directory PATH: ' . imagesDir
  " call mkdir(imagesDir, "p")
endfunction

" 4. yoshionote/contents/{任意の名前}/ 配下に {任意の名前}.md ファイル作成
" 5. {任意の名前}.md ファイルの中にテンプレートを書き込む
