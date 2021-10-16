set exrc
set secure
filetype plugin on
autocmd Filetype cpp source ~/.vimrcs/.cppvimrc
set tabstop=4
set softtabstop=4
set shiftwidth=4
command ShowWhitespaceChars :set list listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:_

"Set the background search highlighting from yellow to dark red
hi Search ctermbg=DarkRed
