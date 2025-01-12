library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mux_suma is
    port(
        salto_arr   : in STD_LOGIC_VECTOR(31 downto 0); 
        n_salto     : in STD_LOGIC_VECTOR(11 downto 0); 
        salida_suma : out STD_LOGIC_VECTOR(11 downto 0)  
    );
end mux_suma;

architecture behavior of mux_suma is
    signal salto : STD_LOGIC; 
begin
    salto <= salto_arr(0);

    process(salto, n_salto)
    begin
        if salto = '1' then
            salida_suma <= n_salto; 
        else
            salida_suma <= "000000000100";  -- 4 en binario
        end if;
    end process;
end behavior;
