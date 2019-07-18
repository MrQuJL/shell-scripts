# :snail:shell-scripts

:fist_oncoming: 记录一些在编写 shell 脚本时实用的小技巧，大家可以结合自己工作中实际的需求添加到自己的脚本中。:sparkler:

### :books: Tips

1. [使用 tr 实现加密解密](https://github.com/MrQuJL/shell-scripts/blob/master/scripts/001_encryption.sh)

2. [输入密码时在命令行隐藏输入](https://github.com/MrQuJL/shell-scripts/blob/master/scripts/002_hide_pwd.sh)

3. [计算一组命令执行的时间](https://github.com/MrQuJL/shell-scripts/blob/master/scripts/003_cost.sh)

4. [在不按回车键的情况下读入n个字符](https://github.com/MrQuJL/shell-scripts/blob/master/scripts/004_read.sh)菜单

5. 使用 cat 将标准输入数据与文件数据组合在一起

   ```powershell
   $ echo 'Text through stdin' | cat - file.txt
   ```

   上面的 `-` 被作为标准输入文本的文件名

6. 使用 find 查找文件并忽略文件名的大小写

   ```powershell
   $ find . -iname 'file*' -print
   
   ./01_easy/file.sh
   ./02_fun/file.py
   ./02_fun/FILE.txt
   ./02_fun/file.txt
   ```

7. 创建特定大小的文件：

   ```shell
   dd if=/dev/zero of=junk.data bs=1M count=1
   ```

   * if 表示输入文件（input file）
   * of 表示输出文件（output file）
   * bs 指定了以字节为单位的块大小（block size）
   * count 表示需要被复制的块数

8. 持续运行命令直至命令执行成功：

   ```shell
   repeat() {
       while :;
       do
       	$@ && return;
       	sleep 30;
       done
   }
   # 例：
   repeat wget -c http://www.example.com/software-0.1.tar.gz
   # 该命令会每30秒就去下载http://www.example.com/software-0.1.tar.gz直至下载成功
   ```

   while 后的 `:` 这个符号是 shell 的內建命令，它总是返回0。

9. 将文件设置为不可修改状态：

   ```shell
   chattr +i test
   rm test
   rm: cannot remove 'test': Operation not permitted
   
   # 使文件恢复可写状态
   chattr -i test
   ```

10. 批量生成不同名字的空白文件

  ```shell
  for name in {1..100}.txt
  do
  touch $name
  done
  ```

11. 使用 diff 命令查看两个文件的差异（类似`git diff`）

    ```shell
    # version1.txt
    this is the original text
     line2
     line3
    line4
    happy hacking !
    
    # version2.txt
    this is the original text
    line2
    line4
    happy hacking !
    GNU is not UNIX
    
    diff -u version1.txt version2.txt
    ```

12. 使用 `pidof` 命令获取某个进程的 PID

    ```shell
    pidof 进程名
    ```

13. 使用 find 命令删除匹配到的文件：

    ```shell
    find . -type f -name "*.swp" -delete
    ```

14. 只列出目录

    ```shell
    find . -type d -maxdepth 1 -print
    ls -l | grep "^d"
    ls -F | grep "/$"
    ls -d */
    ```

15. 使用 grep 在多级目录中对文件中的内容进行搜索：

    ```shell
    grep "test" . -R -n
    ```

    ```
    ./d5.txt:14:b193ec445727525003fe7a7f8e92054b  ./01_easy/test.sh
    ./d5.txt:25:d41d8cd98f00b204e9800998ecf8427e  ./02_fun/test/1.py
    ./d5.txt:26:d41d8cd98f00b204e9800998ecf8427e  ./02_fun/test/ru.sh
    ./d5.txt:27:5be90d813d6c8856c467222c0a1e9f6c  ./02_fun/test.txt
    ```

    命令表示：查找文件内容中有 "test" 的文件，并打印行号。

16. 使用 egrep 命令统计文件中匹配项的数量：

    ```shell
    echo -e "1 2 3 4\nhello\n5 6" | egrep -o "[0-9]" | wc -l
    ```

17. 使用 grep 打印出匹配文本附近的行：

    ```shell
    seq 10 | grep 5 -C 3
    ```

    会打印出匹配 5 的行以及紧邻 5 之前的 3 行以及之后的 3 行

18. 使用 sed 进行文本替换：

    ```shell
    # 将a.txt中所有的text替换成MrQuJL，不是真正的替换只打印到屏幕
    sed 's/text/MrQuJL/g' a.txt
    
    # 将a.txt中所有的text替换成MrQuJL，真正替换
    sed -i 's/text/MrQuJL/g' a.txt
    ```

19. 使用 awk 打印文件的每一行：

    ```shell
    echo -e "line1\nline2" | awk 'BEGIN{print "Start"} {print} END{print "End"}'
    ```

20. 使用 grep 和 awk 实现词频统计：

    ```shell
    #!/bin/bash
    # 文件名：word_freq.sh
    # 用途：计算文件中的单词频率
    
    if [ $# -ne 1 ];
      echo "Usage: $0 filename";
      exit -1
    fi
    
    filename=$1
    egrep -o '\b[[:alpha:]]+\b' $filename | \
      awk '{count[$0]++}
      	END{ printf("%-14s%s\n", "Word", "Count") ;
      	  for (ind in count) {printf("%-14s%d\n", ind, count[ind])}
      	  }
      '
    
    输出如下：
    $ ./word_freq.sh words.txt
    Word		Count
    used		1
    this		2
    counting	3
    ```

21. 打印从第 M 行到第 N 行之间的文本：

    ```shell
    awk 'NR==M, NR==N' a.txt
    ```

22. 将当前目录下的.java文件中的Copyright替换成Copyleft：

    ```shell
    find . -name "*.java" -print0 | xargs -0 -I {} sed -i 's/Copyright/Copyleft/g' {}
    ```

23. 使用 curl 判断某个网站是否可以访问（是否宕机）

    ```shelll
    curl -I www.baidu.com
    echo $?
    # 打印0表示可以访问，其他表示已宕机
    ```

24. 从 ifconfig 输出中提取 ip 地址：

    ```shell
    ifconfig eth0 | egrep -o "inet:[^ ]*" | grep -o "[0-9.]*"
    ```

25. 使用并行 ping 列出网络中所有活动的主机：

    ```shell
    #!/bin/bash
    # 文件名：fast_ping.sh
    # 用途：根据你所在网络的实际情况修改网络地址192.168.0。
    
    for ip in 192.168.0.{1..255};
    do
      (
      	ping $ip -c2 &> /dev/null
      	if [$? -eq 0];
      	then
      	  echo $ip is alive
      	fi
      )&
    done
    wait
    ```

26. 使用 du 命令来统计某个文件或目录占用的磁盘空间：

    ```shell
    du -h /usr/bin
    ```

27. 找出指定目录中最大的10个文件：

    ```shell
    find . -type f -exec du -k {} \; | sort -nrk 1 | head
    ```

28. 列出当前登录的用户列表：

    ```shell
    users | tr ' ' '\n' | sort | uniq
    ```

    

































