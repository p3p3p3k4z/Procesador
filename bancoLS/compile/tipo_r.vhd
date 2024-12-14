---------------------------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : bancoLS
-- Author      : mario
-- Company     : UTM
--
---------------------------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\bancoregistrosv4\bancoLS\compile\tipo_r.vhd
-- Generated   : Sat Dec 14 00:29:02 2024
-- From        : c:\My_Designs\bancoregistrosv4\bancoLS\src\tipo_r.bde
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


entity tipo_r is
  port(
       CLK : in STD_LOGIC;
       RST : in STD_LOGIC;
       NUM : in STD_LOGIC_VECTOR(5 downto 0)
  );
end tipo_r;

architecture tipo_r of tipo_r is

---- Component declarations -----

component ALU
  port (
       alu_op : in STD_LOGIC_VECTOR(3 downto 0);
       op1 : in STD_LOGIC_VECTOR(31 downto 0);
       op2 : in STD_LOGIC_VECTOR(31 downto 0);
       alu_resultado : out STD_LOGIC_VECTOR(31 downto 0)
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
component decoder
  port (
       dato : in STD_LOGIC_VECTOR(31 downto 0);
       dato_imm : out STD_LOGIC_VECTOR(11 downto 0);
       funct3 : out STD_LOGIC_VECTOR(3 downto 0);
       funct7 : out STD_LOGIC_VECTOR(7 downto 0);
       opcode : out STD_LOGIC_VECTOR(6 downto 0);
       rd : out STD_LOGIC_VECTOR(4 downto 0);
       rs1 : out STD_LOGIC_VECTOR(4 downto 0);
       rs2 : out STD_LOGIC_VECTOR(4 downto 0)
  );
end component;
component memoria_del_programa
  port (
       a : in STD_LOGIC_VECTOR(5 downto 0);
       do : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component suma4
  port (
       a_in : in STD_LOGIC_VECTOR(5 downto 0);
       clk : in STD_LOGIC;
       rst : in STD_LOGIC;
       a_out : out STD_LOGIC_VECTOR(5 downto 0)
  );
end component;
component unidad_de_control
  port (
       funct3 : in STD_LOGIC_VECTOR(2 downto 0);
       funct7 : in STD_LOGIC_VECTOR(6 downto 0);
       opcode : in STD_LOGIC_VECTOR(6 downto 0);
       alu2reg : out STD_LOGIC;
       alu_op : out STD_LOGIC_VECTOR(3 downto 0);
       alu_src : out STD_LOGIC;
       imm_rd : out STD_LOGIC;
       wem : out STD_LOGIC;
       wer : out STD_LOGIC
  );
end component;

---- Signal declarations used on the diagram ----

signal NET352 : STD_LOGIC;
signal BUS105 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS109 : STD_LOGIC_VECTOR (5 downto 0);
signal BUS176 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS180 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS184 : STD_LOGIC_VECTOR (4 downto 0);
signal BUS192 : STD_LOGIC_VECTOR (4 downto 0);
signal BUS200 : STD_LOGIC_VECTOR (4 downto 0);
signal BUS208 : STD_LOGIC_VECTOR (7 downto 0);
signal BUS216 : STD_LOGIC_VECTOR (6 downto 0);
signal BUS224 : STD_LOGIC_VECTOR (3 downto 0);
signal BUS505 : STD_LOGIC_VECTOR (3 downto 0);
signal BUS513 : STD_LOGIC_VECTOR (31 downto 0);

begin

----  Component instantiations  ----

U1 : ALU
  port map(
       alu_op => BUS505,
       alu_resultado => BUS513,
       op1 => BUS176,
       op2 => BUS180
  );

U2 : Banco_de_Registros
  port map(
       a1 => BUS192,
       a2 => BUS200,
       ad => BUS184,
       clk => CLK,
       di => BUS513,
       do1 => BUS176,
       do2 => BUS180,
       we => NET352
  );

U3 : decoder
  port map(
       dato => BUS105,
       funct3 => BUS224,
       funct7 => BUS208,
       opcode => BUS216,
       rd => BUS184,
       rs1 => BUS192,
       rs2 => BUS200
  );

U4 : memoria_del_programa
  port map(
       a => BUS109,
       do => BUS105
  );

U6 : suma4
  port map(
       a_in => NUM,
       a_out => BUS109,
       clk => CLK,
       rst => RST
  );

U7 : unidad_de_control
  port map(
       funct3(0) => BUS224(1),
       funct3(1) => BUS224(2),
       funct3(2) => BUS224(3),
       funct7(0) => BUS208(1),
       funct7(1) => BUS208(2),
       funct7(2) => BUS208(3),
       funct7(3) => BUS208(4),
       funct7(4) => BUS208(5),
       funct7(5) => BUS208(6),
       funct7(6) => BUS208(7),
       alu_op => BUS505,
       opcode => BUS216,
       wer => NET352
  );


end tipo_r;
