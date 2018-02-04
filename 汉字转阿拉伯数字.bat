
汉字转阿拉伯数字.bat
----------------------
@echo off
for /f  "delims=" %%i in ('dir /b') do call :Replacement "%%i"
exit
:Replacement
set t1=%~1
set t1=%t1:九十=90%
set t1=%t1:八十=80%
set t1=%t1:七十=70%
set t1=%t1:六十=60%
set t1=%t1:五十=50%
set t1=%t1:四十=40%
set t1=%t1:三十=30%
set t1=%t1:二十=20%
set t1=%t1:十一=11%
set t1=%t1:十二=12%
set t1=%t1:十三=13%
set t1=%t1:十四=14%
set t1=%t1:十五=15%
set t1=%t1:十六=16%
set t1=%t1:十七=17%
set t1=%t1:十八=18%
set t1=%t1:十九=19%
set t1=%t1:十=10%
set t1=%t1:九=9%
set t1=%t1:八=8%
set t1=%t1:七=7%
set t1=%t1:六=6%
set t1=%t1:五=5%
set t1=%t1:四=4%
set t1=%t1:三=3%
set t1=%t1:二=2%
set t1=%t1:一=1%
set t1=%t1:零=0%
set t1=%t1:09=9%
set t1=%t1:08=8%
set t1=%t1:07=7%
set t1=%t1:06=6%
set t1=%t1:05=5%
set t1=%t1:04=4%
set t1=%t1:03=3%
set t1=%t1:02=2%
set t1=%t1:01=1%
echo %t1%
ren %1 "%t1%" 
goto :eof

解决UNC路径不受支持问题
内容就是：

用作为当前目录的以上路径启动了 CMD.EXE。 UNC 路径不受支持。默认值设为 Windows 目录。 

出现的原因：

估计是因为在 网络路径 下所致，如果在普通目录下就没这种问题。

解决方法:
在注册表中,添加一个值即可.路径如下:
 HKEY_CURRENT_USER\Software\Microsoft\Command Processor               
添加值 DisableUNCCheck，    类型为 REG_DWORD    并将该值设置为1 （十六进制）。

批处理文件如下：（虽然运行的时候会有正确提示，但是实际上却没加进去还需要修改）
reg add "HKEY_CURRENT_USER\Software\Microsoft\Command Processor" /v "DisableUNCCheck" /t "REG_DWORD" /d "1" /f
