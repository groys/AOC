#copied from Chip Turner

#!/bin/bash

set -euo pipefail

YEAR=$1; shift
DAY=$1; shift
COOKIE=$(cat .aoc-session-cookie)
curl -o  "2021/input$DAY.txt" -L https://adventofcode.com/$YEAR/day/$DAY/input --cookie "session=$COOKIE"
