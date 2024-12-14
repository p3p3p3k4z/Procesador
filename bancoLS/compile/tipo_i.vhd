---------------------------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : bancoLS
-- Author      : mario
-- Company     : UTM
--
---------------------------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\bancoregistrosv4\bancoLS\compile\tipo_i.vhd
-- Generated   : Sat Dec 14 00:29:16 2024
-- From        : c:\My_Designs\bancoregistrosv4\bancoLS\src\tipo_i.bde
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


entity tipo_i is
  port(
       CLK : in STD_LOGIC;
       RST : in STD_LOGIC;
       NUM : in STD_LOGIC_VECTOR(5 downto 0)
  );
end tipo_i;

architecture tipo_i of tipo_i is

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
component MUX_EXTEND
  port (
       alu_src : in STD_LOGIC;
       banco : in STD_LOGIC_VECTOR(31 downto 0);
       ext : in STD_LOGIC_VECTOR(31 downto 0);
       salida : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component Sign_Extend
  port (
       dato_imm : in STD_LOGIC_VECTOR(11 downto 0);
       imm : out STD_LOGIC_VECTOR(31 downto 0)
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

signal NET135 : STD_LOGIC;
signal NET649 : STD_LOGIC;
signal BUS102 : STD_LOGIC_VECTOR (4 downto 0);
signal BUS106 : STD_LOGIC_VECTOR (4 downto 0);
signal BUS111 : STD_LOGIC_VECTOR (7 downto 0);
signal BUS117 : STD_LOGIC_VECTOR (6 downto 0);
signal BUS122 : STD_LOGIC_VECTOR (3 downto 0);
signal BUS169 : STD_LOGIC_VECTOR (3 downto 0);
signal BUS175 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS422 : STD_LOGIC_VECTOR (11 downto 0);
signal BUS430 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS474 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS599 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS609 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS79 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS80 : STD_LOGIC_VECTOR (5 downto 0);
signal BUS98 : STD_LOGIC_VECTOR (4 downto 0);

begin

----  Component instantiations  ----

U1 : ALU
  port map(
       alu_op => BUS169,
       alu_resultado => BUS175,
       op1 => BUS599,
       op2 => BUS609
  );

U2 : Banco_de_Registros
  port map(
       a1 => BUS102,
       a2 => BUS106,
       ad => BUS98,
       clk => CLK,
       di => BUS175,
       do1 => BUS599,
       do2 => BUS474,
       we => NET135
  );

U3 : decoder
  port map(
       dato => BUS79,
       dato_imm => BUS422,
       funct3 => BUS122,
       funct7 => BUS111,
       opcode => BUS117,
       rd => BUS98,
       rs1 => BUS102,
       rs2 => BUS106
  );

U4 : memoria_del_programa
  port map(
       a => BUS80,
       do => BUS79
  );

U5 : Sign_Extend
  port map(
       dato_imm => BUS422,
       imm => BUS430
  );

U6 : suma4
  port map(
       a_in => NUM,
       a_out => BUS80,
       clk => CLK,
       rst => RST
  );

U7 : unidad_de_control
  port map(
       funct3(0) => BUS122(1),
       funct3(1) => BUS122(2),
       funct3(2) => BUS122(3),
       funct7(0) => BUS111(1),
       funct7(1) => BUS111(2),
       funct7(2) => BUS111(3),
       funct7(3) => BUS111(4),
       funct7(4) => BUS111(5),
       funct7(5) => BUS111(6),
       funct7(6) => BUS111(7),
       alu_op => BUS169,
       alu_src => NET649,
       opcode => BUS117,
       wer => NET135
  );

U8 : MUX_EXTEND
  port map(
       alu_src => NET649,
       banco => BUS474,
       ext => BUS430,
       salida => BUS609
  );


end tipo_i;
