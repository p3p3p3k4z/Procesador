---------------------------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : tipo_b
-- Author      : mario
-- Company     : UTM
--
---------------------------------------------------------------------------------------------------
--
-- File        : C:\Users\Mario\Downloads\Procesador-main\tipo_b\compile\top_b.vhd
-- Generated   : Wed Jan 15 19:31:04 2025
-- From        : C:\Users\Mario\Downloads\Procesador-main\tipo_b\src\top_b.bde
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


entity top_b is
  port(
       CLK : in STD_LOGIC;
       RST : in STD_LOGIC
  );
end top_b;

architecture top_b of top_b is

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
       a : in STD_LOGIC_VECTOR(11 downto 0);
       do : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component Memoria_de_Datos
  port (
       ad : in STD_LOGIC_VECTOR(31 downto 0);
       clk : in STD_LOGIC;
       di : in STD_LOGIC_VECTOR(31 downto 0);
       palabra : in STD_LOGIC_VECTOR(3 downto 0);
       we : in STD_LOGIC;
       do : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component mux_b_neg
  port (
       salto_inst : in STD_LOGIC;
       salto_neg : in STD_LOGIC_VECTOR(31 downto 0);
       salto_posi : in STD_LOGIC_VECTOR(31 downto 0);
       salto : out STD_LOGIC
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
component mux_suma
  port (
       n_salto : in STD_LOGIC_VECTOR(11 downto 0);
       salto_sel : in STD_LOGIC;
       salida_suma : out STD_LOGIC_VECTOR(11 downto 0)
  );
end component;
component ordenar_extSigno
  port (
       fun7 : in STD_LOGIC_VECTOR(6 downto 0);
       rd : in STD_LOGIC_VECTOR(4 downto 0);
       salida_ordenada : out STD_LOGIC_VECTOR(11 downto 0)
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
       a_in : in STD_LOGIC_VECTOR(11 downto 0);
       clk : in STD_LOGIC;
       rst : in STD_LOGIC;
       a_out : out STD_LOGIC_VECTOR(11 downto 0)
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
       br_neg : out STD_LOGIC;
       branch : out STD_LOGIC;
       imm_rd : out STD_LOGIC;
       palabra : out STD_LOGIC_VECTOR(3 downto 0);
       wem : out STD_LOGIC;
       wer : out STD_LOGIC
  );
end component;

---- Signal declarations used on the diagram ----

signal NET1318 : STD_LOGIC;
signal NET1322 : STD_LOGIC;
signal NET1520 : STD_LOGIC;
signal NET1530 : STD_LOGIC;
signal NET632 : STD_LOGIC;
signal NET652 : STD_LOGIC;
signal NET662 : STD_LOGIC;
signal NET668 : STD_LOGIC;
signal NET682 : STD_LOGIC;
signal BUS1311 : STD_LOGIC_VECTOR (11 downto 0);
signal BUS1484 : STD_LOGIC_VECTOR (11 downto 0);
signal BUS1510 : STD_LOGIC_VECTOR (7 downto 0);
signal BUS1677 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS454 : STD_LOGIC_VECTOR (11 downto 0);
signal BUS464 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS506 : STD_LOGIC_VECTOR (4 downto 0);
signal BUS514 : STD_LOGIC_VECTOR (4 downto 0);
signal BUS520 : STD_LOGIC_VECTOR (4 downto 0);
signal BUS537 : STD_LOGIC_VECTOR (3 downto 0);
signal BUS543 : STD_LOGIC_VECTOR (6 downto 0);
signal BUS594 : STD_LOGIC_VECTOR (11 downto 0);
signal BUS598 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS602 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS614 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS638 : STD_LOGIC_VECTOR (3 downto 0);
signal BUS644 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS646 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS688 : STD_LOGIC_VECTOR (3 downto 0);
signal BUS713 : STD_LOGIC_VECTOR (31 downto 0);

begin

----  Component instantiations  ----

U10 : Sign_Extend
  port map(
       dato_imm => BUS594,
       imm => BUS614
  );

U11 : Memoria_de_Datos
  port map(
       ad => BUS1677,
       clk => CLK,
       di => BUS602,
       do => BUS713,
       palabra => BUS688,
       we => NET662
  );

U12 : mux_suma
  port map(
       n_salto => BUS1311,
       salida_suma => BUS1484,
       salto_sel => NET1318
  );

U13 : memoria_del_programa
  port map(
       a => BUS454,
       do => BUS464
  );

U14 : mux_b_neg
  port map(
       salto => NET1322,
       salto_inst => NET1520,
       salto_neg => BUS1677,
       salto_posi => BUS1677
  );

U15 : ordenar_extSigno
  port map(
       fun7(0) => BUS1510(1),
       fun7(1) => BUS1510(2),
       fun7(2) => BUS1510(3),
       fun7(3) => BUS1510(4),
       fun7(4) => BUS1510(5),
       fun7(5) => BUS1510(6),
       fun7(6) => BUS1510(7),
       rd => BUS506,
       salida_ordenada => BUS1311
  );

NET1318 <= NET1322 and NET1530;

U2 : suma4
  port map(
       a_in => BUS1484,
       a_out => BUS454,
       clk => CLK,
       rst => RST
  );

U3 : decoder
  port map(
       dato => BUS464,
       funct3 => BUS537,
       funct7 => BUS1510,
       opcode => BUS543,
       rd => BUS506,
       rs1 => BUS514,
       rs2 => BUS520
  );

U4 : Banco_de_Registros
  port map(
       a1 => BUS514,
       a2 => BUS520,
       ad => BUS506,
       clk => CLK,
       di => BUS598,
       do1 => BUS646,
       do2 => BUS602,
       we => NET652
  );

U5 : unidad_de_control
  port map(
       funct3(0) => BUS537(1),
       funct3(1) => BUS537(2),
       funct3(2) => BUS537(3),
       funct7(0) => BUS1510(1),
       funct7(1) => BUS1510(2),
       funct7(2) => BUS1510(3),
       funct7(3) => BUS1510(4),
       funct7(4) => BUS1510(5),
       funct7(5) => BUS1510(6),
       funct7(6) => BUS1510(7),
       alu2reg => NET682,
       alu_op => BUS638,
       alu_src => NET632,
       br_neg => NET1520,
       branch => NET1530,
       imm_rd => NET668,
       opcode => BUS543,
       palabra => BUS688,
       wem => NET662,
       wer => NET652
  );

U6 : mux_rd
  port map(
       fun7(0) => BUS1510(1),
       fun7(1) => BUS1510(2),
       fun7(2) => BUS1510(3),
       fun7(3) => BUS1510(4),
       fun7(4) => BUS1510(5),
       fun7(5) => BUS1510(6),
       fun7(6) => BUS1510(7),
       imm_rd => NET668,
       rd => BUS506,
       rs2 => BUS520,
       salida_rd => BUS594
  );

U7 : mux_reg
  port map(
       alu2reg => NET682,
       operacion_alu => BUS1677,
       registro_mem => BUS713,
       salida_reg => BUS598
  );

U8 : ALU
  port map(
       alu_op => BUS638,
       alu_resultado => BUS1677,
       op1 => BUS646,
       op2 => BUS644
  );

U9 : MUX_EXTEND
  port map(
       alu_src => NET632,
       banco => BUS602,
       ext => BUS614,
       salida => BUS644
  );


end top_b;
