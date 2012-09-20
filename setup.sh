#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

if  [ -z "`which puppet`" ] ;
then
  apt-get update
  apt-get install -y puppet vim-puppet ;
fi

curl -L 

puppet apply nginx_server.pp
