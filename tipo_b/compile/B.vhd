---------------------------------------------------------------------------------------------------
--
-- Title       : TipoB
-- Design      : tipo_b
-- Author      : mario
-- Company     : UTM
--
---------------------------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\procesadorB\tipo_b\compile\B.vhd
-- Generated   : Tue Jan 14 23:58:47 2025
-- From        : c:\My_Designs\procesadorB\tipo_b\src\B.bde
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


entity B is
  port(
       CLK : in STD_LOGIC;
       RST : in STD_LOGIC
  );
end B;

architecture B of B is

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

signal NET213 : STD_LOGIC;
signal NET227 : STD_LOGIC;
signal NET230 : STD_LOGIC;
signal NET233 : STD_LOGIC;
signal NET240 : STD_LOGIC;
signal NET559 : STD_LOGIC;
signal NET567 : STD_LOGIC;
signal NET579 : STD_LOGIC;
signal NET610 : STD_LOGIC;
signal BUS113 : STD_LOGIC_VECTOR (4 downto 0);
signal BUS119 : STD_LOGIC_VECTOR (4 downto 0);
signal BUS134 : STD_LOGIC_VECTOR (3 downto 0);
signal BUS1596 : STD_LOGIC_VECTOR (6 downto 0);
signal BUS175 : STD_LOGIC_VECTOR (11 downto 0);
signal BUS179 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS183 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS195 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS219 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS221 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS243 : STD_LOGIC_VECTOR (3 downto 0);
signal BUS249 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS265 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS277 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS490 : STD_LOGIC_VECTOR (11 downto 0);
signal BUS502 : STD_LOGIC_VECTOR (11 downto 0);
signal BUS532 : STD_LOGIC_VECTOR (11 downto 0);
signal BUS540 : STD_LOGIC_VECTOR (3 downto 0);
signal BUS606 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS829 : STD_LOGIC_VECTOR (7 downto 0);

begin

----  Component instantiations  ----

U1 : unidad_de_control
  port map(
       funct3(0) => BUS134(1),
       funct3(1) => BUS134(2),
       funct3(2) => BUS134(3),
       funct7(0) => BUS829(1),
       funct7(1) => BUS829(2),
       funct7(2) => BUS829(3),
       funct7(3) => BUS829(4),
       funct7(4) => BUS829(5),
       funct7(5) => BUS829(6),
       funct7(6) => BUS829(7),
       alu2reg => NET240,
       alu_op => BUS540,
       alu_src => NET213,
       br_neg => NET610,
       branch => NET579,
       imm_rd => NET233,
       opcode => BUS1596,
       palabra => BUS243,
       wem => NET230,
       wer => NET227
  );

U10 : Sign_Extend
  port map(
       dato_imm => BUS175,
       imm => BUS195
  );

U11 : Memoria_de_Datos
  port map(
       ad => BUS249,
       clk => CLK,
       di => BUS183,
       do => BUS265,
       palabra => BUS243,
       we => NET230
  );

U12 : mux_b_neg
  port map(
       salto => NET567,
       salto_inst => NET610,
       salto_neg => BUS606,
       salto_posi => BUS249
  );

U13 : memoria_del_programa
  port map(
       a => BUS490,
       do => BUS277
  );

U14 : ordenar_extSigno
  port map(
       fun7(0) => BUS829(1),
       fun7(1) => BUS829(2),
       fun7(2) => BUS829(3),
       fun7(3) => BUS829(4),
       fun7(4) => BUS829(5),
       fun7(5) => BUS829(6),
       fun7(6) => BUS829(7),
       rd(0) => BUS1596(2),
       rd(1) => BUS1596(3),
       rd(2) => BUS1596(4),
       rd(3) => BUS1596(5),
       rd(4) => BUS1596(6),
       salida_ordenada => BUS532
  );

NET559 <= NET567 and NET579;

BUS606(31) <= not(BUS249(31));

U2 : suma4
  port map(
       a_in => BUS502,
       a_out => BUS490,
       clk => CLK,
       rst => RST
  );

U3 : decoder
  port map(
       rd(0) => BUS1596(2),
       rd(1) => BUS1596(3),
       rd(2) => BUS1596(4),
       rd(3) => BUS1596(5),
       rd(4) => BUS1596(6),
       dato => BUS277,
       funct3 => BUS134,
       funct7 => BUS829,
       opcode => BUS1596,
       rs1 => BUS113,
       rs2 => BUS119
  );

U4 : Banco_de_Registros
  port map(
       ad(0) => BUS1596(2),
       ad(1) => BUS1596(3),
       ad(2) => BUS1596(4),
       ad(3) => BUS1596(5),
       ad(4) => BUS1596(6),
       a1 => BUS113,
       a2 => BUS119,
       clk => CLK,
       di => BUS179,
       do1 => BUS221,
       do2 => BUS183,
       we => NET227
  );

U5 : mux_suma
  port map(
       n_salto => BUS532,
       salida_suma => BUS502,
       salto_sel => NET559
  );

U6 : mux_rd
  port map(
       fun7(0) => BUS829(1),
       fun7(1) => BUS829(2),
       fun7(2) => BUS829(3),
       fun7(3) => BUS829(4),
       fun7(4) => BUS829(5),
       fun7(5) => BUS829(6),
       fun7(6) => BUS829(7),
       rd(0) => BUS1596(2),
       rd(1) => BUS1596(3),
       rd(2) => BUS1596(4),
       rd(3) => BUS1596(5),
       rd(4) => BUS1596(6),
       imm_rd => NET233,
       rs2 => BUS119,
       salida_rd => BUS175
  );

U7 : mux_reg
  port map(
       alu2reg => NET240,
       operacion_alu => BUS249,
       registro_mem => BUS265,
       salida_reg => BUS179
  );

U8 : ALU
  port map(
       alu_op => BUS540,
       alu_resultado => BUS249,
       op1 => BUS221,
       op2 => BUS219
  );

U9 : MUX_EXTEND
  port map(
       alu_src => NET213,
       banco => BUS183,
       ext => BUS195,
       salida => BUS219
  );


end B;
