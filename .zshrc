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
export PATH=~/bin:/Users/nate/android-sdks/tools:/Users/nate/android-sdks/platform-tools:/Users/nate/android-ndk/android-ndk-r7b:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin

# add RVM to the path in the right place
source ~/.rvm/scripts/rvm

export ANDROID_HOME=~/android-sdks
export TEST_ENV_NUMBER=8
# Ruby config
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_FREE_MIN=500000
export RUBY_HEAP_MIN_SLOTS=40000

alias g="git"
alias src="cd ~/Documents/src"
alias bake="bundle exec rake"
alias b="bundle exec"
alias bs="b rails server"
alias bc="b rails console"
alias sc="spring console"
alias ctags=/usr/local/bin/ctags
alias generate_ctags="ctags -f tags --extra=+f -a --exclude=.git --exclude=log -R * `rvm gemdir`/gems/*"
alias st="spring testunit"
alias sr="spring rspec"
alias vim='mvim -v'

# App logging 
function androidlogwithdevice() { adb "$@" logcat AppName:V StrictMode:V ActivityThread:E AndroidRuntime:E \*:S;}
alias leveluplog='androidlogwithdevice'

# adb per device
function adbdna() { adb -s FA2BTS506540 "$@" ;}
function adbemulator() { adb -e "$@" ;}
function adbgalaxynexus() { adb -s 0149C2DB0801D007 "$@" ;}
function adbnexusone() { adb -s HT9CYP804774 "$@" ;}
function adbrazr() { adb -s TA648025OR "$@" ;}
function adbrise() { adb -s 728577c "$@" ;}
function adbthunderbolt() { adb -s HT15MS000470 "$@" ;}
function adbx() { adb -s 015D8AFA1501C00A "$@" ;}
function adbnexusfour() { adb -s 0030129f5f8b621b "$@" ;}

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

#Personal
function logcat() { adb "$@" logcat StrictMode:V ActivityThread:E AndroidRuntime:E \    *:S;}

