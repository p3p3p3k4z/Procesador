library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Sign_Extend is
    Port (
		dato_imm  : in STD_LOGIC_VECTOR(11 downto 0);
        imm       : out STD_LOGIC_VECTOR(31 downto 0) -- Salida de 32 bits
    );
end Sign_Extend;

architecture Behavioral of Sign_Extend is
begin
    process(dato_imm)
    begin
		-- Si el bit más significativo de dato_imm es '1', extendemos con '1's
		if dato_imm (11) = '1' then
			imm <= (others => '1'); -- Inicializamos todo en '1'
			imm(11 downto 0) <= dato_imm; -- Asignamos los 12 bits de concatenación
		else
			-- Si el bit más significativo de dato_imm es '0', extendemos con '0's
			imm <= (others => '0'); -- Inicializamos todo en '0'
			imm(11 downto 0) <= dato_imm; -- Asignamos los 12 bits de concatenación
		end if;
    end process;
end Behavioral;