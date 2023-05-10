#!/usr/bin/env bash

if [ -d "$HOME/.tmux/plugins/tpm" ]; then
    (cd "$HOME/.tmux/plugins/tpm" && git pull)
else
    git clone --depth 1 "https://github.com/tmux-plugins/tpm.git" "$HOME/.tmux/plugins/tpm"
fi

curl -sSfLo "$HOME/.tmux.conf" "https://raw.githubusercontent.com/tinkernels/userscripts/gh-pages/sys-utils/custom-shellenv/custom-tmux.conf"

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    curl -sSfL "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh" | bash -s
fi

curl -sSfLo "$HOME/.profile" "https://raw.githubusercontent.com/tinkernels/userscripts/gh-pages/sys-utils/custom-shellenv/custom-shellprofile"
(cd "$HOME" && ln -sf .profile .zprofile && ln -sf .profile .bash_profile)

curl -sSfLo "$HOME/.shellrc" "https://raw.githubusercontent.com/tinkernels/userscripts/gh-pages/sys-utils/custom-shellenv/custom-shellrc"
for F in "$HOME/.zshrc" "$HOME/.bashrc"; do
    grep -q "source \$HOME/.shellrc" "$F" || echo "source \$HOME/.shellrc" >>"$F"
done

# .zshrc
grep -qE '^[[:blank:]]*ZSH_THEME="smt"' "$HOME/.zshrc" || sed -i -r 's:^[[:blank:]]*ZSH_THEME=.*$:ZSH_THEME="smt":g' "$HOME/.zshrc"

