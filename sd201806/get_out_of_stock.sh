#!/usr/bin/env bash
nkf -wLux backnumber| grep 品切 -B3 | pandoc -f html -t plain

