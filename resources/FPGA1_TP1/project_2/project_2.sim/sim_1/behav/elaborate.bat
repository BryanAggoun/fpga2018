@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto 88ae4126848c4f96af873930ad996926 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot TB_Top_behav xil_defaultlib.TB_Top -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
