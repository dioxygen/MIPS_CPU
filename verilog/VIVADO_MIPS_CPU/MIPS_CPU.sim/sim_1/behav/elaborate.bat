@echo off
set xv_path=D:\\xvivado\\Vivado\\2015.2\\bin
call %xv_path%/xelab  -wto 445b364d17ca44bd8c64011c66f38235 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot MIPS_CPU_tb_behav xil_defaultlib.MIPS_CPU_tb xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
