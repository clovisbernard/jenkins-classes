#!/bin/bash

to_number=$1
number=0
while [ $number -lt $to_number ]
do
  echo $number
  number=$((number + 1))
done