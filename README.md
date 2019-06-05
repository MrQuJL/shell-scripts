# :snail:shell-scripts

:fist_oncoming: 记录一些在编写 shell 脚本时实用的小技巧，大家可以结合自己工作中实际的需求添加到自己的脚本中。:sparkler:

### :books: Tips

1. [使用 tr 实现加密解密](https://github.com/MrQuJL/shell-scripts/blob/master/scripts/001_encryption.sh)

2. [输入密码时在命令行隐藏输入](https://github.com/MrQuJL/shell-scripts/blob/master/scripts/002_hide_pwd.sh)

3. [计算一组命令执行的时间](https://github.com/MrQuJL/shell-scripts/blob/master/scripts/003_cost.sh)

4. [在不按回车键的情况下读入n个字符](https://github.com/MrQuJL/shell-scripts/blob/master/scripts/004_read.sh)菜单

5. 使用 cat 将标准输入数据与文件数据组合在一起
   
   ```powershell
   echo 'Text through stdin' | cat - file.txt
   ```
   
   上面的 `-` 被作为标准输入文本的文件名

6. 使用 find 查找文件并忽略文件名的大小写
   
   ```powershell
   find . -iname 'file*'

   ./01_easy/file.sh
   ./02_fun/file.py
   ./02_fun/FILE.txt
   ./02_fun/file.txt
   ```
