# vimrcのしレクトリ指定
mv ~/dotfiles /.dotfiles
echo source "~/.dotfiles/.vimrc" > ~/.vimrc

# vimprocビルド
cd ~/.vim/bundle/vimproc
make -f make_unix.mak
