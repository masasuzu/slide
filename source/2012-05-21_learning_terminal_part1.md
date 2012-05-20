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
3. コマンドライン操作
4. 簡単なコマンド.





自己紹介とか
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


なんで黒い画面(ターミナル)
============================================

TODO


コマンドライン操作
============================================


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


簡単なコマンド
============================================

TODO