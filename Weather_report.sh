#! /bin/bash

#city name Casablanca
city=Casblanca

#Obtain the weather information in a file weather>
curl -s wttr.in/$city?T --output weather_report

#To extract Current Temperature
obs_temp=$(curl -s wttr.in/$city?T | grep -m 1 ' >
echo "The current Temperature of $city: $obs_temp"

#Assign Country and City to variable TZ
TZ='Morocco/Casablanca'

# Use command substitution to store the current d>
day=$(TZ='Morocco/Casablanca' date -u +%d) 
month=$(TZ='Morocco/Casablanca' date +%m)
year=$(TZ='Morocco/Casablanca' date +%Y)

record=$(echo -e "$year\t$month\t$day\t$obs_temp\>
echo $record>>rx_poc.log