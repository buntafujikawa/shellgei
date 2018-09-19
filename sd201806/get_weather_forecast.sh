#!/usr/bin/env bash
# 静岡の天気を調べる
cat yoho_327.html| sed -ne '/class="forecast"/,$p' | egrep "float: left|img" | pandoc -f html -t plain

