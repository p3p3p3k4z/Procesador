---------------------------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : bancoLS
-- Author      : mario
-- Company     : UTM
--
---------------------------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\bancoregistrosv4\bancoLS\compile\tipo_ls.vhd
-- Generated   : Sat Dec 14 11:53:13 2024
-- From        : c:\My_Designs\bancoregistrosv4\bancoLS\src\tipo_ls.bde
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


entity tipo_ls is
  port(
       CLK : in STD_LOGIC;
       RST : in STD_LOGIC;
       NUM : in STD_LOGIC_VECTOR(5 downto 0)
  );
end tipo_ls;

architecture tipo_ls of tipo_ls is

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
component Memoria_de_Datos
  port (
       a : in STD_LOGIC_VECTOR(4 downto 0);
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
       imm_rd : in STD_LOGIC;
       rd : in STD_LOGIC_VECTOR(4 downto 0);
       rs2 : in STD_LOGIC_VECTOR(4 downto 0);
       salida_rd : out STD_LOGIC_VECTOR(4 downto 0)
  );
end component;
component mux_reg
  port (
       alu2reg : in STD_LOGIC;
       operacion_alu : in STD_LOGIC_VECTOR(4 downto 0);
       registro_mem : in STD_LOGIC_VECTOR(4 downto 0);
       salida_reg : out STD_LOGIC_VECTOR(4 downto 0)
  );
end component;
component Sign_Extend
  port (
       dato_imm : in STD_LOGIC_VECTOR(4 downto 0);
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

signal NET119 : STD_LOGIC;
signal NET229 : STD_LOGIC;
signal NET333 : STD_LOGIC;
signal NET355 : STD_LOGIC;
signal NET464 : STD_LOGIC;
signal BUS103 : STD_LOGIC_VECTOR (4 downto 0);
signal BUS111 : STD_LOGIC_VECTOR (6 downto 0);
signal BUS115 : STD_LOGIC_VECTOR (3 downto 0);
signal BUS139 : STD_LOGIC_VECTOR (3 downto 0);
signal BUS208 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS214 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS322 : STD_LOGIC_VECTOR (4 downto 0);
signal BUS383 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS404 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS482 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS578 : STD_LOGIC_VECTOR (7 downto 0);
signal BUS579 : STD_LOGIC_VECTOR (4 downto 0);
signal BUS580 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS584 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS79 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS81 : STD_LOGIC_VECTOR (5 downto 0);
signal BUS99 : STD_LOGIC_VECTOR (4 downto 0);

begin

----  Component instantiations  ----

U1 : ALU
  port map(
       alu_op => BUS139,
       alu_resultado => BUS482,
       op1 => BUS208,
       op2 => BUS214
  );

U10 : mux_reg
  port map(
       operacion_alu(0) => BUS482(27),
       operacion_alu(1) => BUS482(28),
       operacion_alu(2) => BUS482(29),
       operacion_alu(3) => BUS482(30),
       operacion_alu(4) => BUS482(31),
       registro_mem(0) => BUS383(27),
       registro_mem(1) => BUS383(28),
       registro_mem(2) => BUS383(29),
       registro_mem(3) => BUS383(30),
       registro_mem(4) => BUS383(31),
       salida_reg(0) => BUS404(27),
       salida_reg(1) => BUS404(28),
       salida_reg(2) => BUS404(29),
       salida_reg(3) => BUS404(30),
       salida_reg(4) => BUS404(31),
       alu2reg => NET355
  );

U11 : mux_rd
  port map(
       imm_rd => NET333,
       rd => BUS322,
       rs2 => BUS103,
       salida_rd => BUS579
  );

U2 : Banco_de_Registros
  port map(
       a1 => BUS99,
       a2 => BUS103,
       ad => BUS322,
       clk => CLK,
       di => BUS404,
       do1 => BUS208,
       do2 => BUS584,
       we => NET119
  );

U3 : decoder
  port map(
       dato => BUS79,
       funct3 => BUS115,
       funct7 => BUS578,
       opcode => BUS111,
       rd => BUS322,
       rs1 => BUS99,
       rs2 => BUS103
  );

U4 : memoria_del_programa
  port map(
       a => BUS81,
       do => BUS79
  );

U5 : Sign_Extend
  port map(
       dato_imm => BUS579,
       imm => BUS580
  );

U6 : suma4
  port map(
       a_in => NUM,
       a_out => BUS81,
       clk => CLK,
       rst => RST
  );

U7 : unidad_de_control
  port map(
       funct3(0) => BUS115(1),
       funct3(1) => BUS115(2),
       funct3(2) => BUS115(3),
       funct7(0) => BUS578(1),
       funct7(1) => BUS578(2),
       funct7(2) => BUS578(3),
       funct7(3) => BUS578(4),
       funct7(4) => BUS578(5),
       funct7(5) => BUS578(6),
       funct7(6) => BUS578(7),
       alu2reg => NET355,
       alu_op => BUS139,
       alu_src => NET229,
       imm_rd => NET333,
       opcode => BUS111,
       wem => NET464,
       wer => NET119
  );

U8 : MUX_EXTEND
  port map(
       alu_src => NET229,
       banco => BUS584,
       ext => BUS580,
       salida => BUS214
  );

U9 : Memoria_de_Datos
  port map(
       a(0) => BUS482(27),
       a(1) => BUS482(28),
       a(2) => BUS482(29),
       a(3) => BUS482(30),
       a(4) => BUS482(31),
       clk => CLK,
       di => BUS584,
       do => BUS383,
       we => NET464
  );


end tipo_ls;
