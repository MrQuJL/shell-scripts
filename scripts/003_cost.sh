#!/bin/bash
# 开始时间
start=$(date +%s)
# 下面是待执行的命令
for i in `seq 1 3`
do
  sleep $i
done
# 截止时间
end=$(date +%s)
difference=$[end-start]
echo Time taken to execute commands is $difference seconds.