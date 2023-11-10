export PATH=$PATH:$HOME/repository/python_study/webdriver
if [ -r ~/.bashrc ]; then
    . ~/.bashrc
fi

export PS1='\n\[\e[1;31m\]\u@\h \[\e[1;32m\]\W \[\e[1;33m\]\$ \[\e[0m\]'

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
