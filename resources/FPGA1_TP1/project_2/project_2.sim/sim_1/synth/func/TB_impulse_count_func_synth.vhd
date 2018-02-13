-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
-- Date        : Tue Feb 06 11:29:15 2018
-- Host        : S226-04 running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               C:/Users/3408804/Downloads/FPGA1_TP1/project_2/project_2.sim/sim_1/synth/func/TB_impulse_count_func_synth.vhd
-- Design      : IMPULSE_COUNT
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-3
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity IMPULSE_COUNT is
  port (
    Reset : in STD_LOGIC;
    Button_L : in STD_LOGIC;
    Button_C : in STD_LOGIC;
    Count : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Sup : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of IMPULSE_COUNT : entity is true;
end IMPULSE_COUNT;

architecture STRUCTURE of IMPULSE_COUNT is
  signal Button_C_IBUF : STD_LOGIC;
  signal Button_C_IBUF_BUFG : STD_LOGIC;
  signal Count_OBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal Sup_OBUF : STD_LOGIC;
  signal \cpt[1]_i_1_n_0\ : STD_LOGIC;
  signal \cpt[2]_i_1_n_0\ : STD_LOGIC;
  signal \cpt[3]_i_1_n_0\ : STD_LOGIC;
  signal minusOp : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of Sup_OBUF_inst_i_1 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \cpt[1]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \cpt[2]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \cpt[3]_i_1\ : label is "soft_lutpair0";
begin
Button_C_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => Button_C_IBUF,
      O => Button_C_IBUF_BUFG
    );
Button_C_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => Button_C,
      O => Button_C_IBUF
    );
\Count_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Count_OBUF(0),
      O => Count(0)
    );
\Count_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Count_OBUF(1),
      O => Count(1)
    );
\Count_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Count_OBUF(2),
      O => Count(2)
    );
\Count_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Count_OBUF(3),
      O => Count(3)
    );
Sup_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => Sup_OBUF,
      O => Sup
    );
Sup_OBUF_inst_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E0"
    )
        port map (
      I0 => Count_OBUF(2),
      I1 => Count_OBUF(1),
      I2 => Count_OBUF(3),
      O => Sup_OBUF
    );
\cpt[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Count_OBUF(0),
      O => minusOp(0)
    );
\cpt[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Count_OBUF(0),
      I1 => Count_OBUF(1),
      O => \cpt[1]_i_1_n_0\
    );
\cpt[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E1"
    )
        port map (
      I0 => Count_OBUF(1),
      I1 => Count_OBUF(0),
      I2 => Count_OBUF(2),
      O => \cpt[2]_i_1_n_0\
    );
\cpt[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE01"
    )
        port map (
      I0 => Count_OBUF(2),
      I1 => Count_OBUF(0),
      I2 => Count_OBUF(1),
      I3 => Count_OBUF(3),
      O => \cpt[3]_i_1_n_0\
    );
\cpt_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Button_C_IBUF_BUFG,
      CE => '1',
      D => minusOp(0),
      Q => Count_OBUF(0),
      R => '0'
    );
\cpt_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Button_C_IBUF_BUFG,
      CE => '1',
      D => \cpt[1]_i_1_n_0\,
      Q => Count_OBUF(1),
      R => '0'
    );
\cpt_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Button_C_IBUF_BUFG,
      CE => '1',
      D => \cpt[2]_i_1_n_0\,
      Q => Count_OBUF(2),
      R => '0'
    );
\cpt_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Button_C_IBUF_BUFG,
      CE => '1',
      D => \cpt[3]_i_1_n_0\,
      Q => Count_OBUF(3),
      R => '0'
    );
end STRUCTURE;
