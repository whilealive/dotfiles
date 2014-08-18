" ==================================================================
" FILE     .vimrc
" MACHINE  all
" INFO     minimalistic
"
" DATE     17.08.2014
" OWNER    Bischofberger
" ==================================================================


" ----------------
" general settings
" ----------------
set ttyfast                 "fast terminal connection
set nocompatible            "no vi-compatible modus
set autowrite               "automatically writes when switching buffers, :wnext not necessary
filetype plugin indent on
syntax enable
set mouse=a                 "now works properly with st/tmux 


" -------------------
" writing and reading
" -------------------
set showmode                "shows, in which mode you are currently in
set showmatch               "shows the opening bracket when typing )}]
set showcmd                 "for longer commands in command mode
set ruler                   "shows row/column number of the cursor
set nojoinspaces            "insert only one space after .,?!
set cpo+=$                  "shows the end of the text to be changed when pressing c
set whichwrap=""            "don't exceed the end of the line with the cursor
set hlsearch                "highlight searching results
set clipboard=unnamedplus   "alias unnamed register to the + register, which is the X Window clipboard


" ----------------------
" file and path managing
" ----------------------
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
set wildchar=<Tab> wildmenu wildmode=full     "wildmenu activation (good for buffer switching)
" Allows writing to files with root priviledges
cmap w!! w !sudo tee % > /dev/null
" super-fast tab switching:
nnoremap <Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprevious<CR>


" ---------------
" tabs and indent
" ---------------
set autoindent              "automatically indent lines to previous lines
set shiftwidth=2            "autoindent indents 4 inits (= 1 tab)
set tabstop=2               "tabstop length
set softtabstop=2           "softtabstop length
set noexpandtab             "do not fill up with spaces, use TAB
"set expandtab               "fill up with spaces when pressing <tab>


" ------
" layout
" ------
colorscheme bruno-custom    "my personal color scheme
set cursorline              "cursorline, sometimes pretty slow...
set number                  "show line numbers


" ------------------
" the <F-XX> keys...
" ------------------
"F2: brackets as I like them
imap <F2> <CR>{<CR>}<Esc>O
"F3: timestamp for title
nnoremap <F3> D"=strftime("DATE     %d.%m.%Y")<CR>p
"F4: latex - insert \end{blah}
imap <F4> <Esc>yyplcwend<Esc>O


" --------------
" configure tags
" --------------
"set tags+=~/.vim/tags/systags  "all C system headers
