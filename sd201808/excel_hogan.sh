#!/usr/bin/env bash
# テキストをスプレッドシートのセル一つ一つに1文字ずつ入れる
cat ../ShellGeiData/sd201808/excel_hogan.txt | sed 's/./&_/g' | sed 's/"/""""/g' | sed 's/,/","/g' | tr _ , > hoge.csv

