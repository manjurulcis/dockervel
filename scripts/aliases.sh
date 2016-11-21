#!/bin/bash

if [ -n "$ZSH_VERSION" ]; then
   setopt aliases
else
   shopt -s expand_aliases
fi

alias dstart='./scripts/start.sh'
alias dbuild='docker-compose build'
alias dup='docker-compose up -d'
alias dstop='docker-compose stop'
alias dstopall='docker stop $(docker ps -a -q)'
alias drun='docker-compose run -d --service-ports front'
alias dcomposer='./scripts/composer.sh $*'
alias dcomposer-create='./scripts/composer.sh create-project laravel/laravel /var/www --prefer-dist'
alias dpermit='chmod -R 777 www'
alias dartisan='docker-compose run artisan'
alias dnodejs='docker-compose run nodejs'
alias dgulp='docker-compose run nodejs gulp'
alias dgulp-watch='docker-compose run -d nodejs gulp watch'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dstats='docker stats $(docker ps -q)'
alias dkill='docker stop $(docker ps -q)'
alias drmall='docker rm $(docker ps -a -q)'
alias dsh='./scripts/sh.sh'
alias ddbdrop='./scripts/db.sh DROP DATABASE'
alias ddbcreate='./scripts/db.sh CREATE DATABASE'
alias ddbimport='./scripts/db.sh project_db < '