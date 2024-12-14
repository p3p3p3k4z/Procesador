library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity unidad_de_control is
    port(
        opcode          : in  STD_LOGIC_VECTOR(6 downto 0);
        funct7          : in  STD_LOGIC_VECTOR(6 downto 0);
        funct3          : in  STD_LOGIC_VECTOR(2 downto 0);
		wer              : out STD_LOGIC; -- escribir en banco
		wem              : out STD_LOGIC; -- escribir en memoria de datos
        alu_op           : out STD_LOGIC_VECTOR(3 downto 0); -- manejar en alu
        alu_src 		 : out STD_LOGIC;  -- bandera de instrucciones tipo I
		imm_rd			 : out STD_LOGIC; --bandera para imm o rs2
		alu2reg          : out STD_LOGIC -- se escribira en memoria o banco
    );
end unidad_de_control;

architecture behavior of unidad_de_control is
begin
    -- indicar operacion logica
    alu_op <= "0000" when (funct3 = "000" and funct7 = "0000000") else -- add
          "0001" when ((funct3 = "000" and funct7 = "0100000") and opcode /= ("0010011")) else -- sub
          "0010" when (funct3 = "111" and funct7 = "0000000") else -- and
          "0011" when (funct3 = "110" and funct7 = "0000000") else -- or
          "0100" when (funct3 = "100" and funct7 = "0000000") else -- xor
          "0101" when (funct3 = "010" and funct7 = "0000000") else -- slt
          "0110" when (funct3 = "011" and funct7 = "0000000") else -- sltu
          "0111" when (funct3 = "001" and funct7 = "0000000") else -- sll
          "1000" when (funct3 = "101" and funct7 = "0000000") else -- srl
          "1001" when (funct3 = "101" and funct7 = "0100000") else "1111"; -- sra y demás

    -- Escribir	en el banco
    wer <= '1' when (opcode = "0110011" or opcode = "0010011") else '0'; -- Para instrucciones tipo R o tipo I
    -- bandera para instrucciones tipo I
    alu_src <= '1' when opcode = "0010011" else '0';
	--Escribir en memoria de datos
	wem <= '1' when (opcode = "0100011") else '0';	 -- instruccion s 
	--seleccionar signal es imm o rs2 a usar
	imm_rd <= '1' when (opcode = "0100011") else '0';	 -- instruccion s
	--escribir en banco o memoria
	alu2reg <= '1' when (opcode = "0100011") else '0';	 -- instruccion s 
	
end behavior;
