# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git textmate rails ruby github osx rvm)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/Users/nate/android-sdks/tools/:/Users/nate/android-sdks/platform-tools/:/Users/nate//android-ndk/android-ndk-r7b/:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin

# add RVM to the path in the right place
source ~/.rvm/scripts/rvm

alias uninstall_merchant="adb uninstall com.scvngr.levelup.merchant.app"
alias uninstall_consumer="adb uninstall com.scvngr.levelup.app"
alias src="cd ~/Documents/src"
alias consumer="cd ~/Documents/src/levelup-android"
alias merchant="cd ~/Documents/src/levelup-android-merchant"
alias updater_build="ant clean; ant release; adb install -r bin/levelup-merchant-updater-release.apk"
alias bake="bundle exec rake"
alias b="bundle exec"
alias bs="b rails server"
alias bc="b rails console"
alias co="git checkout"
alias status="git status"
alias hard_reset="git reset --hard head"
alias staging_console="heroku console --app levelup-staging"
alias logcat="adb logcat -v time | grep -v dalvikvm"
alias server="cd ~/Documents/src/levelup/"
alias ctags=/usr/local/bin/ctags

reset-db () {
  # check this is a Rails-like environment
  if [[ -f config/database.yml ]]; then
    echo "RAILS_ENV=development rake db:drop"
    RAILS_ENV=development rake db:drop
    echo "RAILS_ENV=development rake db:create"
    RAILS_ENV=development rake db:create

    echo "pg_restore --verbose --clean --no-acl --no-owner -h localhost -U `whoami` -d DATABASE ~/database.dump"
    pg_restore --verbose --clean --no-acl --no-owner -h localhost -U `whoami` -d DATABASE ~/database.dump

    echo "rake db:prepare"
    rake db:prepare
  else
    echo "Must be in a Rails project to use this command"
  fi
}

# Run tests matching pattern in file
# Usage: t <filename> <pattern>                                                                                                                                                                                 
function t {
  local filename="$1"
  shift
  ruby -Itest $filename -n "/$@/"
}

# Heroku logs for the app passed
function hl {
  heroku logs -t --app levelup-"$@"
}

# Heroku console for the app passed
function hc {
  heroku run console --app levelup-"$@"
}
