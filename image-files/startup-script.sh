#!/bin/bash

echo '##################################################'
echo 'Build environment variables for shell scripts'
echo '##################################################'
echo 'source /root/export'
source /root/export

echo '##################################################'
echo 'Setting zkg config'
echo '##################################################'
if [ ! -e /root/.zkg/config ]; then mv /root/zkg-config.cfg /root/.zkg/config; fi
if [ ! -e /etc/corelight/packages ]; then $(which zkg) refresh; fi
echo 'cat /root/.zkg/config'
cat /root/.zkg/config


echo '##################################################'
echo 'Building /etc/corelight/local.zeek'
echo '##################################################'
/root/local.zeek.sh
echo 'cat /etc/corelight/local.zeek'
cat /etc/corelight/local.zeek

echo '##################################################'
echo 'Starting Corelight-softsensor'
echo '##################################################
'echo '##################################################'
corelight-update & corelight-softsensor start
