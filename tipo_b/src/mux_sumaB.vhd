library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mux_suma is
    port(
        n_salto     : in STD_LOGIC_VECTOR(11 downto 0);
		salto_sel	: in STD_LOGIC;
        salida_suma : out STD_LOGIC_VECTOR(11 downto 0)  
    );
end mux_suma;

architecture behavior of mux_suma is
begin
    process(salto_sel, n_salto)
    begin
        if salto_sel = '1' then
            salida_suma <= n_salto; 
        else
            salida_suma <= "000000000100";  -- 4 en binario
        end if;
    end process;
end behavior;
