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
begin 
	-- Concatenar
    process(rd, fun7)
	salida_rd <= fun7 & rd;
    end process;
end behavior;
