" 1. :BlogPostコマンドで起動
command! -nargs=1 BlogPost call BlogPost(<f-args>)

" main関数
function! BlogPost(foldername)
  let newBaseDir = expand('<sfile>:p:h') . '/test/'
  echo 'New Base PATH: ' . newBaseDir
  echo 'New Folder Name: ' . a:foldername
  let s:newDirPath = newBaseDir . a:foldername
  echo 'New Directory Path: ' . s:newDirPath
  call s:MakeNewCategoryDir(s:newDirPath)
endfunction

" 2 yoshionote/contents/ 配下に {任意の名前}/ フォルダ作成
function! s:MakeNewCategoryDir(newDirPath)
  echo 'New Directory PATH: ' . a:newDirPath
  echo 'has already the Directory? :' . isdirectory(a:newDirPath)
  if !isdirectory(a:newDirPath)
    echo 'NO_DIRECTORY'
    call mkdir(a:newDirPath, "p")
    call s:MakeImagesDir(a:newDirPath)
  else
    echo 'THE DIRECTORY ALREADY EXISTS'
  endif
  call s:createMdFile(a:newDirPath)
endfunction

" 3. yoshionote/contents/{任意の名前}/ 配下に images/ フォルダ作成
function! s:MakeImagesDir(newfolderpath)
  let s:imagesDir = a:newfolderpath . '/images'
  echo 'New images Directory PATH: ' . s:imagesDir
  if !isdirectory(s:imagesDir)
    echo 'NO_IMAGES_DIRECTORY'
    call mkdir(s:imagesDir, "p")
  else
    echo 'IMAGES DIRECTORY ALREADY EXISTS'
  endif
  endif
endfunction

" 4. yoshionote/contents/{任意の名前}/ 配下に {任意の名前}.md ファイル作成
" 5. {任意の名前}.md ファイルの中にテンプレートを書き込む
function! s:createMdFile(folderpath)
  echo 'createMdFile'
  let s:outputfile = '/test.md'
  echo 'outputfile path: ' . a:folderpath . s:outputfile
  echo 'filereadable: ' . filereadable(a:folderpath . s:outputfile)
  if !filereadable(a:folderpath . s:outputfile)
    echo 'the file is not existed'
    execute 'redir! > ' . a:folderpath . s:outputfile
      echo '---'
      echo "title: ''"
      echo 'date: ' . strftime("%F %T")
      echo "category: 'development'"
      echo 'draft: true'
      echo '---'
    redir END
  else
    echo 'the file already exists'
  endif
endfunction
