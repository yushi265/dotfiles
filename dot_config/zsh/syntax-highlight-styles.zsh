# シンタックスハイライトのスタイル設定
ZSH_HIGHLIGHT_HIGHTLIGHTERS=(main brackets cursor root)

# 連想配列
typeset -A ZSH_HIGHLIGHT_STYLES

# ブラケット
# マッチしない括弧
ZSH_HIGHLIGHT_STYLES[bracket-error]='fg=red,bold'
# 括弧の階層
ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-5]='fg=cyan,bold'
# カーソルがある場所にマッチする括弧
ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]='standout'
# カーソル
ZSH_HIGHLIGHT_STYLES[cursor]='bg=blue'
# ルートユーザ
ZSH_HIGHLIGHT_STYLES[root]='bg=red'
