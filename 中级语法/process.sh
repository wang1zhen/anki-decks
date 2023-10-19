#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Please provide the input file name as an argument."
  exit 1
fi

input_file="$1"
bak_file="$1.bak"

if [ ! -f "$input_file" ]; then
  echo "Input file '$input_file' does not exist."
  exit 1
fi

cp $input_file $bak_file

awk '{ sub(/\r$/, ""); print }' "$bak_file" | \
awk 'BEGIN { RS=""; FS="\n"; OFS="," }
{
  gsub(/ /, "", $0)  # 删除所有空格
  gsub("／", "/", $0)
  gsub(/,/, "\\,", $0)  # 转义逗号
  gsub("\?", "？", $0)
  gsub("\[", "［", $0)
  gsub("\]", "］", $0)
  gsub("\(", "（", $0)
  gsub("\\\（", "\\(", $0)
  gsub("\)", "）", $0)
  gsub("\\\）", "\\)", $0)
  gsub("~", "〜", $0)
  gsub("～", "〜", $0)
  gsub(":", "：", $0)
  gsub("·", "・", $0)
  gsub("＋", "+", $0)
  gsub("\+", " + ", $0)
  gsub("(・・(・)+)", "……", $0)

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
}' > $input_file
