library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ordenar_extSigno is
    port(
        rd           : in STD_LOGIC_VECTOR(4 downto 0);
        fun7         : in STD_LOGIC_VECTOR(6 downto 0); 
        salida_ordenada    : out STD_LOGIC_VECTOR(11 downto 0) 
    );
end ordenar_extSigno;

architecture behavior of ordenar_extSigno is
    signal dato_imm : STD_LOGIC_VECTOR(11 downto 0);
    signal bit_mov : STD_LOGIC;

begin 
    -- Concatenar
    bit_mov <= rd(0);
    dato_imm <= fun7(6) & bit_mov & fun7(5 downto 0) & rd(4 downto 1);
    
	process(dato_imm)
	    begin
			-- Si el bit más significativo de dato_imm es '1', extendemos con '1's
			if dato_imm (11) = '1' then
				salida_ordenada <= (others => '1'); -- Inicializamos todo en '1'
				salida_ordenada(11 downto 0) <= dato_imm; -- Asignamos los 12 bits de concatenación
			else
				-- Si el bit más significativo de dato_imm es '0', extendemos con '0's
				salida_ordenada <= (others => '0'); -- Inicializamos todo en '0'
				salida_ordenada(11 downto 0) <= dato_imm; -- Asignamos los 12 bits de concatenación
		end if;
    end process;
end behavior;