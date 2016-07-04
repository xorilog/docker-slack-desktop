#!/bin/bash

# Gather latest version of slack-desktop
url=$(curl https://slack.com/downloads |grep -e "Ubuntu 64-bit" |cut -d '"' -f 2)
version=$(echo ${url} | cut -d '/' -f 5 |cut -d '-' -f 3)
sed -i 's/Slack\ Version\ [0-9]*\.[0-9]*\.[0-9]*$/\Slack\ Version\ '$version'/' Dockerfile
sed -i 's/slack-desktop-[0-9]*\.[0-9]*\.[0-9]-amd64.deb/slack-desktop-'$version'-amd64.deb/g' Dockerfile
#git commit -am "Slack-desktop version $version" -S
#git tag -am "Slack-desktop version $version" $version
#git push --follow-tags
