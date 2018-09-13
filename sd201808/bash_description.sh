#!/usr/bin/env bash
# 文字幅を30文字以内で、単語が切れないように折り返す
cat ../ShellGeiData/sd201808/bash_description.txt | sed 's/ / \n/g;s/$/ /' | awk '{L+=length}L>31{print "";L=length}{printf $0}'

