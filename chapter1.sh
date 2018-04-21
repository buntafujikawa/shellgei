#!/usr/bin/env bash
# 01 ファイルの検索
grep '\.exe' sd201701/files.txt
: <<'#COMMENT'
test.exe
画面仕様書.xls.exe
秘密のファイル.exe.jpeg
#COMMENT

# 02 設定ファイルからの情報抽出
cat sd201701/ntp.conf | sed 's/#.*//g' | cat -s | grep '^pool' | awk '{print $2}'
: <<'#COMMENT'
0.ubuntu.pool.ntp.org
1.ubuntu.pool.ntp.org
2.ubuntu.pool.ntp.org
3.ubuntu.pool.ntp.org
ntp.ubuntu.com
#COMMENT

## 上が本の答えだけど、多分これで十分だと思う
cat sd201701/ntp.conf | grep '^pool' | awk '{print $2}'
: <<'#COMMENT'
0.ubuntu.pool.ntp.org
1.ubuntu.pool.ntp.org
2.ubuntu.pool.ntp.org
3.ubuntu.pool.ntp.org
ntp.ubuntu.com
#COMMENT

# 03 ディスク使用量の集計
## 別解が近いけど、問いに対する答えになってないのでこれの方が良いと思う
du -hs /usr/* | sort -hr
: <<'#COMMENT'
346M    /usr/lib
180M    /usr/share
113M    /usr/bin
12M     /usr/include
11M     /usr/sbin
108K    /usr/local
4.0K    /usr/src
4.0K    /usr/games
#COMMENT

# 04 特殊なパーミッション
ls -l /bin/ | awk '$1~/s/'
: <<'#COMMENT'
-rwsr-xr-x  1 root  wheel    51008  7  9  2016 ps
#COMMENT

#
: <<'#COMMENT'
#COMMENT