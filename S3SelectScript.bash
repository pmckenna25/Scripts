#!/bin/bash

NAME1=$1
NAME2=$2
NAME3=$3
NAME4=$4
COND1=$5
FILENAME=$6

aws s3api select-object-content --bucket reallybigbadbucket --key MOCK_DATA.csv --expression "select s._"$NAME1", s._"$NAME2", s._"$NAME3" from s3object s where s._"$NAME4" like '%"$COND1"%'" --expression-type 'SQL' --input-serialization '{"CSV": {}}' --output-serialization '{"CSV":{}}' $FILENAME

