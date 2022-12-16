#!/usr/bin/env bash

if [ -d "$HOME/.tmux/plugins/tpm" ];then
    (cd "$HOME/.tmux/plugins/tpm" && git pull)
else
    git clone --depth 1 "https://github.com/tmux-plugins/tpm.git" "$HOME/.tmux/plugins/tpm"
fi

curl -sSfLo "$HOME/.tmux.conf" "https://raw.githubusercontent.com/tinkernels/userscripts/gh-pages/sys-utils/custom-shellenv/custom-tmux.conf"

if [ ! -d "$HOME/.oh-my-zsh" ];then
    curl -sSfL "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh" | bash -s
fi

curl -sSfLo "$HOME/.profile" "https://raw.githubusercontent.com/tinkernels/userscripts/gh-pages/sys-utils/custom-shellenv/custom-shellprofile"
(cd "$HOME" && ln -sf .profile .zprofile && ln -sf .profile .bash_profile)

curl -sSfLo "$HOME/.shellrc" "https://raw.githubusercontent.com/tinkernels/userscripts/gh-pages/sys-utils/custom-shellenv/custom-shellrc"
for F in "$HOME/.zshrc" "$HOME/.bashrc"
do
    grep -q "source \$HOME/.shellrc" "$F" || echo "source \$HOME/.shellrc" >> "$F"
done

# /etc/profile snippet
# for sh in /etc/profile.d/*.sh ; do
# 	[ -r "$sh" ] && . "$sh"
# done
# unset sh

if [ -d /etc/profile.d ]; then
    CUSTOM_PROFILE_SHF=/etc/profile.d/99-tk.sh
    [ -r "$CUSTOM_PROFILE_SHF" ] || curl -sSfLo "$CUSTOM_PROFILE_SHF" "https://raw.githubusercontent.com/tinkernels/userscripts/gh-pages/sys-utils/custom-shellenv/profile-d-tk.sh"
fi

# .zshrc
grep -qE '^[[:blank:]]*ZSH_THEME="smt"' "$HOME/.zshrc"  || sed -i -r 's:^[[:blank:]]*ZSH_THEME=.*$:ZSH_THEME="smt":g' "$HOME/.zshrc"

# base64 encoded:
# PROMPT='%{$fg[blue]%}<-%{$fg_bold[blue]%} %! $(prompt_char) ${return_status} $(git_time_since_commit)$(git_prompt_status)%{$reset_color%}
# %{$fg_bold[green]%}%n@%m %{$fg[blue]%}%D{[%H:%M:%S]} %{$reset_color%}%{$fg[white]%}[%~]%{$reset_color%}$(git_prompt_short_sha)$(git_prompt_info)
# %{$fg[blue]%}->%{$fg_bold[blue]%} %#%{$reset_color%} '
grep -qE '^[[:blank:]]*PROMPT=' "$HOME/.zshrc" ||  echo "UFJPTVBUPScleyRmZ1tibHVlXSV9PC0leyRmZ19ib2xkW2JsdWVdJX0gJSEgJChwcm9tcHRfY2hhcikgJHtyZXR1cm5fc3RhdHVzfSAkKGdpdF90aW1lX3NpbmNlX2NvbW1pdCkkKGdpdF9wcm9tcHRfc3RhdHVzKSV7JHJlc2V0X2NvbG9yJX0KJXskZmdfYm9sZFtncmVlbl0lfSVuQCVtICV7JGZnW2JsdWVdJX0lRHtbJUg6JU06JVNdfSAleyRyZXNldF9jb2xvciV9JXskZmdbd2hpdGVdJX1bJX5dJXskcmVzZXRfY29sb3IlfSQoZ2l0X3Byb21wdF9zaG9ydF9zaGEpJChnaXRfcHJvbXB0X2luZm8pCiV7JGZnW2JsdWVdJX0tPiV7JGZnX2JvbGRbYmx1ZV0lfSAlIyV7JHJlc2V0X2NvbG9yJX0gJwo=" \
  |  base64 -d >> "$HOME/.zshrc"

grep -qE '^[[:blank:]]*RPROMPT=' "$HOME/.zshrc" ||  echo 'RPROMPT=""' >> "$HOME/.zshrc"
