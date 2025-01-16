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
signal bit_pos : STD_LOGIC;
signal bit_ne : STD_LOGIC;
begin  
	bit_pos <= salto_posi(0);
	bit_ne <= not(salto_posi(0));
    process(salto_inst,bit_pos,bit_ne)
    begin
        if salto_inst = '1' then
            salto <= bit_ne; 
        else
            salto <= bit_pos; 
        end if;
    end process;
end behavior;
