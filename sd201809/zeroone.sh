#!/usr/bin/env bash
# 2進数から文字列を復元する
cat ../ShellGeiData/sd201809/zeroone | sed 's/^/obase=16;ibase=2;/' | bc | xxd -p -r