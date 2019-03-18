#!/bin/bash

FILENAME=$1
BUCKET=$2
NEWNAME=$3

Aws s3 cp $FILENAME s3://$BUCKET/$NEWNAME
