#!/bin/bash

# :は何も出力しないコマンドにヒアドキュメントで標準入力をすることで擬似的なコメントアウトとしている
: << '#COMMENT'
echo a
echo b
echo c
#COMMENT
