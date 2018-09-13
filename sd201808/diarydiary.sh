#!/usr/bin/env bash
# 同じ語句が2つ並んでいる語句を列挙する
cat ../ShellGeiData/sd201808/diarydiary.txt | tr -d '\n' | grep -oE '(.+)\1'

