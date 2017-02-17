" ==================================================================
" FILE     dmenu.vim
" MACHINE  all
" INFO     plugin: use dmenu to open files quickly in vim
"
" DATE     16.02.2017
" OWNER    Bischofberger
" ==================================================================

"Strip the newline from the end of a string
function! Chomp(str)
	return substitute(a:str, '\n$', '', '')
endfunction

"Find a file and pass it to cmd
function! DmenuOpen(cmd,type)
	if (a:type == "git")
		let fname = Chomp(system("git ls-files | dmenu -i -l 20 -p " . a:cmd))
	else
		let fname = Chomp(system("find . 
          \! -path '*/\.*' 
          \! -path '*/*.jpg' 
          \! -path '*/*.pdf' 
          \! -path '*/*.toc' 
          \! -path '*/*.aux' 
          \! -path '*/*.log' 
          \! -path '*/*.fls' 
          \! -path '*/*.fdb_latexmk' 
          \| sort | dmenu -i -l 20 -p " . a:cmd))
	endif
	if empty(fname)
		return
	endif
	execute a:cmd . " " . fname
endfunction

" Mappings
map <c-f> :call DmenuOpen("e", "")<cr>
map <c-g> :call DmenuOpen("e", "git")<cr>
"map <c-t> :call DmenuOpen("tabe", "")<cr>

