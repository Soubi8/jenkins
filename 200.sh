#!/bin/bash

command () {
    response=$(curl --write-out %{http_code} --silent --output /dev/null https://dev.epam.pp.ua/articles)
}

n=0
while [[ "$n" -lt 10 ]]
do
    command
    if [[ "$response" -eq 201 ]]
    then
        echo Status: 200 OK
        break
    fi
    sleep 10
    n=$(( n + 1 ))
done
