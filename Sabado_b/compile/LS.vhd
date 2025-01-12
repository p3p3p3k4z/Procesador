---------------------------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : Sabado_b
-- Author      : mario
-- Company     : UTM
--
---------------------------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\instr_b\Sabado_b\compile\LS.vhd
-- Generated   : Sun Jan 12 03:08:34 2025
-- From        : c:\My_Designs\instr_b\Sabado_b\src\LS.bde
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


entity LS is
  port(
       CLK : in STD_LOGIC;
       RST : in STD_LOGIC;
       INSTR : in STD_LOGIC_VECTOR(5 downto 0)
  );
end LS;

architecture LS of LS is

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
       ad : in STD_LOGIC_VECTOR(31 downto 0);
       clk : in STD_LOGIC;
       di : in STD_LOGIC_VECTOR(31 downto 0);
       palabra : in STD_LOGIC_VECTOR(3 downto 0);
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
       palabra : out STD_LOGIC_VECTOR(3 downto 0);
       wem : out STD_LOGIC;
       wer : out STD_LOGIC
  );
end component;

---- Signal declarations used on the diagram ----

signal NET358 : STD_LOGIC;
signal NET386 : STD_LOGIC;
signal NET398 : STD_LOGIC;
signal NET406 : STD_LOGIC;
signal NET422 : STD_LOGIC;
signal BUS109 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS148 : STD_LOGIC_VECTOR (4 downto 0);
signal BUS156 : STD_LOGIC_VECTOR (4 downto 0);
signal BUS164 : STD_LOGIC_VECTOR (4 downto 0);
signal BUS172 : STD_LOGIC_VECTOR (7 downto 0);
signal BUS180 : STD_LOGIC_VECTOR (3 downto 0);
signal BUS188 : STD_LOGIC_VECTOR (6 downto 0);
signal BUS263 : STD_LOGIC_VECTOR (11 downto 0);
signal BUS271 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS279 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS329 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS366 : STD_LOGIC_VECTOR (3 downto 0);
signal BUS374 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS378 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS430 : STD_LOGIC_VECTOR (3 downto 0);
signal BUS446 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS466 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS97 : STD_LOGIC_VECTOR (5 downto 0);

begin

----  Component instantiations  ----

U1 : suma4
  port map(
       a_in => INSTR,
       a_out => BUS97,
       clk => CLK,
       rst => RST
  );

U10 : Sign_Extend
  port map(
       dato_imm => BUS263,
       imm => BUS329
  );

U11 : Memoria_de_Datos
  port map(
       ad => BUS446,
       clk => CLK,
       di => BUS279,
       do => BUS466,
       palabra => BUS430,
       we => NET398
  );

U2 : memoria_del_programa
  port map(
       a => BUS97,
       do => BUS109
  );

U3 : decoder
  port map(
       dato => BUS109,
       funct3 => BUS180,
       funct7 => BUS172,
       opcode => BUS188,
       rd => BUS148,
       rs1 => BUS156,
       rs2 => BUS164
  );

U4 : Banco_de_Registros
  port map(
       a1 => BUS156,
       a2 => BUS164,
       ad => BUS148,
       clk => CLK,
       di => BUS271,
       do1 => BUS378,
       do2 => BUS279,
       we => NET386
  );

U5 : unidad_de_control
  port map(
       funct3(0) => BUS180(1),
       funct3(1) => BUS180(2),
       funct3(2) => BUS180(3),
       funct7(0) => BUS172(1),
       funct7(1) => BUS172(2),
       funct7(2) => BUS172(3),
       funct7(3) => BUS172(4),
       funct7(4) => BUS172(5),
       funct7(5) => BUS172(6),
       funct7(6) => BUS172(7),
       alu2reg => NET422,
       alu_op => BUS366,
       alu_src => NET358,
       imm_rd => NET406,
       opcode => BUS188,
       palabra => BUS430,
       wem => NET398,
       wer => NET386
  );

U6 : mux_rd
  port map(
       fun7(0) => BUS172(1),
       fun7(1) => BUS172(2),
       fun7(2) => BUS172(3),
       fun7(3) => BUS172(4),
       fun7(4) => BUS172(5),
       fun7(5) => BUS172(6),
       fun7(6) => BUS172(7),
       imm_rd => NET406,
       rd => BUS148,
       rs2 => BUS164,
       salida_rd => BUS263
  );

U7 : mux_reg
  port map(
       alu2reg => NET422,
       operacion_alu => BUS446,
       registro_mem => BUS466,
       salida_reg => BUS271
  );

U8 : ALU
  port map(
       alu_op => BUS366,
       alu_resultado => BUS446,
       op1 => BUS378,
       op2 => BUS374
  );

U9 : MUX_EXTEND
  port map(
       alu_src => NET358,
       banco => BUS279,
       ext => BUS329,
       salida => BUS374
  );


end LS;
