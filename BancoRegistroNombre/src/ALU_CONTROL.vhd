library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ALU_CONTROL is
    port(
        opcode          : in  STD_LOGIC_VECTOR(6 downto 0);
        funct7          : in  STD_LOGIC_VECTOR(6 downto 0);
        funct3          : in  STD_LOGIC_VECTOR(2 downto 0);
        alu_op           : out STD_LOGIC_VECTOR(3 downto 0);
        wer              : out STD_LOGIC;
        alu_src 		 : out STD_LOGIC  -- Nueva salida para la bandera de instrucciones tipo I
    );
end ALU_CONTROL;

architecture behavior of ALU_CONTROL is
begin
    -- Lógica para establecer el valor de op (instrucciones R)
    alu_op <= "0000" when (funct3 = "000" and funct7 = "0000000") else -- add
          "0001" when (funct3 = "000" and funct7 = "0100000") else -- sub
          "0010" when (funct3 = "111" and funct7 = "0000000") else -- and
          "0011" when (funct3 = "110" and funct7 = "0000000") else -- or
          "0100" when (funct3 = "100" and funct7 = "0000000") else -- xor
          "0101" when (funct3 = "010" and funct7 = "0000000") else -- slt
          "0110" when (funct3 = "011" and funct7 = "0000000") else -- sltu
          "0111" when (funct3 = "001" and funct7 = "0000000") else -- sll
          "1000" when (funct3 = "101" and funct7 = "0000000") else -- srl
          "1001" when (funct3 = "101" and funct7 = "0100000") else "1111"; -- sra y demás

    -- Escribir
    wer <= '1' when (opcode = "0110011" or opcode = "0010011") else '0'; -- Para instrucciones tipo R o tipo I

    -- bandera que activa para instrucciones tipo I
    alu_src <= '1' when opcode = "0010011" else '0';  -- Para instrucciones tipo I
end behavior;
