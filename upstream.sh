#!/bin/sh

upstream_setup() {
    git remote add upstream https://github.com/neovim/neovim.git ;
    git fetch upstream ;
    rm -f cscope.out ;
    cscope -Rb ;
}

upstream_update() {
    git fetch upstream ;
    git checkout master ;
    git merge upstream/master ;
    cscope -Rb ;
}

case "$1" in
  setup)
    upstream_setup
  ;;
  update)
    upstream_update
  ;;
  *)
    echo "Usage: $0 {setup|update}" >&2
    exit 2
  ;;
esac
