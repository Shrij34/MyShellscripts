#!/bin/bash
name="Ram"
echo "Hi $name, this is $1 how may i assit you today"
read -p "please enter your query: " query
echo "your query is: $query"
if [ "$query" == "down" ]; then
    echo "sorry to here that"
    echo "we will try to fix it as soon as possible"
else
    echo "thank you for your feedback"
fi



