" .VIMRC by Julian, using Vim Plug plugin manager
  set viminfo+=n~/.vim/viminfo


    """"""""""""""""""""""""""""""""
    """"     VIM Plug Setup     """"
    """"""""""""""""""""""""""""""""

" Vim Plug

  if empty(glob('~/.config/vim/autoload/plug.vim'))
      silent !curl -fLo ~/.config/vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif

  call plug#begin('~/.config/vim/plugged')
      Plug 'mattn/emmet-vim'
      Plug 'junegunn/goyo.vim'
  call plug#end()


    """"""""""""""""""""""""""""""""
    """" Custom Stuff Goes Here """"
    """"""""""""""""""""""""""""""""

  " General
     syntax on 
    :set laststatus=2
    :set encoding=utf-8
    :set fileencoding=utf-8
    :set fileencodings=utf-8
    :set ttyfast
    :set title
    :set wildmenu
    :set nostartofline
    :set shortmess=atI
    :set history=1000
    :set lazyredraw
    :set noshowmatch
    :set belloff=all

  " :Q also works
    :command! Q :q

  " Fixing Line Breks
    :set wrap
    :set linebreak
    :set nolist  
    :set scrolloff=13

  " Also, tabbing
    :set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

  " And Shifting
    :set shiftround
    :set autoindent
    :set smartindent 
    :set cpoptions  +=I

  " Also, just set the numbering as default 
    :set number 
    :set relativenumber

  " Set Showmatch 
    :set showmatch
     hi  MatchParen cterm=bold ctermbg=blue ctermfg=white

  " Set Highlight Search
    :set hlsearch
     hi Search cterm=bold ctermfg=none ctermbg=darkgrey
    :set ic



    """""""""""""""""""""""""""""""""""
      """"""" FILE REMAPPINGS """"""
    """""""""""""""""""""""""""""""""""

  " Escape Key Remapping
    :inoremap <silent> hl <C-c>:stopinsert<cr>l
    :vnoremap <silent> hl <C-c>:stopinsert<cr>l

  " Better Copy-Paste (Ctrl-C, Ctrl-P, a to go to 
  " the end of the current line)
  " ALSO added Ctrl-X
    :vnoremap <c-c> y
    :inoremap <c-v> <s-p>
    :vnoremap a <c-$>
    :vnoremap <c-x> d

  " Visual Visual Mode 
    :vnoremap <c-v> <c-q>
  
  " Ctrl-w+q to save and exit
    :nnoremap <c-w><c-q> :w!<CR>:q<CR>

  " Ctrl-Z and Ctrl-Y
    :nnoremap <c-z> u
    :nnoremap <c-y> <c-r>

  " Ctrl-S
    :nnoremap <c-s> :w<CR>
    :vnoremap <c-s> :w<CR>
    :inoremap <c-s> <ESC>:w<CR>

  " Ctrl-l and Ctrl-h moving 
  " forwards and backwards by
  " a word at a time
    ":nnoremap <s-h> b
    ":nnoremap <s-l> w

  " Ammend Line
    :nnoremap <c-a> <s-$>a
    ":nnoremap <c-o> <CR>o

  " Make searches case insensitive by default 
  " (as cool as this is, I am going
  "  to just use the :set ic)
    ":nnoremap / /\c
    ":nnoremap ? ?\c

  " Highlight as pattern is typed
    :set incsearch

  " Speaking of searches... Ctrl-f
    :nnoremap <c-f> /

  " Tab Multiple Lines in Visual
    :vnoremap <tab> >vgv
    :vnoremap <s-tab> <vgv

  " Select Whole Doc
    :vnoremap <c-a> <esc>ggvGa

  " Easier Split Navigation
    :nnoremap <c-j> <C-W><C-J>
    :nnoremap <c-k> <C-W><C-K>
    :nnoremap <c-l> <C-W><C-L>
    :nnoremap <c-h> <C-W><C-H>

  " Arrow movements resize splits
    :nnoremap <s-j> :resize +2<CR>
    :nnoremap <s-k> :resize -2<CR>
    :nnoremap <s-h> :vertical resize +2<CR>
    :nnoremap <s-l> :vertical resize -2<CR>

  " Tab Cycle Through Splits
    :nnoremap <tab> <c-w><c-w>

  " Remove Arrow Key Functionality
    :noremap <Left> :echo "No left for you!"<CR>
    :noremap <Right> :echo "No right for you!"<CR>
    :noremap <Up> :echo "No up for you!"<CR>
    :noremap <Down> :echo "No down for you!"<CR>
  " visual
    :inoremap <Left> <nop>
    :inoremap <Right> <nop>
    :inoremap <Up> <nop>
    :inoremap <Down> <nop>

  " Remove the... hl functionality...
    :nnoremap h F
    :nnoremap l f

  " Make hjkl Graphical as default
    :nnoremap j gj
    :nnoremap k gk
    :vnoremap j gj
    :vnoremap k gk
  
  " Make things Centered
    :nnoremap G Gzz
  
  " 'd' Deletes, Doesn't Cut
    nnoremap d "_d
    vnoremap d "_d

  " Causes splits to go to the 
  " right and below etc.
    set splitbelow 
    set splitright 






    """""""""""""""""""""""""""
    """ Status Bar Settings """
    """""""""""""""""""""""""""
    set statusline=\ \ \ 
    set statusline+=Julian\ VIM
    set statusline+=\ \ \ \ \ \ 
    set statusline+=%F%m%r%h%w\ 
    set statusline+=\ \ \ \ \ \ 
    set statusline+=File\ Type\:\ %Y
    set statusline+=\ \ \ \ \ \ 
    set statusline+=File\ Pos\:\ %p%%
    set statusline+=\ \ \ \ \ \ 
    set statusline+=Files\ Open\:\ %n\ \   
    set statusline+=%=%{strftime('%c')}
    set statusline+=\ \ \ \ \ 

    
    " File-Specific Things
      " Web
        autocmd BufNewFile,BufRead *.html       :so ~/.vim/src/web.vim
        autocmd BufNewFile,BufRead *.css        :so ~/.vim/src/web.vim
        autocmd BufNewFile,BufRead *.php        :so ~/.vim/src/web.vim
      " Text
        autocmd BufNewFile,BufRead *.txt        :so ~/.vim/src/txt.vim
        autocmd BufNewFile,BufRead *.md         :so ~/.vim/src/txt.vim
        autocmd BufNewFile,BufRead *.markdown   :so ~/.vim/src/txt.vim
        autocmd BufNewFile,BufRead neomutt*     :so ~/.vim/src/txt.vim
      " Notes
        autocmd BufNewFile,BufRead *.note       :so ~/.vim/src/not.vim

    """""""""""""""""""""""""""""""""""""""""""""""""""
    "      Keep this at the bottom of the file!       "
    " Little Spell Check - update through the command "
    "           :!spell <wrong> <correct>             "
    """""""""""""""""""""""""""""""""""""""""""""""""""

" Signature ~ Unrelated to spelling, just neat 
  :iabbrev mailtof Hi NAME, <cr><cr>QW<cr><cr>Kind regards, <cr><cr>Julian Orchard ~<cr><cr>julian.marketing<cr>contact@julians.email<esc>? NAME<esc>c2w
  :iabbrev mailtoi Hi NAME, <cr><cr>QW<cr><cr>Many thanks, <cr><cr>Julian ~<cr><cr>julian.marketing<cr>contact@julians.email<esc>? NAME<esc>c2w
  :iabbrev mailtol Hi NAME, <cr><cr>QW<cr><cr>Love, <cr><cr>Julian ~<cr><cr>julian.marketing<cr>contact@julians.email<esc>? NAME<esc>c2w
  :iabbrev signf <cr>Kind Regards,<cr><cr>Julian Orchard ~ contact@julians.email
  :iabbrev signi <cr>Many thanks,<cr><cr>Julian ~ contact@julians.email

" Timestamp F5
  nmap <F5> a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
  imap <F5> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

" Added automatically by 'spell' script
  :command Spell :set spell
" EDIT: I know this is already a build in 
" feature but I'm keeping this anyway.
  :iabbrev adn and
  :iabbrev Adn And
  :iabbrev maintainence maintenance
  :iabbrev Maintainence Maintenance
  :iabbrev flipendo fli<space>fli<space>flip<space>flipendooo
  :iabbrev excersise exercise
  :iabbrev Excersise Exercise
  :iabbrev exersise exercise
  :iabbrev Exersise Exercise
  :iabbrev apologize apologise
  :iabbrev Apologize Apologise
  :iabbrev proffessor professor
  :iabbrev Proffessor Professor
  :iabbrev febuary February
  :iabbrev Febuary February
  :iabbrev sissors scissors
  :iabbrev Sissors Scissors
  :iabbrev indesign InDesign
  :iabbrev elicite elicit
  :iabbrev Elicite Elicit
  :iabbrev didnt didn't
  :iabbrev Didnt Didn't
  :iabbrev independant independent
  :iabbrev Independant Independent
  :iabbrev resiliant resilient
  :iabbrev Resiliant Resilient
  :iabbrev Janruary January
