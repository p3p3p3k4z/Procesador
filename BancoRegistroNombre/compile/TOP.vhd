---------------------------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : BancoRegistroNombre
-- Author      : mario
-- Company     : UTM
--
---------------------------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\BancoRegistrosv3\BancoRegistroNombre\compile\TOP.vhd
-- Generated   : Wed Dec 11 19:37:08 2024
-- From        : c:\My_Designs\BancoRegistrosv3\BancoRegistroNombre\src\TOP.bde
-- By          : Bde2Vhdl ver. 2.6
--
---------------------------------------------------------------------------------------------------
--
-- Description : 
--
---------------------------------------------------------------------------------------------------
-- Design unit header --
library IEEE;
use IEEE.std_logic_1164.all;


entity TOP is
  port(
       CLK : in STD_LOGIC;
       INSTR : in STD_LOGIC_VECTOR(31 downto 0)
  );
end TOP;

architecture TOP of TOP is

---- Component declarations -----

component ALU
  port (
       alu_op : in STD_LOGIC_VECTOR(3 downto 0);
       op1 : in STD_LOGIC_VECTOR(31 downto 0);
       op2 : in STD_LOGIC_VECTOR(31 downto 0);
       alu_resultado : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component ALU_CONTROL
  port (
       funct3 : in STD_LOGIC_VECTOR(2 downto 0);
       funct7 : in STD_LOGIC_VECTOR(6 downto 0);
       opcode : in STD_LOGIC_VECTOR(6 downto 0);
       alu_op : out STD_LOGIC_VECTOR(3 downto 0);
       alu_src : out STD_LOGIC;
       wer : out STD_LOGIC
  );
end component;
component Banco_de_Registros
  port (
       a1 : in STD_LOGIC_VECTOR(4 downto 0);
       a2 : in STD_LOGIC_VECTOR(4 downto 0);
       ad : in STD_LOGIC_VECTOR(4 downto 0);
       clk : in STD_LOGIC;
       di : in STD_LOGIC_VECTOR(31 downto 0);
       we : in STD_LOGIC;
       do1 : out STD_LOGIC_VECTOR(31 downto 0);
       do2 : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component Instruccion
  port (
       clk : in STD_LOGIC;
       dato : in STD_LOGIC_VECTOR(31 downto 0);
       dato_imm : out STD_LOGIC_VECTOR(11 downto 0);
       funct3 : out STD_LOGIC_VECTOR(2 downto 0);
       funct7 : out STD_LOGIC_VECTOR(6 downto 0);
       opcode : out STD_LOGIC_VECTOR(6 downto 0);
       rd : out STD_LOGIC_VECTOR(4 downto 0);
       rs1 : out STD_LOGIC_VECTOR(4 downto 0);
       rs2 : out STD_LOGIC_VECTOR(4 downto 0)
  );
end component;
component MUX_EXTEND
  port (
       alu_src : in STD_LOGIC;
       banco : in STD_LOGIC_VECTOR(31 downto 0);
       ext : in STD_LOGIC_VECTOR(31 downto 0);
       salida : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component sign_extend
  port (
       dato_imm : in STD_LOGIC_VECTOR(11 downto 0);
       imm : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

---- Signal declarations used on the diagram ----

signal NET232 : STD_LOGIC;
signal NET240 : STD_LOGIC;
signal BUS122 : STD_LOGIC_VECTOR (11 downto 0);
signal BUS130 : STD_LOGIC_VECTOR (4 downto 0);
signal BUS138 : STD_LOGIC_VECTOR (4 downto 0);
signal BUS146 : STD_LOGIC_VECTOR (4 downto 0);
signal BUS154 : STD_LOGIC_VECTOR (2 downto 0);
signal BUS162 : STD_LOGIC_VECTOR (6 downto 0);
signal BUS170 : STD_LOGIC_VECTOR (6 downto 0);
signal BUS196 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS204 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS212 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS216 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS224 : STD_LOGIC_VECTOR (3 downto 0);
signal BUS252 : STD_LOGIC_VECTOR (31 downto 0);

begin

----  Component instantiations  ----

U1 : sign_extend
  port map(
       dato_imm => BUS122,
       imm => BUS204
  );

U2 : MUX_EXTEND
  port map(
       alu_src => NET232,
       banco => BUS196,
       ext => BUS204,
       salida => BUS212
  );

U3 : Instruccion
  port map(
       clk => CLK,
       dato => INSTR,
       dato_imm => BUS122,
       funct3 => BUS154,
       funct7 => BUS162,
       opcode => BUS170,
       rd => BUS146,
       rs1 => BUS130,
       rs2 => BUS138
  );

U4 : Banco_de_Registros
  port map(
       a1 => BUS130,
       a2 => BUS138,
       ad => BUS146,
       clk => CLK,
       di => BUS252,
       do1 => BUS216,
       do2 => BUS196,
       we => NET240
  );

U5 : ALU_CONTROL
  port map(
       alu_op => BUS224,
       alu_src => NET232,
       funct3 => BUS154,
       funct7 => BUS162,
       opcode => BUS170,
       wer => NET240
  );

U6 : ALU
  port map(
       alu_op => BUS224,
       alu_resultado => BUS252,
       op1 => BUS216,
       op2 => BUS212
  );


end TOP;
