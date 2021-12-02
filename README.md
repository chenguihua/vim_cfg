# my_vimrc
vim c++ 开发配置

1. YouCompleteMe 使用保证vim8 --version时带有 +python/dyn 和 +python3/dyn 特性，否则python打开时出core
2. YouCompleteMe 和 Monokai 配色方案冲突，导致YouCompleteMe提示，刷新不完全，不知道怎么配置
3. ale 配合CMake使用时，在顶层测CMakeLists.txt 添加 set(CMAKE_EXPORT_COMPILE_COMMANDS  1)，在 .vimrc 中 let g:ale_c_build_dir_names=['']，对应的目录
4. vim8 编译时
   ./configure --with-features=huge --enable-python3interp --enable-multibyte --enable-cscope --with-python3-config-dir=${path} --prefix=${local}/vim8
   ${path} =  `python3-config --configdir`
   二次编译，支持py和py3动态(不知道原因，可能不需要二次编译)
   ./configure --with-features=huge --enable-python3interp --enable-pythoninterp --with-python-config-dir=/usr/lib64/python2.7/config --enable-rubyinterp --with-python3-config-dir=${path} --enable-multibyte --enable-cscope --prefix=${local}/vim8
5. vim alt键 不知道如何映射
