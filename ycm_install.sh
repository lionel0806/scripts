#!/bin/sh
# This script is used for installing Vim YouCompleteMe.
# Author: lixian
# 2014.12.08

YCM_BUILD_DIR=~/ycm_build
CLANG_BIN_DIR=/usr/local/clang
YCM_SRC_DIR=~/.vim/bundle/YouCompleteMe

print_info(){
    echo "###########################################################################"
    echo "              $1"
    echo "###########################################################################"
}

cd $YCM_SRC_DIR
git submodule update --init --recursive
if [ $? -eq 0 ]; then
    print_info "Update thirty party successfully!"
else
    print_info "Update thirty party failed!"
    exit 1
fi


[ -d $YCM_BUILD_DIR ] || mkdir $YCM_BUILD_DIR
cd  $YCM_BUILD_DIR
if [ $? -ne 0 ]; then
    print_info "Not find ycm_build dir[$YCM_BUILD_DIR]"
    exit 1
fi

cmake -G "Unix Makefiles" -DPATH_TO_LLVM_ROOT=$CLANG_BIN_DIR . $YCM_SRC_DIR/third_party/ycmd/cpp && make ycm_support_libs
if [ $? -eq 0 ]; then
    print_info "Install successfully!"
else
    print_info "Install failed!"
    exit 1
fi

exit 0

