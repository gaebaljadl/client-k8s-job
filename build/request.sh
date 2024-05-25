#!/bin/bash

for i in $(seq 1 100)
do
    START_TIME=$(($(date +%s%N)/1000000))
    RESULT=$(curl -s -X POST -F "file=@./image.jpg" http://$URL/predict | jq .predicted_class)
    if [ "$RESULT" == "$EXPECTED_RESULT" ]; then
        END_TIME=$(($(date +%s%N)/1000000))
        echo "Request $i: $(($END_TIME - $START_TIME)) ms"
    else
        echo "Request $i: Fail ($RESULT)"
    fi
done