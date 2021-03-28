# **第二次实验**

## _实验目的_

阅读vimtutor，学会基本操作

## _实验内容_

1. 视频chap0x01

[![asciicast](https://asciinema.org/a/fpoJ9HeQcBkB3DIGdZ6UfWduY.svg)](https://asciinema.org/a/fpoJ9HeQcBkB3DIGdZ6UfWduY)

2. 视频chap0x02

[![asciicast](https://asciinema.org/a/h44iiB5uTprTtRLDoc8nY1KTi.svg)](https://asciinema.org/a/h44iiB5uTprTtRLDoc8nY1KTi)

3. 视频chap0x03

[![asciicast](https://asciinema.org/a/dHFw3Tje5fO0vGRZfiFkryikp.svg)](https://asciinema.org/a/dHFw3Tje5fO0vGRZfiFkryikp)

4. 视频chap0x04

[![asciicast](https://asciinema.org/a/JQEzTyeEuCLc69RxaElDIqmBe.svg)](https://asciinema.org/a/JQEzTyeEuCLc69RxaElDIqmBe)

5. 视频chap0x05

[![asciicast](https://asciinema.org/a/8S8dtYS9xtsIylm7I2MRkKnZV.svg)](https://asciinema.org/a/8S8dtYS9xtsIylm7I2MRkKnZV)

6. 视频chap0x06

[![asciicast](https://asciinema.org/a/MIHXh4kLLQRSo8Y7bwaYl0BCH.svg)](https://asciinema.org/a/MIHXh4kLLQRSo8Y7bwaYl0BCH)

7. 视频chap0x07

[![asciicast](https://asciinema.org/a/n1SZSvBuHAuJrGvBBfCRKhCpA.svg)](https://asciinema.org/a/n1SZSvBuHAuJrGvBBfCRKhCpA)

##### 实验步骤
1. 你了解vim有哪几种工作模式？
visual模式，normal模式，insert模式

2. Normal模式下，从当前行开始，一次向下移动光标10行的操作方法？如何快速移动到文件开始行和结束行？如何快速跳转到文件中的第N行？
    1. 一次向下移动光标10行：`10j`
    2. 移动到文件开始行和结束行：`gg` `G`
    3. 快速跳转到文件中的第N行：`NG`,

3. Normal模式下，如何删除单个字符、单个单词、从当前光标位置一直删除到行尾、单行、当前行开始向下数N行？
    1. 删除单个字符：`x`
    2. 删除单个单词：`dw`
    3. 删除到行尾：`d$`
    4. 删除单行：`dd`
    5. 删除下N行：`Ndd`
4. 如何在vim中快速插入N个空行？如何在vim中快速输入80个-？

    1. 插入N个空行：`No ESC` （O为在上插入，o为在下插入）
    2. 插入80个-：`80i- ESC`

5. 如何撤销最近一次编辑操作？如何重做最近一次被撤销的操作？
    1. 撤销最近一次编辑操作：`u`
    2. 重做最近一次被撤销的操作：`Ctrl+R`

6. vim中如何实现剪切粘贴单个字符？单个单词？单行？如何实现相似的复制粘贴操作呢？
    1. 剪切单个字符：`x`
    2. 单个单词：`dw`
    3. 单行：`dd`
    4. 复制单个字符：`y`
    5. 单个单词：`yw`
    6. 单行：`yy`
    7. 粘贴操作：`P p`
    8. 也可以在Visual模式下选择好范围后 `d 剪切，y 复制，p 粘贴` 

7. 为了编辑一段文本你能想到哪几种操作方式（按键序列）
    1. 光标移动：`h,j,k,l,w,W,b,B,Ctrl+b,Ctrl+f,gg,G`,还有上下左右方向键
    2. 编辑操作（插入或替换）：`i,a,o,O,cw`
    3. 删除操作：`x,dd,dw,D`
    4. 查询操作：`/查找内容`
    5. 退出:`wq,:q,:q!`
8. 查看当前正在编辑的文件名的方法？查看当前光标所在行的行号的方法？
    1. `Ctrl-g`
9. 在文件中进行关键词搜索你会哪些方法？如何设置忽略大小写的情况下进行匹配搜索？如何将匹配的搜索结果进行高亮显示？如何对匹配到的关键词进行批量替换？
    1. 关键词搜索：`/pattern`
    2. 设置忽略大小写：`:set ignorecase and :set ic`
    3. 搜索结果高亮：`:set hlsearch and :set hls`
    4. 关键词进行批量替换：`:%s/old/new/g`

10. 文件中最近编辑过的位置来回快速跳转的方法？
    1. `Ctrl-o` `Ctrl-i`

11. 如何把光标定位到各种括号的匹配项？例如：找到(, [, or {对应匹配的),], or }

    1. 光标移至需要匹配的括号，按`%`

12. 在不退出vim的情况下执行一个外部程序的方法？

    1.  `:!外部程序命令`
13. 如何使用vim的内置帮助系统来查询一个内置默认快捷键的使用方法？如何在两个不同的分屏窗口中移动光标？

    1. 查询一个内置默认快捷键 `:help w`，w为名称,ctrl-d显示可选项，tab 补全