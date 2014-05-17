#!/bin/bash

current_dir=`pwd`
. ../base.sh

exe_cmd "sh install_libmemcached.sh"

exe_cmd "cd $current_dir"
ext_name='memcached'
file_key='memcached-2.2.0'
exe_cmd "sh fetch_source.sh $file_key"

src_dir="/data0/install/src/$file_key"
exe_cmd "cd $src_dir && ls -l"
exe_cmd "phpize"
exe_cmd "./configure --with-php-config=/usr/local/php/bin/php-config --with-libmemcached-dir=/usr/local/ --disable-memcached-sasl"
exe_cmd "make"

exe_cmd "cd $current_dir"
exe_cmd "sh install_php_ext.sh $ext_name $file_key"
