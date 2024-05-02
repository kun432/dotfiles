if [ -r ~/.bashrc ]; then
    . ~/.bashrc
fi

export PS1='\[\e[1;31m\]\u@\h \[\e[1;32m\]\W \[\e[1;33m\]\$ \[\e[0m\]'

export LANG="ja_JP.UTF-8"

# Set brew
if [ "$(which brew)" == "" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set vscode
if [ "$(which code)" == "" ]; then
  export PATH="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin:$PATH"
fi

# Set aws-completion
if [ "$(which aws_completer)" != "" ]; then
  complete -C aws_completer aws
fi

# Set bash-completion
if [ -r "/usr/local/etc/profile.d/bash_completion.sh" ]; then
  source /usr/local/etc/profile.d/bash_completion.sh
fi

# volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# direnv + venv
pyenv_python_default_ver="3.11.9"
eval "$(direnv hook bash)"
alias mklocal='pyenv local ${pyenv_python_default_ver}'
alias mkvenv='python -m venv --upgrade-deps --prompt . .venv && echo -e "source .venv/bin/activate\nunset PS1" > .envrc && direnv allow .'
show_virtual_env() {
  if [ -n "VIRTUAL_ENV_PROMPT" ]; then
    echo "$VIRTUAL_ENV_PROMPT"
  fi
}
export -f show_virtual_env
PS1='\n$(show_virtual_env)'$PS1
