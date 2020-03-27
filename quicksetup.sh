#!/bin/bash

if ! which curl; then
  echo "Needs curl"
  exit 1
fi

curl -s 'https://raw.githubusercontent.com/nickgarvey/dotfiles/master/.tmux.conf' > ~/.tmux.conf
curl -s 'https://raw.githubusercontent.com/nickgarvey/dotfiles/master/.vimrc' > ~/.vimrc
curl -s 'https://raw.githubusercontent.com/seebi/dircolors-solarized/d160260fe7b9624be39bac9716588bd5913a8c48/dircolors.256dark' > ~/.dircolors

sed -i -E 's/^(HIST(FILE)?SIZE=)[0-9]+$/\1/' ~/.bashrc
echo >> ~/.bashrc
echo 'export HISTFILESIZE=' >> ~/.bashrc
echo 'export HISTSIZE=' >> ~/.bashrc
echo 'PROMPT_COMMAND="history -a; $PROMPT_COMMAND"' >> ~/.bashrc

echo >> ~/.bashrc
echo "alias notify='for x in \$(seq 3); do echo -ne \"\a\"; sleep 1; done'" >> ~/.bashrc

echo >> ~/.bashrc
echo 'eval $(dircolors -b ~/.dircolors)' >> ~/.bashrc

echo >> ~/.bashrc
echo "export VISUAL=vim" >> ~/.bashrc
echo "export EDITOR=vim" >> ~/.bashrc

if which git > /dev/null; then
  git config --global user.name "Nick Garvey"
  git config --global user.email "garvey.nick@gmail.com"
fi
