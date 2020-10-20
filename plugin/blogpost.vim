" :BlogPostコマンドで起動
command! -nargs=1 BlogPost call BlogPost(<f-args>)

" main関数
function! BlogPost(foldername)
  let s:baseDir = expand('<sfile>:p:h') . '/test/'
  echo 'Base Directory: ' . s:baseDir
  let s:newDirPath = s:baseDir . a:foldername
  call s:makeDirectories(s:newDirPath)
  call s:createMdFile(s:newDirPath)
endfunction

" 必要なフォルダが存在していなければ作成する
function! s:makeDirectories(newDirPath)

  if !isdirectory(a:newDirPath)
    echo '[' . a:newDirPath . '] created'
    call mkdir(a:newDirPath, "p")
    call s:MakeImagesDir(a:newDirPath)
  else
    echo '[' . a:newDirPath . '] already exists'
  endif

  let s:imagesDir = a:newDirPath . '/images'
  if !isdirectory(s:imagesDir)
    echo '[' . s:imagesDir . '] created'
    call mkdir(s:imagesDir, "p")
  else
    echo '[' . s:imagesDir . '] already exists'
  endif

endfunction

" {任意の名前}.md ファイル作成
function! s:createMdFile(folderpath)
  let s:outputfile = a:folderpath . '/test.md'
  if !filereadable(s:outputfile)
    execute 'redir! > ' . s:outputfile
      echo '---'
      echo "title: ''"
      echo 'date: ' . strftime("%F %T")
      echo "category: 'development'"
      echo 'draft: true'
      echo '---'
    redir END
    echo '[' . s:outputfile . '] created'
  else
    echo '[' . s:outputfile . '] already exists'
  endif
endfunction
