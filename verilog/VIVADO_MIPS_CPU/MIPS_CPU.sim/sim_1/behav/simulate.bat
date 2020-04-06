@echo off
set xv_path=D:\\xvivado\\Vivado\\2015.2\\bin
call %xv_path%/xsim MIPS_CPU_tb_behav -key {Behavioral:sim_1:Functional:MIPS_CPU_tb} -tclbatch MIPS_CPU_tb.tcl -view C:/Users/YANGQING/Desktop/computer/MIPS_CPU/MIPS_CPU_tb_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
