#!/usr/bin/env bash
# 売り切れているSDの一覧を取得
nkf -wLux backnumber| grep 品切 -B3 | pandoc -f html -t plain

