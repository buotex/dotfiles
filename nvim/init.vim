" ============= Vim-Plug ============== "{{{
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif

if g:os == "Windows"
    let vimplug_exists=expand('~/Appdata/Local/nvim/autoload/plug.vim')
    let g:python3_host_prog=expand('~/miniconda3/envs/neovim/python.exe')
elseif g:os == "Linux"
    let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
    let g:python3_host_prog = expand('~/.pyenv/versions/neovim/bin/python3')
endif

let g:vim_bootstrap_langs = "c,erlang,go"
let g:vim_bootstrap_editor = "nvim"				" Nvim or Vim

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"
  autocmd VimEnter * PlugInstall
endif

call plug#begin(expand('~/.config/nvim/plugged'))

"}}}

" ================= looks and GUI stuff ================== "{{{

Plug 'vim-airline/vim-airline'                          " airline status bar
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'                           " pretty icons everywhere
Plug 'luochen1990/rainbow'                              " rainbow parenthesis
" Plug 'hzchirs/vim-material'                             " material color themes
Plug 'morhetz/gruvbox'                                  " gruvbox theme
" Plug 'gregsexton/MatchTag'                              " highlight matching html tags

"}}}


" ================= Functionalities ================= "{{{

" auto completion, Lang servers and stuff
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'roxma/nvim-yarp'

" fuzzy stuff
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'urbainvaes/fzf-marks', { 'dir': '$HOME/.fzf-marks', 'do': 'echo source $HOME/.fzf-marks/fzf-marks.plugin.bash >> ~/.bashrc' }

" visual
" Plug 'alvan/vim-closetag'                               " auto close html tags
Plug 'Yggdroot/indentLine'                              " show indentation lines

" languages
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}  " better python
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'dense-analysis/ale'
Plug 'ncm2/ncm2-jedi'
Plug 'davidhalter/jedi-vim'
" Plug 'derekwyatt/vim-scala'
Plug 'JuliaEditorSupport/julia-vim'
" Plug 'neomake/neomake'
"Plug 'mattboehm/vim-unstack'
Plug 'skanehira/preview-markdown.vim'
Plug 'dhruvasagar/vim-table-mode'

" other
Plug 'vim-test/vim-test'
Plug 'mhinz/vim-startify'                               " cool start up screen
Plug 'airblade/vim-gitgutter'                               " git support
" Plug 'psliwka/vim-smoothie'                             " some very smooth ass scrolling
Plug 'farmergreg/vim-lastplace'                         " open files at the last edited place
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }

" other
" Plug 'sbdchd/neoformat'
" Plug 'terryma/vim-multiple-cursors'
Plug 'machakann/vim-highlightedyank'
" Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'lambdalisue/fern.vim'
Plug 'kassio/neoterm'

call plug#end()

"}}}


set termguicolors                                       " Opaque Background
set mouse=a                                             " enable mouse scrolling
set clipboard+=unnamedplus                              " use system clipboard by default
filetype plugin indent on                               " enable indentations
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab autoindent            " tab key actions
set incsearch ignorecase smartcase hlsearch             " highlight text while searching
set list listchars=trail:»,tab:»-                       " use tab to navigate in list mode
" set wrap breakindent                                    " wrap long lines to the width set by tw
set nowrap


set encoding=utf-8                                      " text encoding
set number                                              " enable numbers on the left
" set relativenumber                                      " current line is 0
set title                                               " tab title as file name
set noshowmode                                          " dont show current mode below statusline
set conceallevel=0                                      " set this so we wont break indentation plugin
set splitright                                          " open vertical split to the right
set splitbelow                                          " open horizontal split to the bottom
"set tw=90                                               " auto wrap lines that are longer than that
set emoji                                               " enable emojis
let g:indentLine_setConceal = 0                         " actually fix the annoying markdown links conversion
set history=1000                                        " history limit
set backspace=indent,eol,start                          " sensible backspacing
set undofile                                            " enable persistent undo
set undodir=/tmp                                        " undo temp file directory
set foldlevel=0                                         " open all folds by default
set inccommand=nosplit                                  " visual feedback while substituting
" allow external rc files
set exrc
set secure

" Python VirtualEnv
" let g:python_host_prog =  expand('/usr/bin/python')


" performance tweaks
set nocursorline
set nocursorcolumn
set scrolljump=5
"set redrawtime=1000
set synmaxcol=180
set re=1


" visuals
colorscheme gruvbox
let g:gruvbox_guisp_fallback = 'bg'

set background=dark " use dark mode
let g:airline_powerline_fonts = 1


" ======================== Plugin Configurations ======================== "{{{

"" built in plugins
let loaded_netrw = 0                                    " diable netew
let g:omni_sql_no_default_maps = 1                      " disable sql omni completion

" Airline
let g:airline_powerline_fonts = 1
let g:airline#themes#clean#palette = 1
call airline#parts#define_raw('linenr', '%l')
call airline#parts#define_accent('linenr', 'bold')
let g:airline_section_z = airline#section#create(['%3p%%  ',
            \ g:airline_symbols.linenr .' ', 'linenr', ':%c '])
let g:airline_section_warning = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_min_count = 2   " show tabline only if there is more than 1 buffer
let g:airline#extensions#tabline#fnamemod = ':t'        " show only file name on tabs

let test#strategy = "neoterm"
let g:neoterm_direct_open_repl = 0
let g:neoterm_autoinsert = 1
"let g:neoterm_autojump = 1
"let g:neoterm_autojump = 1
let g:neoterm_autoscroll = 1
let g:neoterm_keep_term_open = 0
let g:neoterm_callbacks = {}
function! g:neoterm_callbacks.before_new()
    if winwidth('.') > 100
        let g:neoterm_default_mod = 'botright vertical'
    else
        let g:neoterm_default_mod = 'botright'
    end
endfunction
noremap <F4> :TREPLSendFile<CR>
tnoremap <C-w> <C-\><C-n><C-w>
autocmd FileType python noremap <buffer> <F5> <ESC>:w<CR>:T python % <CR>
autocmd FileType python setlocal makeprg=pre-commit\ run\ --all
autocmd FileType julia noremap <buffer> <F5> <ESC>:w<CR>:T julia % <CR>
autocmd FileType markdown setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert



" indentLine
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_setColors = 0
let g:indentLine_setConceal = 0                         " actually fix the annoying markdown links conversion
let g:indentLine_fileTypeExclude = ['startify']

" jedi
let g:jedi#completions_enabled = 0
let g:jedi#environment_path = expand("$HOME/.pyenv/versions/neovim/bin/python3.9")
let g:jedi#goto_assignments_command = "<leader>ja"
let g:jedi#goto_command = "<leader>n"
let g:jedi#goto_stubs_command = "<leader>js"
let g:jedi#rename_command = "<leader>jr"
let g:jedi#usages_command= "<leader>ju"
let g:jedi#documentation_command = "<leader>jd"

" doge
let g:doge_doc_standard_python="google"


"" startify
let g:startify_padding_left = 10
let g:startify_session_persistence = 1
let g:startify_enable_special = 0
let g:startify_change_to_vcs_root = 1
let g:startify_lists = [
    \ { 'type': 'dir'       },
    \ { 'type': 'files'     },
    \ { 'type': 'sessions'  },
    \ { 'type': 'bookmarks' },
    \ { 'type': 'commands' },
    \ ]

" bookmark examples
let  g:startify_bookmarks =  [
    \ {'v': '~/.config/nvim'},
    \ {'d': '~/.dotfiles' }
    \ ]

" custom commands
let g:startify_commands = [
    \ {'ch':  ['Health Check', ':checkhealth']},
    \ {'ps': ['Plugins status', ':PlugStatus']},
    \ {'pu': ['Update vim plugins',':PlugUpdate | PlugUpgrade']},
    \ {'h':  ['Help', ':help']},
    \ ]

" custom banner
let g:startify_custom_header = [
 \ '',
 \ '                                                    ▟▙            ',
 \ '                                                    ▝▘            ',
 \ '            ██▃▅▇█▆▖  ▗▟████▙▖   ▄████▄   ██▄  ▄██  ██  ▗▟█▆▄▄▆█▙▖',
 \ '            ██▛▔ ▝██  ██▄▄▄▄██  ██▛▔▔▜██  ▝██  ██▘  ██  ██▛▜██▛▜██',
 \ '            ██    ██  ██▀▀▀▀▀▘  ██▖  ▗██   ▜█▙▟█▛   ██  ██  ██  ██',
 \ '            ██    ██  ▜█▙▄▄▄▟▊  ▀██▙▟██▀   ▝████▘   ██  ██  ██  ██',
 \ '            ▀▀    ▀▀   ▝▀▀▀▀▀     ▀▀▀▀       ▀▀     ▀▀  ▀▀  ▀▀  ▀▀',
 \ '',
 \ '',
 \ '',
 \]

" rainbow brackets
let g:rainbow_active = 1

" semshi settings
let g:semshi#error_sign	= v:false                       " let ms python lsp handle this

"" FZF
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }
let g:fzf_tags_command = 'ctags -R'

let $FZF_DEFAULT_OPTS = '--layout=reverse --inline-info'
let $FZF_DEFAULT_COMMAND = "rg --files --hidden --glob '!.git/**'"

let g:preview_markdown_auto_update = 1

"}}}

" ======================== Commands ============================= "{{{


autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

au BufEnter * set fo-=c fo-=r fo-=o                     " stop annoying auto commenting on new lines
autocmd BufEnter * call ncm2#enable_for_buffer()
autocmd FileType help wincmd L                          " open help in vertical split

" enable spell only if file type is normal text
let spellable = ['markdown', 'gitcommit', 'txt', 'text', 'liquid']
autocmd BufEnter * if index(spellable, &ft) < 0 | set nospell | else | set spell | endif


" autostart startify
augroup startifier

    " open startify on start
    autocmd VimEnter * if argc() == 0 | Startify | endif
augroup END
autocmd User Startified for key in ['e','n','i'] |
          \ execute 'nunmap <buffer>' key | endfor

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" python renaming
autocmd FileType python nnoremap <leader>rn :Semshi rename <CR>


" files in fzf
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--inline-info']}), <bang>0)

" advanced grep
command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)
set grepprg=rg\ --vimgrep

"}}}

" Fern browser
function! s:init_fern() abort
  " Use 'select' instead of 'edit' for default 'open' action
  nmap <buffer> <Plug>(fern-action-open) <Plug>(fern-action-open:select)
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END

" Disable netrw
let g:loaded_netrw             = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_netrwSettings     = 1
let g:loaded_netrwFileHandlers = 1

augroup my-fern-hijack
  autocmd!
  autocmd BufEnter * ++nested call s:hijack_directory()
augroup END

function! s:hijack_directory() abort
  let path = expand('%:p')
  if !isdirectory(path)
    return
  endif
  bwipeout %
  execute printf('Fern %s', fnameescape(path))
endfunction

" ================== Custom Functions ===================== "{{{

" advanced grep(faster with preview)
function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

" startify file icons
function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction



"}}}

" ======================== Custom Mappings ====================== "{{{

"" the essentials
"let mapleader="<space>"
map <space> <leader>
nmap \ <leader>q
map <F6> :Startify <CR>
nmap <leader>re :so $MYVIMRC<CR>
nmap <leader>q :bd<CR>
nmap <leader>w :w<CR>
" map <leader>fo :Format<CR>
nnoremap <C-W><PageDown> :bnext<CR>
nnoremap <C-W><PageUp> :bprevious<CR>

" new line in normal mode and back
map <Enter> o<ESC>
map <S-Enter> O<ESC>

" use a different register for delete and paste
" nnoremap d "_d
" vnoremap d "_d
" vnoremap p "_dP
" nnoremap x "_x

" emulate windows copy, cut behavior
vnoremap <LeftRelease> "+y<LeftRelease>
vnoremap <C-c> "+y<CR>
vnoremap <C-x> "+d<CR>

" switch between splits using ctrl + {h,j,k,l}
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
noremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" disable hl with 2 esc
noremap <silent><esc> <esc>:noh<CR><esc>

"" FZF
nnoremap <silent> <leader>f :Files<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>c :Commands<CR>
nmap <leader>t :BTags<CR>
nmap <leader>/ :Rg<CR>
nmap <leader>gc :Commits<CR>
nmap <leader>gs :GFiles?<CR>
nmap <leader>sh :History/<CR>

" show mapping on all modes with F8
nmap <F1> <plug>(fzf-maps-n)
imap <F1> <plug>(fzf-maps-i)
vmap <F1> <plug>(fzf-maps-x)


" Use `[g` and `]g` to navigate diagnostics
nmap [g <Plug>(ale_next_wrap)
nmap ]g <Plug>(ale_previous_wrap)

" other stuff
nmap <leader>o :OR <CR>

" fugitive mappings
nmap <leader>gd :Gdiffsplit<CR>
nmap <leader>gb :Gblame<CR>

" testing
nmap <leader>tn :TestNearest<CR>
nmap <leader>tf :TestFile<CR>
nmap <leader>tl :TestLast<CR>

" ALE settings
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_set_quickfix = 0
let g:ale_virtualenv_dir_names = []
let g:ale_linters = {
      \   'python': ['pyflakes'],
      \   'ruby': ['standardrb', 'rubocop'],
      \   'javascript': ['eslint'],
      \}

let g:ale_fixers = {
      \    'python': ['black'],
      \    'vue': ['prettier']
      \}
nmap <F10> :ALEFix<CR>
let g:ale_python_pyflakes_executable = expand("$HOME/.pyenv/versions/neovim/bin/pyflakes")
let g:ale_python_pyflakes_use_global = 1
let g:ale_python_black_executable = expand("$HOME/.pyenv/versions/neovim/bin/black")
let g:ale_python_black_use_global = 1
let g:ale_python_flake8_executable = expand("$HOME/.pyenv/versions/neovim/bin/flake8")
let g:ale_python_flake8_use_global = 1

let g:ale_fix_on_save = 1


" NCM settings
set shortmess+=c
set completeopt=noinsert,menuone,noselect
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


" Mapping

noremap <C-n> <C-W>j
noremap <C-i> <C-W>l
noremap <C-h> <C-W>h
noremap <C-e> <C-W>k


map <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
"map <leader>t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map <leader>s :split <C-R>=expand("%:p:h") . "/" <CR>
map <leader>v :vsplit <C-R>=expand("%:p:h") . "/" <CR>
"nnoremap ,cd :lcd %:p:h<CR>:pwd<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""'

inoremap <c-j> <c-n>
cnoremap <c-j> <c-n>

" rotate some keys about to get qwerty "hjkl" back for movement
"noremap n <down>
"noremap e <up>
"noremap i <right>
noremap n j
noremap e k
noremap i l
noremap h h

noremap j e
noremap k n
noremap l i


" move these keys to their qwerty positions because they are
" in the way of hjkl (and E for J)
noremap K N
noremap L I
noremap N J
noremap E K
noremap I L
"
"" this is the only key that isn't in qwerty or colemak position
noremap J E

" window movement
nnoremap <c-w>n <c-w>j
nnoremap <c-w>i <c-w>l
nnoremap <c-w>e <c-w>k

" qwerty <c-w>n and <c-w>i stolen but do nothing so map back
nnoremap <c-w>k <c-w>n
nnoremap <c-w>l <c-w>i
