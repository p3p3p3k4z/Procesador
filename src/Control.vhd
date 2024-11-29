library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Control is
    port(
        opcode          : in  STD_LOGIC_VECTOR(6 downto 0);
        funct7          : in  STD_LOGIC_VECTOR(6 downto 0);
        funct3          : in  STD_LOGIC_VECTOR(2 downto 0);
        op              : out STD_LOGIC_VECTOR(3 downto 0);
        we              : out STD_LOGIC;
        op_instruccion  : out STD_LOGIC  -- Nueva salida para la bandera de instrucciones tipo I
    );
end Control;

architecture behavior of Control is
begin
    -- Lógica para establecer el valor de op (instrucciones R)
    op <= "0000" when (funct3 = "000" and funct7 = "0000000") else -- add
          "0001" when (funct3 = "000" and funct7 = "0100000") else -- sub
          "0010" when (funct3 = "111" and funct7 = "0000000") else -- and
          "0011" when (funct3 = "110" and funct7 = "0000000") else -- or
          "0100" when (funct3 = "100" and funct7 = "0000000") else -- xor
          "0101" when (funct3 = "010" and funct7 = "0000000") else -- slt
          "0110" when (funct3 = "011" and funct7 = "0000000") else -- sltu
          "0111" when (funct3 = "001" and funct7 = "0000000") else -- sll
          "1000" when (funct3 = "101" and funct7 = "0000000") else -- srl
          "1001" when (funct3 = "101" and funct7 = "0100000") else "1111"; -- sra y demás

    -- Lógica para la señal 'we', activa para instrucciones tipo R e I
    we <= '1' when (opcode = "0110011" or opcode = "0010011") else '0'; -- Para instrucciones tipo R o tipo I

    -- Lógica para la bandera 'op_instruccion', activa para instrucciones tipo I
    op_instruccion <= '1' when opcode = "0010011" else '0';  -- Para instrucciones tipo I
end behavior;
