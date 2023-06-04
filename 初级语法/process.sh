#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Please provide the input file name as an argument."
  exit 1
fi

input_file="$1"


if [ ! -f "$input_file" ]; then
  echo "Input file '$input_file' does not exist."
  exit 1
fi

awk '{ sub(/\r$/, ""); print }' "$input_file" | \
awk 'BEGIN { RS=""; FS="\n"; OFS="," }
{
  gsub(/ /, "", $0)  # 删除所有空格

  for (i=1; i<=NF; i++) {
    gsub(/,/, "\\,", $i);  # 转义逗号
  }

  if (NF == 3) {
    temp = $1
    $1 = $2
    $2 = $3
    $3 = temp
  } else if (NF == 2 && prev_last_field != "") {
    $3 = prev_last_field
  }

  print
  prev_last_field = $3
}'

