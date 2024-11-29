---------------------------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : banco_comp
-- Author      : Mario
-- Company     : UTM
--
---------------------------------------------------------------------------------------------------
--
-- File        : c:\Users\Mario\Documents\arquitectura_computadoras\banco_comp\compile\top.vhd
-- Generated   : Wed Nov 27 18:50:30 2024
-- From        : c:\Users\Mario\Documents\arquitectura_computadoras\banco_comp\src\top.bde
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


entity top is
  port(
       CLK : in STD_LOGIC;
       INSTR : in STD_LOGIC_VECTOR(31 downto 0)
  );
end top;

architecture top of top is

---- Component declarations -----

component Alu
  port (
       op1 : in STD_LOGIC_VECTOR(31 downto 0);
       op2 : in STD_LOGIC_VECTOR(31 downto 0);
       s : in STD_LOGIC_VECTOR(3 downto 0);
       res : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component Banco_Registros
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
component Control
  port (
       funct3 : in STD_LOGIC_VECTOR(2 downto 0);
       funct7 : in STD_LOGIC_VECTOR(6 downto 0);
       opcode : in STD_LOGIC_VECTOR(6 downto 0);
       op : out STD_LOGIC_VECTOR(3 downto 0);
       op_instruccion : out STD_LOGIC;
       we : out STD_LOGIC
  );
end component;
component Demux
  port (
       banco : in STD_LOGIC_VECTOR(31 downto 0);
       ext : in STD_LOGIC_VECTOR(31 downto 0);
       op_instruccion : in STD_LOGIC;
       salida : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component Extensor_Signo
  port (
       fun7 : in STD_LOGIC_VECTOR(6 downto 0);
       rst1 : in STD_LOGIC_VECTOR(4 downto 0);
       shift_op : in STD_LOGIC;
       ext : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component Instruccion
  port (
       clk : in STD_LOGIC;
       dato : in STD_LOGIC_VECTOR(31 downto 0);
       fun7_ori : out STD_LOGIC_VECTOR(6 downto 0);
       funct3 : out STD_LOGIC_VECTOR(2 downto 0);
       funct7 : out STD_LOGIC_VECTOR(6 downto 0);
       opcode : out STD_LOGIC_VECTOR(6 downto 0);
       rd : out STD_LOGIC_VECTOR(4 downto 0);
       rs1 : out STD_LOGIC_VECTOR(4 downto 0);
       rs2 : out STD_LOGIC_VECTOR(4 downto 0);
       shift_op : out STD_LOGIC
  );
end component;

---- Signal declarations used on the diagram ----

signal NET162 : STD_LOGIC;
signal NET201 : STD_LOGIC;
signal NET259 : STD_LOGIC;
signal BUS154 : STD_LOGIC_VECTOR (6 downto 0);
signal BUS182 : STD_LOGIC_VECTOR (4 downto 0);
signal BUS185 : STD_LOGIC_VECTOR (4 downto 0);
signal BUS193 : STD_LOGIC_VECTOR (4 downto 0);
signal BUS213 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS217 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS223 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS231 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS239 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS251 : STD_LOGIC_VECTOR (3 downto 0);
signal BUS267 : STD_LOGIC_VECTOR (2 downto 0);
signal BUS275 : STD_LOGIC_VECTOR (6 downto 0);
signal BUS283 : STD_LOGIC_VECTOR (6 downto 0);

begin

----  Component instantiations  ----

U1 : Instruccion
  port map(
       clk => CLK,
       dato => INSTR,
       fun7_ori => BUS154,
       funct3 => BUS267,
       funct7 => BUS275,
       opcode => BUS283,
       rd => BUS193,
       rs1 => BUS185,
       rs2 => BUS182,
       shift_op => NET162
  );

U2 : Control
  port map(
       funct3 => BUS267,
       funct7 => BUS275,
       op => BUS251,
       op_instruccion => NET259,
       opcode => BUS283,
       we => NET201
  );

U3 : Banco_Registros
  port map(
       a1 => BUS185,
       a2 => BUS182,
       ad => BUS193,
       clk => CLK,
       di => BUS239,
       do1 => BUS217,
       do2 => BUS223,
       we => NET201
  );

U4 : Alu
  port map(
       op1 => BUS217,
       op2 => BUS213,
       res => BUS239,
       s => BUS251
  );

U5 : Demux
  port map(
       banco => BUS223,
       ext => BUS231,
       op_instruccion => NET259,
       salida => BUS213
  );

U6 : Extensor_Signo
  port map(
       ext => BUS231,
       fun7 => BUS154,
       rst1 => BUS182,
       shift_op => NET162
  );


end top;
