
" .VIMRC by Julian, using Vim Plug plugin manager
  set viminfo+=n~/.vim/viminfo


    """"""""""""""""""""""""""""""""
    """"     VIM Plug Setup     """"
    """"""""""""""""""""""""""""""""

" Vim Plug Autoload
" and check if Windows
  if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
      " Don't ask if files are actually there
        if empty(glob('~/_vim/autoload/plug.vim'))
          silent !curl -fLo ~\_vim\autoload\plug.vim --create-dirs
              \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
          autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
        endif  
      " File Specific
        autocmd BufNewFile,BufRead *.html       :so ~\.vim\src\web.vim
        autocmd BufNewFile,BufRead *.css        :so ~\.vim\src\web.vim
        autocmd BufNewFile,BufRead *.php        :so ~\.vim\src\web.vim
        autocmd BufNewFile,BufRead *.txt        :so ~\.vim\src\txt.vim
        autocmd BufNewFile,BufRead *.md         :so ~\.vim\src\txt.vim
        autocmd BufNewFile,BufRead *.markdown   :so ~\.vim\src\txt.vim
        autocmd BufNewFile,BufRead neomutt*     :so ~\.vim\src\txt.vim
        autocmd BufNewFile,BufRead *.note       :so ~\.vim\src\not.vim
    else
      if empty(glob('~/.vim/autoload/plug.vim'))
          silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
              \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
          autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
      endif
      " File Specific
        autocmd BufNewFile,BufRead *.html       :so ~/.vim/src/web.vim
        autocmd BufNewFile,BufRead *.css        :so ~/.vim/src/web.vim
        autocmd BufNewFile,BufRead *.php        :so ~/.vim/src/web.vim
        autocmd BufNewFile,BufRead *.txt        :so ~/.vim/src/txt.vim
        autocmd BufNewFile,BufRead *.md         :so ~/.vim/src/txt.vim
        autocmd BufNewFile,BufRead *.markdown   :so ~/.vim/src/txt.vim
        autocmd BufNewFile,BufRead neomutt*     :so ~/.vim/src/txt.vim
        autocmd BufNewFile,BufRead *.note       :so ~/.vim/src/not.vim
    endif
  endif
" Plug List
  call plug#begin('~/.vim/plugged')
    " Aesthetic
      Plug 'junegunn/goyo.vim'
    " Calendar
      Plug 'itchyny/calendar.vim'
    " Web
      Plug 'mattn/emmet-vim'
      Plug 'ap/vim-css-color'
    " Langs
      Plug 'sheerun/vim-polyglot'
    " NERDTree Stuff
      Plug 'preservim/nerdtree'
      Plug 'Xuyuanp/nerdtree-git-plugin'
      Plug 'ryanoasis/vim-devicons'
    " Airline
      Plug 'vim-airline/vim-airline'
    " Colourschemes
      Plug 'flazz/vim-colorschemes'
  call plug#end()

  " NERDTree on Startup
    "autocmd vimenter * NERDTree
  " NERDTree; if last tab open, close vim
     autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  " Show Hidden Files by Default
     let NERDTreeShowHidden=1

  " Colourscheme
   :colorscheme dracula

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
    :set mouse=
    :set ttymouse=
    :set guifont=RobotoMonoRegular\ Nerd\ Font\ 11

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
    :vnoremap <c-c> "+y
    :vnoremap a <c-$>
    :vnoremap <c-x> d
  " Just use the same clipboard as system
    :noremap  y "+y
    :noremap  p "+p

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
    :nnoremap d "_d
    :vnoremap d "_d

  " Causes splits to go to the 
  " right and below etc.
    set splitbelow 
    set splitright 

  " NERDTree Toggle
    :nnoremap <c-\> :NERDTreeToggle<cr>








    """""""""""""""""""""""""""
    """ Status Bar Settings """
    """""""""""""""""""""""""""
   "set statusline=\ \ \ 
   "set statusline+=Julian\ VIM
   "set statusline+=\ \ \ \ \ \ 
   "set statusline+=%F%m%r%h%w\ 
   "set statusline+=\ \ \ \ \ \ 
   "set statusline+=File\ Type\:\ %Y
   "set statusline+=\ \ \ \ \ \ 
   "set statusline+=File\ Pos\:\ %p%%
   "set statusline+=\ \ \ \ \ \ 
   "set statusline+=Files\ Open\:\ %n\ \   
   "set statusline+=%=%{strftime('%c')}
   "set statusline+=\ \ \ \ \ 

    

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

" F5 to timestamp
  nmap <F3> i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
  imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

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

