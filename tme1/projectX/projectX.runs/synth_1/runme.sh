#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/users/soft/xilinx/SDK/2014.4/bin:/users/soft/xilinx/Vivado/2014.4/ids_lite/ISE/bin/lin:/users/soft/xilinx/Vivado/2014.4/bin
else
  PATH=/users/soft/xilinx/SDK/2014.4/bin:/users/soft/xilinx/Vivado/2014.4/ids_lite/ISE/bin/lin:/users/soft/xilinx/Vivado/2014.4/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=/users/soft/xilinx/Vivado/2014.4/ids_lite/ISE/lib/lin
else
  LD_LIBRARY_PATH=/users/soft/xilinx/Vivado/2014.4/ids_lite/ISE/lib/lin:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD=`dirname "$0"`
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log IMPULSE_COUNT.vds -m32 -mode batch -messageDb vivado.pb -source IMPULSE_COUNT.tcl
