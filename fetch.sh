#copied from Chip Turner

#!/bin/bash

set -euo pipefail

BASEDIR=$(dirname "$0")
YEAR=$1; shift
DAY=$1; shift
COOKIE=$(cat $BASEDIR/.aoc-session-cookie)
curl -o  "$BASEDIR/2021/input$DAY.txt" -L https://adventofcode.com/$YEAR/day/$DAY/input --cookie "session=$COOKIE"
