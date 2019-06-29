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

    









































