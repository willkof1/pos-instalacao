#!/bin/bash
#script para listar os ultimos 10 processos que estão consumindo mais memoria#
#creditos = https://www.shellhacks.com/find-top-processes-memory-usage-linux#
ps axo rss,comm,pid \
| awk '{ proc_list[$2]++; proc_list[$2 "," 1] += $1; } \
END { for (proc in proc_list) { printf("%d\t%s\n", \
proc_list[proc "," 1],proc); }}' \
| sort -n \
| tail -n 5 \
| sort -rn \
| awk '{$1/=1024;printf "%.0f MB\t",$1}{print $2}'