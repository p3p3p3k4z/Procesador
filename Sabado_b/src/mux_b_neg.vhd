library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mux_b_neg is
    port(
        salto_posi   : in STD_LOGIC_VECTOR(31 downto 0); 
        salto_neg   : in STD_LOGIC_VECTOR(31 downto 0);
		salto : out STD_LOGIC;
        salto_inst : in STD_LOGIC  
    );
end mux_b_neg;

architecture behavior of mux_b_neg is
begin  

    process(salto_inst)
    begin
        if salto_inst = '1' then
            salto <= salto_neg(0); 
        else
            salto <= salto_posi(0);
        end if;
    end process;
end behavior;
