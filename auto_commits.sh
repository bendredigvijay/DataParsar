#!/bin/bash

touch log.txt

for i in $(seq 100 130); do
  DATE_STR=$(date -d "$i days ago" +"%Y-%m-%d")
  NUM_COMMITS=$((RANDOM % 3 + 5))
  for j in $(seq 1 $NUM_COMMITS); do
    HOUR=$((RANDOM % 14 + 9))
    MINUTE=$((RANDOM % 60))
    SECOND=$((RANDOM % 60))
    DATE=$(date -d "$i days ago" +"%Y-%m-%dT${HOUR}:${MINUTE}:${SECOND}")
    echo "[$DATE_STR] entry $j - $((RANDOM % 9999))" >> log.txt
    git add .
    GIT_AUTHOR_DATE="$DATE" GIT_COMMITTER_DATE="$DATE" \
    git commit -m "update: $((RANDOM % 9999))"
  done
done

git push origin main
