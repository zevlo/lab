#!/bin/bash

df -BM --exclude-type=tmpfs --exclude-type=devtmpfs --exclude-type=squashfs | awk '
NR > 1 {
  gsub("M", "", $2); size += $2;
  gsub("M", "", $3); used += $3;
}
END {
  if (size > 0) {
    percent = (used / size) * 100;
    printf("Physical Disk Usage: %.2f%% - ", percent);
    print (percent > 80) ? "Above 80%" : "Below 80%";
  }
}'
