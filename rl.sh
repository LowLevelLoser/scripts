#!/usr/bin/env bash

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <line_number> <file>"
  exit 1
fi

line_number=$1
file=$2

sed -n "${line_number}p" "${file}" | sh
