#!/usr/bin/env bash
cat yoho_327.html| sed -ne '/class="forecast"/,$p' | egrep "float: left|img" | pandoc -f html -t plain

