@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.4\\bin
call %xv_path%/xsim TB_impulse_count_func_synth -key {Post-Synthesis:sim_1:Functional:TB_impulse_count} -tclbatch TB_impulse_count.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
