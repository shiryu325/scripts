#!/bin/bash
DIR="/home/voltron/pod/"

# -mtime +7 = 7 days
# -mmin +60 = 60 minutes 

find $DIR -type f -mmin +60 -exec rm '{}' \; -exec echo Deleted '{}' \;
find /home/voltron/Prog/log.txt -exec rm '{}' \; -exec echo Deleted '{}' \;
