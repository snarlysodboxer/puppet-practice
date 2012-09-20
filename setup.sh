#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

if  [ -z "`which puppet`" ] ;
then
  apt-get update
  apt-get install -y puppet vim-puppet ;
fi

curl https://raw.github.com/snarlysodboxer/puppet-practice/master/puppet-example > /tmp/puppet-example
curl https://raw.github.com/snarlysodboxer/puppet-practice/master/nginx_server.pp > /tmp/nginx_server.pp

puppet apply /tmp/nginx_server.pp
