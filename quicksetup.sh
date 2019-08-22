#!/bin/bash

curl 'https://raw.githubusercontent.com/nickgarvey/dotfiles/master/.tmux.conf' > ~/.tmux.conf
curl 'https://raw.githubusercontent.com/nickgarvey/dotfiles/master/.vimrc' > ~/.vimrc

sed -i -E 's/^(HIST(FILE)?SIZE=)[0-9]+$/\1/' ~/.bashrc
echo 'export HISTFILESIZE=' >> ~/.bashrc
echo 'export HISTSIZE=' >> ~/.bashrc
echo 'PROMPT_COMMAND="history -a; $PROMPT_COMMAND"' >> ~/.bashrc

echo "alias notify='for x in \$(seq 3); do echo -ne \"\a\"; sleep 1; done'" >> ~/.bashrc
