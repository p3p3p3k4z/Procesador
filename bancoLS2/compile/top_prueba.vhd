---------------------------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : bancoLS2
-- Author      : mario
-- Company     : UTM
--
---------------------------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\bancoregistrosv4\bancoLS2\compile\top_prueba.vhd
-- Generated   : Sat Dec 14 18:26:22 2024
-- From        : c:\My_Designs\bancoregistrosv4\bancoLS2\src\top_prueba.bde
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


entity top_prueba is
  port(
       CLK : in STD_LOGIC;
       RST : in STD_LOGIC;
       INSTR : in STD_LOGIC_VECTOR(5 downto 0)
  );
end top_prueba;

architecture top_prueba of top_prueba is

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
component Memoria_de_Datos
  port (
       a : in STD_LOGIC_VECTOR(31 downto 0);
       clk : in STD_LOGIC;
       di : in STD_LOGIC_VECTOR(31 downto 0);
       we : in STD_LOGIC;
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
component mux_rd
  port (
       fun7 : in STD_LOGIC_VECTOR(6 downto 0);
       imm_rd : in STD_LOGIC;
       rd : in STD_LOGIC_VECTOR(4 downto 0);
       rs2 : in STD_LOGIC_VECTOR(4 downto 0);
       salida_rd : out STD_LOGIC_VECTOR(11 downto 0)
  );
end component;
component mux_reg
  port (
       alu2reg : in STD_LOGIC;
       operacion_alu : in STD_LOGIC_VECTOR(31 downto 0);
       registro_mem : in STD_LOGIC_VECTOR(31 downto 0);
       salida_reg : out STD_LOGIC_VECTOR(31 downto 0)
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

----     Constants     -----
constant DANGLING_INPUT_CONSTANT : STD_LOGIC := 'Z';

---- Signal declarations used on the diagram ----

signal NET259 : STD_LOGIC;
signal NET269 : STD_LOGIC;
signal NET319 : STD_LOGIC;
signal NET340 : STD_LOGIC;
signal NET352 : STD_LOGIC;
signal NET618 : STD_LOGIC;
signal NET619 : STD_LOGIC;
signal BUS138 : STD_LOGIC_VECTOR (5 downto 0);
signal BUS152 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS157 : STD_LOGIC_VECTOR (11 downto 0);
signal BUS161 : STD_LOGIC_VECTOR (7 downto 0);
signal BUS178 : STD_LOGIC_VECTOR (4 downto 0);
signal BUS189 : STD_LOGIC_VECTOR (4 downto 0);
signal BUS202 : STD_LOGIC_VECTOR (4 downto 0);
signal BUS212 : STD_LOGIC_VECTOR (6 downto 0);
signal BUS222 : STD_LOGIC_VECTOR (3 downto 0);
signal BUS234 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS244 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS248 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS251 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS294 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS305 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS325 : STD_LOGIC_VECTOR (3 downto 0);

---- Declaration for Dangling input ----
signal Dangling_Input_Signal : STD_LOGIC;

---- Declarations for Dangling outputs ----
signal DANGLING_U5_salida_reg_30 : STD_LOGIC;
signal DANGLING_U5_salida_reg_29 : STD_LOGIC;
signal DANGLING_U5_salida_reg_28 : STD_LOGIC;
signal DANGLING_U5_salida_reg_27 : STD_LOGIC;
signal DANGLING_U5_salida_reg_26 : STD_LOGIC;
signal DANGLING_U5_salida_reg_25 : STD_LOGIC;
signal DANGLING_U5_salida_reg_24 : STD_LOGIC;
signal DANGLING_U5_salida_reg_23 : STD_LOGIC;
signal DANGLING_U5_salida_reg_22 : STD_LOGIC;
signal DANGLING_U5_salida_reg_21 : STD_LOGIC;
signal DANGLING_U5_salida_reg_20 : STD_LOGIC;
signal DANGLING_U5_salida_reg_19 : STD_LOGIC;
signal DANGLING_U5_salida_reg_18 : STD_LOGIC;
signal DANGLING_U5_salida_reg_17 : STD_LOGIC;
signal DANGLING_U5_salida_reg_16 : STD_LOGIC;
signal DANGLING_U5_salida_reg_15 : STD_LOGIC;
signal DANGLING_U5_salida_reg_14 : STD_LOGIC;
signal DANGLING_U5_salida_reg_13 : STD_LOGIC;
signal DANGLING_U5_salida_reg_12 : STD_LOGIC;
signal DANGLING_U5_salida_reg_11 : STD_LOGIC;
signal DANGLING_U5_salida_reg_10 : STD_LOGIC;
signal DANGLING_U5_salida_reg_9 : STD_LOGIC;
signal DANGLING_U5_salida_reg_8 : STD_LOGIC;
signal DANGLING_U5_salida_reg_7 : STD_LOGIC;
signal DANGLING_U5_salida_reg_6 : STD_LOGIC;
signal DANGLING_U5_salida_reg_5 : STD_LOGIC;
signal DANGLING_U5_salida_reg_4 : STD_LOGIC;
signal DANGLING_U5_salida_reg_3 : STD_LOGIC;
signal DANGLING_U5_salida_reg_2 : STD_LOGIC;
signal DANGLING_U5_salida_reg_1 : STD_LOGIC;
signal DANGLING_U5_salida_reg_0 : STD_LOGIC;

begin

----  Component instantiations  ----

U1 : Memoria_de_Datos
  port map(
       a => BUS294,
       clk => CLK,
       di => BUS234,
       do => BUS305,
       we => NET340
  );

U10 : Banco_de_Registros
  port map(
       di(0) => Dangling_Input_Signal,
       di(1) => Dangling_Input_Signal,
       di(2) => Dangling_Input_Signal,
       di(3) => Dangling_Input_Signal,
       di(4) => Dangling_Input_Signal,
       di(5) => Dangling_Input_Signal,
       di(6) => Dangling_Input_Signal,
       di(7) => Dangling_Input_Signal,
       di(8) => Dangling_Input_Signal,
       di(9) => Dangling_Input_Signal,
       di(10) => Dangling_Input_Signal,
       di(11) => Dangling_Input_Signal,
       di(12) => Dangling_Input_Signal,
       di(13) => Dangling_Input_Signal,
       di(14) => Dangling_Input_Signal,
       di(15) => Dangling_Input_Signal,
       di(16) => Dangling_Input_Signal,
       di(17) => Dangling_Input_Signal,
       di(18) => Dangling_Input_Signal,
       di(19) => Dangling_Input_Signal,
       di(20) => Dangling_Input_Signal,
       di(21) => Dangling_Input_Signal,
       di(22) => Dangling_Input_Signal,
       di(23) => Dangling_Input_Signal,
       di(24) => Dangling_Input_Signal,
       di(25) => Dangling_Input_Signal,
       di(26) => Dangling_Input_Signal,
       di(27) => Dangling_Input_Signal,
       di(28) => Dangling_Input_Signal,
       di(29) => Dangling_Input_Signal,
       di(30) => Dangling_Input_Signal,
       di(31) => NET269,
       a1 => BUS202,
       a2 => BUS178,
       ad => BUS189,
       clk => CLK,
       do1 => BUS248,
       do2 => BUS234,
       we => NET259
  );

U11 : ALU
  port map(
       alu_op => BUS325,
       alu_resultado => BUS294,
       op1 => BUS248,
       op2 => BUS244
  );

U2 : unidad_de_control
  port map(
       funct3(0) => BUS222(1),
       funct3(1) => BUS222(2),
       funct3(2) => BUS222(3),
       funct7(0) => BUS161(1),
       funct7(1) => BUS161(2),
       funct7(2) => BUS161(3),
       funct7(3) => BUS161(4),
       funct7(4) => BUS161(5),
       funct7(5) => BUS161(6),
       funct7(6) => BUS161(7),
       alu2reg => NET352,
       alu_op => BUS325,
       alu_src => NET319,
       imm_rd => NET618,
       opcode => BUS212,
       wem => NET340,
       wer => NET259
  );

U3 : suma4
  port map(
       a_in => INSTR,
       a_out => BUS138,
       clk => CLK,
       rst => RST
  );

U4 : Sign_Extend
  port map(
       dato_imm => BUS157,
       imm => BUS251
  );

U5 : mux_reg
  port map(
       salida_reg(0) => DANGLING_U5_salida_reg_0,
       salida_reg(1) => DANGLING_U5_salida_reg_1,
       salida_reg(2) => DANGLING_U5_salida_reg_2,
       salida_reg(3) => DANGLING_U5_salida_reg_3,
       salida_reg(4) => DANGLING_U5_salida_reg_4,
       salida_reg(5) => DANGLING_U5_salida_reg_5,
       salida_reg(6) => DANGLING_U5_salida_reg_6,
       salida_reg(7) => DANGLING_U5_salida_reg_7,
       salida_reg(8) => DANGLING_U5_salida_reg_8,
       salida_reg(9) => DANGLING_U5_salida_reg_9,
       salida_reg(10) => DANGLING_U5_salida_reg_10,
       salida_reg(11) => DANGLING_U5_salida_reg_11,
       salida_reg(12) => DANGLING_U5_salida_reg_12,
       salida_reg(13) => DANGLING_U5_salida_reg_13,
       salida_reg(14) => DANGLING_U5_salida_reg_14,
       salida_reg(15) => DANGLING_U5_salida_reg_15,
       salida_reg(16) => DANGLING_U5_salida_reg_16,
       salida_reg(17) => DANGLING_U5_salida_reg_17,
       salida_reg(18) => DANGLING_U5_salida_reg_18,
       salida_reg(19) => DANGLING_U5_salida_reg_19,
       salida_reg(20) => DANGLING_U5_salida_reg_20,
       salida_reg(21) => DANGLING_U5_salida_reg_21,
       salida_reg(22) => DANGLING_U5_salida_reg_22,
       salida_reg(23) => DANGLING_U5_salida_reg_23,
       salida_reg(24) => DANGLING_U5_salida_reg_24,
       salida_reg(25) => DANGLING_U5_salida_reg_25,
       salida_reg(26) => DANGLING_U5_salida_reg_26,
       salida_reg(27) => DANGLING_U5_salida_reg_27,
       salida_reg(28) => DANGLING_U5_salida_reg_28,
       salida_reg(29) => DANGLING_U5_salida_reg_29,
       salida_reg(30) => DANGLING_U5_salida_reg_30,
       salida_reg(31) => NET269,
       alu2reg => NET352,
       operacion_alu => BUS294,
       registro_mem => BUS305
  );

U6 : mux_rd
  port map(
       fun7(0) => BUS161(1),
       fun7(1) => BUS161(2),
       fun7(2) => BUS161(3),
       fun7(3) => BUS161(4),
       fun7(4) => BUS161(5),
       fun7(5) => BUS161(6),
       fun7(6) => BUS161(7),
       imm_rd => NET619,
       rd => BUS189,
       rs2 => BUS178,
       salida_rd => BUS157
  );

U7 : MUX_EXTEND
  port map(
       alu_src => NET319,
       banco => BUS234,
       ext => BUS251,
       salida => BUS244
  );

U8 : memoria_del_programa
  port map(
       a => BUS138,
       do => BUS152
  );

U9 : decoder
  port map(
       dato => BUS152,
       funct3 => BUS222,
       funct7 => BUS161,
       opcode => BUS212,
       rd => BUS189,
       rs1 => BUS202,
       rs2 => BUS178
  );


---- Dangling input signal assignment ----

Dangling_Input_Signal <= DANGLING_INPUT_CONSTANT;

end top_prueba;
