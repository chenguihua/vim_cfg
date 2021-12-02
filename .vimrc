"" ---------- 基本配置 ----------
" 定义<leader>为分号，此行代码必须在插件配置代码之前
let mapleader=";"
" 语法高亮
syntax on 
" 自适应不同语言的智能缩进
filetype indent on
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 将制表符扩展为空格
set expandtab
" 显示行号
set number
"搜索逐字符高亮
set hlsearch
set incsearch
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 设置120列限制
set cc=120
" 设置更新时间
set updatetime=1000

"" ---------- 加载插件 ----------
call plug#begin('~/.vim/plugged')
" NERDTree插件的github网址（不包含前缀https://github.com/）
Plug 'scrooloose/nerdtree'
" C++头文件、源文件切换
Plug 'vim-scripts/a.vim'
" 自动索引
Plug 'ludovicchabant/vim-gutentags'
" taglist 函数列表
Plug 'vim-scripts/taglist.vim'
" 美化状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" 代码补全
Plug 'Valloric/YouCompleteMe'
" 文件查找
Plug 'Yggdroot/LeaderF'
" 异步执行
Plug 'skywind3000/asyncrun.vim'
" 代码格式化
Plug 'rhysd/vim-clang-format'
" 语法检查
Plug 'dense-analysis/ale'
" C++代码高亮
Plug 'octol/vim-cpp-enhanced-highlight'
" git修改显示
" Plug 'mhinz/vim-signify'
" vim配色方案
Plug 'morhetz/gruvbox'
call plug#end()

"" ---------- 插件配置 ----------
"" [ctags]
nnoremap tp :tprev<CR>
nnoremap tn :tnext<CR>
nnoremap ts :tselect<CR>

"" [NERDTree]
nmap <Leader><Leader> :NERDTreeToggle<CR> 
let NERDTreeWinSize=32          " 设置NERDTree子窗口宽度
let NERDTreeWinPos="left"       " 设置NERDTree子窗口位置
let NERDTreeShowHidden=1        " 显示隐藏文件
let NERDTreeMinimalUI=1         " NERDTree 子窗口中不显示冗余帮助信息

"" [gutentags]
nnoremap sw :A<CR>

"" [gutentags]
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

"" [taglist]
let Tlist_Show_One_File=1    "只显示当前文件的tags
let Tlist_WinWidth=40        "设置taglist宽度
let Tlist_Exit_OnlyWindow=1  "tagList窗口是最后一个窗口，则退出Vim
let Tlist_Use_Right_Window=1 "在Vim窗口右侧显示taglist窗口
nnoremap tl :TlistToggle<CR>

"" [vim-airline]
let laststatus = 2
let g:airline_powerline_fonts = 1
let g:airline_theme = "dark"

"" [YouCompleteMe]
"" YCM配置
" 全局YCM配置文件路径
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0  " 不提示是否载入本地ycm_extra_conf文件
let g:ycm_min_num_of_chars_for_completion = 2  " 输入第2个字符就罗列匹配项
" Ctrl+J跳转至定义、声明或文件
nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>|
" 语法关键字、注释、字符串补全
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
" 从注释、字符串、tag文件中收集用于补全信息
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
" 禁止快捷键触发补全
let g:ycm_key_invoke_completion = '<c-z>'  " 主动补全(默认<c-space>)
noremap <c-z> <NOP>
" 输入2个字符就触发补全
let g:ycm_semantic_triggers = {
            \ 'c,cpp': ['re!\w{2}'],
            \ }
let g:ycm_show_diagnostics_ui = 0  " 禁用YCM自带语法检查(使用ale)
" 防止YCM和Ultisnips的TAB键冲突，禁止YCM的TAB
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

"" [LeaderF]
" Ctrl+P在当前项目目录打开文件搜索, Ctrl+N打开MRU搜索，搜索最近打开的文件
" Alt+P打开函数搜索，Alt+N打开Buffer搜索
let g:Lf_ShortcutF = '<leader>f'
noremap <leader>n :LeaderfMru<cr>
noremap <leader>ff :LeaderfFunction!<cr>
noremap <leader>b :LeaderfBuffer<cr>

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

"" [asyncrun.vim]
" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 16
" 任务结束时候响铃提醒
let g:asyncrun_bell = 1
" 设置 F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(16)<cr>
" 递归查找包含该目录的目录作为根目录，若找不到则将文件所在目录作为当前目录
let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs', 'build.xml'] 
" 设置 F6 编译项目
nnoremap <silent> <F6> :AsyncRun -cwd=<root> sh build.sh <cr>
" 设置 F5 编译项目 debug
nnoremap <silent> <F5> :AsyncRun -cwd=<root> sh build.sh -d <cr>

"" [ale]
"始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_cpp_cc_options = '-std=c++11 -Wall'
let g:ale_c_build_dir_names=['build/llvm/Release']
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>
"使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
let g:ale_linters = {
\   'c++': ['clang'],
\   'c': ['clang'],
\}
" }}}
"文件内容发生变化时不进行检查
let g:ale_lint_on_text_changed = 'never'
"打开文件时不进行检查
let g:ale_lint_on_enter = 0

"" [vim-signify]
set signcolumn=yes  " 强制显示侧边栏，防止时有时无

"" [morhetz/gruvbox]
autocmd vimenter * ++nested colorscheme gruvbox
set bg=dark


