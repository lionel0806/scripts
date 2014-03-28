#!/bin/sh
#
#This scripts just can be used to create index file for cscope and ctags
#if you edit c/c++ by VIM , may be you can use it.


# just create index for c/c++ files
find . -name "*.h" -o -name "*.c"-o -name "*.cc" -o -name "*.cpp" > cscope.files
cscope -bkq -i cscope.files
#cscope -Rbq
ctags -R
