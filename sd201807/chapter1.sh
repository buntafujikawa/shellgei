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
4.0K    /usr/src4.0K    /usr/games
#COMMENT

# 04 特殊なパーミッション
ls -l /bin/ | awk '$1~/s/'
: <<'#COMMENT'
-rwsr-xr-x  1 root  wheel    51008  7  9  2016 ps
#COMMENT

# 05 Apacheのログ解析
seq 10 | sed -n '/3/, /5/p'
: <<'#COMMENT'
3
4
5
#COMMENT

cat sd201701/log_range.log | sed -n '/24\/Dec\/2016 21/, /25\/Dec\/2016 03/p'
: <<'#COMMENT'
192.168.77.248 - - [24/Dec/2016 21:12:20] "GET / HTTP/1.0" 200 4294
192.168.152.143 - - [24/Dec/2016 22:06:19] "GET / HTTP/1.0" 200 7255
192.168.6.132 - - [24/Dec/2016 23:00:42] "GET / HTTP/1.0" 200 4298
192.168.222.3 - - [25/Dec/2016 00:03:23] "GET / HTTP/1.0" 200 8547
192.168.101.95 - - [25/Dec/2016 01:01:40] "GET / HTTP/1.0" 200 8488
192.168.141.18 - - [25/Dec/2016 02:15:52] "GET / HTTP/1.0" 200 4533
192.168.110.169 - - [25/Dec/2016 03:06:54] "GET / HTTP/1.0" 200 3461
#COMMENT

# 06 複数のディレクトリ内のファイル数カウント

find . -type d | xargs -I@ bash -c 'echo -n @" "; find @ -type f -maxdepth 1 | wc -l'

: <<'#COMMENT'
.        3
./.git        5
./.git/hooks        9
./.git/info        1
./.git/logs        1
./.git/logs/refs        0
./.git/logs/refs/heads        1
./.git/logs/refs/remotes        0
./.git/logs/refs/remotes/origin        1
./.git/objects        0
./.git/objects/03        1
./.git/objects/05        1
./.git/objects/16        1
./.git/objects/2b        1
./.git/objects/31        1
./.git/objects/37        1
./.git/objects/38        1
./.git/objects/4c        1
./.git/objects/50        1
./.git/objects/69        1
./.git/objects/6d        2
./.git/objects/6f        1
./.git/objects/7a        1
./.git/objects/7b        1
./.git/objects/90        1
./.git/objects/9a        1
./.git/objects/aa        1
./.git/objects/b5        1
./.git/objects/cd        1
./.git/objects/d1        1
./.git/objects/e6        1
./.git/objects/ef        1
./.git/objects/f5        1
./.git/objects/ff        1
./.git/objects/info        0
./.git/objects/pack        0
./.git/refs        0
./.git/refs/heads        1
./.git/refs/remotes        0
./.git/refs/remotes/origin        1
./.git/refs/tags        0
./.idea        4
./.idea/inspectionProfiles        0
./.vagrant        0
./.vagrant/machines        0
./.vagrant/machines/default        0
./.vagrant/machines/default/virtualbox        8
./sd201701       10
./sd201701/address_list        2
./sd201701/version_sort        7
#COMMENT

: <<'#COMMENT'
#COMMENT