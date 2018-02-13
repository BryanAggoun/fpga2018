@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto 2c137e6d527646c7a715b45dddc87049 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot TB_Test_behav xil_defaultlib.TB_Test -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
