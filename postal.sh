#!/bin/bash

requests=$(cat export/*.json | jq .Run.Stats.Requests.total | awk '{x+=$1} END {print x}')
avg=$(cat export/*.json | jq .Run.Timings.responseAverage | awk '{x+=$1; i++} END {print x/i}')
min=$(cat export/*.json | jq .Run.Timings.responseMin | sort -n | head -n 1)
max=$(cat export/*.json | jq .Run.Timings.responseMax | sort -nr | head -n 1)
count=$(ls export/ | wc -l)

printf "Total jobs: $count\n"
printf "Total requests: $requests\n"
printf "Average response time: $avg ms\n"
printf "Min response: $min ms  Max response: $max ms\n"

exit 0