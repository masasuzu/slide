=========================================
黒い画面入門 Part.I
=========================================


Version
:1.0 of 2012/05/21

Author
:SUZUKI Masashi / masasuzu

Mail
:m15.suzuki.masashi@gmail.com




Agenda
============================================

1. 自己紹介的な何か.
2. なぜ黒い画面.
3. コマンドライン操作.
4. 簡単なコマンド.



前提条件
============================================

基本的に以下の環境で動かすことを前提にしています。

* Debian lenny
* vim
* zsh
* screen



1. 自己紹介とか
============================================

* すずきまさし (鈴木 勝史)
* 株式会社モバイルファクトリー システム開発部
* @masasuz





コンテキストとか
============================================

* 黒い画面でごにょごにょするお仕事は2年くらい(6月で3年目)
* 普段のお仕事は携帯の公式サイトとか携帯向けのソーシャルアプリとか開発
* 開発から運用･障碍対応まで大体全部やります
* vim / perl / mysql / tscreen / zsh / debian

今回の話は昔どっかの勉強会で話した内容の焼き直しです。

* http://masasuzu.github.com/slide/build/2011-03-26_devlove_terminal.html


普段のお仕事環境
============================================

クライアントマシン
:Windows7

ターミナル
:mintty

開発マシン
:Debian Lenny

    Client PC
    (mintty on Windows)
        |
        |
        |  ssh    Development Machine
        +-------> (Debian Lenny on VM)
                    |
                    |  ssh    IDC
                    +-------> (Debian Lenny)


2. 黒い画面
============================================

黒い画面の理由
============================================

* 回線が細い場所でも操作が可能
* 複数のサーバに対して操作がしゃすい
* 定型操作を自動化しやすい

ターミナルエミュレータ
============================================

サーバに接続するには、ターミナルエミュレータを使用する必要があります。このターミナルエミュレータのことを一般的に黒い画面と言います。
Windows で動作するターミナルエミュレータには以下のものがあります。

* mintty
* Tera Term
* コマンドプロンプト
* PuTTY

SSH
============================================

sshとはローカルのターミナルからリモートのサーバへ接続するためのプロトコルです。
古くはtelnetが使われていましたが、平文で通信するなど、セキュリティ的に問題があるため、現在ではほとんど使われていません。

認証の方式にパスワードと公開鍵方式がありますが、基本的にパスワード認証は推奨されません。


3. コマンドライン操作
============================================

コマンドライン
============================================

ターミナルでは基本的にCUIと呼ばれる文字ベースのインターフェースが使用されます。
一般的にコマンドラインと呼ばれ、1行単位で命令(コマンド)を実行します。


コマンドライン編集
============================================

コマンドラインはデフォルトで、emacsキーバインドになっています。
emacsキーバインドを覚えておくと効率よくコマンドラインを編集することができるようになります。

set -oで変更することができます。

    set -o vi
    set -o emacs

emacsキーバインド
============================================

* Ctrl + f
  * 右に移動  →
  * forward
* Ctrl + b
  * 左に移動  ←
  * back
* Ctrl + h
  * 1文字削除、バックスペース
* Ctrl + j
  * Enter
* Ctrl + [
  * ESC



emacsキーバインド cont.
============================================

* ESC + f
  * 右に1単語移動
* ESC + b
  * 左に1単語移動
* ESC + d
  * 右の1単語削除
* Ctrl + w
  * 左の1単語削除


emacsキーバインド cont..
============================================

* Ctrl + a
  * 行頭に移動
  * 一番最初のa
* Ctrl + e
  * 行末に移動
  * end
* Ctrl + k
  * 現在位置から行末まで削除


ヒストリー
============================================

* Ctrl + p
  * コマンド履歴の後方参照
  * previous
* Ctrl + n
  * コマンド履歴の前方参照
  * next
* Ctrl + r
  * コマンド履歴の後方検索
* Ctrl + s
  * コマンド履歴の前方検索


fc
============================================

コマンドラインをエディタで編集できます。EDITOR変数に指定されているエディタが立ち上がります。


4. 簡単なコマンド
============================================

Unixコマンドは基本的に以下の形式で、オプションと引数を取ることがあります。

    command <option> <argument>


オプション
--------------------------------------------

コマンドにはオプションをつけることで挙動を変えることができるものもあります。

オプションにはロングタイプとショートタイプがあります。シェルスクリプトなどあとで見返すことのあるものに関してはロングタイプを使うと良いでしょう。

    perl -v
    perl --version

ショートオプションに関しては、くっつけて記述することも可能です。

    ls -lah

man
--------------------------------------------

コマンドのリファレンスを表示します。ググる前にまず引いてください。

    % man <section> <command>

セクション番号の意味は以下の通り。コマンドを調べる限りは1もしくは省略しても大丈夫です。

    1   Executable programs or shell commands
    2   System calls (functions provided by the kernel)
    3   Library calls (functions within program libraries)
    4   Special files (usually found in /dev)
    5   File formats and conventions eg /etc/passwd
    6   Games
    7   Miscellaneous (including macro packages and  conventions),
        e.g. man(7), groff(7)
    8   System administration commands (usually only for root)
    9   Kernel routines [Non standard]

pwd
--------------------------------------------

今いるディレクトリを表示します。

    % pwd
    /home/masasuzu


ls
--------------------------------------------

ディレクトリの中身を表示します。

    ls

    # リスト表示
    ls -l

    # 隠しファイルも表示
    ls -a
cd
--------------------------------------------

今いるディレクトリを移動します。

    # 今いるディレクトリのある<file>というディレクトリに移動
    cd <file>

    # 一つ前にいたディレクトリに移動
    cd -

    # ホームディレクトリに移動
    cd ~

touch
--------------------------------------------

新しく空のファイルを作ります。すでに存在する場合は更新時間を更新します。

    touch <file>

mkdir
--------------------------------------------

ディレクトリを作ります。

    mkdir <file>

    # 親ディレクトリが存在しない場合、まとめて作成する
    mkdir -p       <directory>/<directory>
    mkdir --parent <directory>/<directory>

rm
--------------------------------------------

ファイルを削除します。

    rm <file>

    # ディレクトリを再帰的に削除します
    rm -r          <directory>
    rm --recursive <directory>


rmdir
--------------------------------------------

空のディレクトリを削除します。rmコマンドでファイルを削除してから、rmdirコマンドで削除すると安全です。

    rmdir <directory>

cat
--------------------------------------------

ファイルの中身を出力します。

    cat <file>

head
--------------------------------------------

ファイルの先頭数行を表示します。

    head <file>

tail
--------------------------------------------

ファイルの末尾数行を表示します。

    tail <file>

tailf
--------------------------------------------

tailと同じくファイルの末尾を表示しますが、ファイルに更新があった際に更新分を表示してくれます。
tail -fでも同様のことができますが、tailfが使用可能な環境であれば、tailfの使用を推奨します。

    tailf <file>

lv
--------------------------------------------

ファイルの中身をページングして表示します。
j,k,Ctrl + u, Ctrl + dで上下移動できます。
?,/で検索できます。移動方式はvimとほぼ同じなので覚えておくとよいでしょう。

    lv <file>

df
--------------------------------------------

ディスクの空き状況を表示します。

    df

    # 読みやすい単位で表示します
    df -h

du
--------------------------------------------

現在いるディレクトリ以下のディスクの使用状況を表示します。

    # デフォルトはカレントディレクトリ
    du

    # ディレクトリ指定出来る
    du <directory>

    # サブディレクトリは探索しない
    du -s

ps
--------------------------------------------

現在実行されているプロセスを表示する

    ps

    #全てのプロセスを表示する
    ps -ef

top
--------------------------------------------

実行中のプロセスのリソース使用状況をリアルタイムに表示します。
<,>でソートする列を変更することができます。

    top


screen, tscreen, tmux
--------------------------------------------

複数ウィンドウを管理できるプログラム。別の人が詳しく説明してくれるはずです。

その他
--------------------------------------------

ここまで基本的なコマンドを上げました。それ以外のちょっと複雑なコマンドや使い方に関しては次回やります。


Thank you.
============================================
