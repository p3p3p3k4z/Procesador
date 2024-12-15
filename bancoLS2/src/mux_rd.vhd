library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mux_rd is
    port(
        imm_rd       : in STD_LOGIC;                   
        rs2          : in STD_LOGIC_VECTOR(4 downto 0);
        rd           : in STD_LOGIC_VECTOR(4 downto 0);
        fun7         : in STD_LOGIC_VECTOR(6 downto 0); 
        salida_rd    : out STD_LOGIC_VECTOR(11 downto 0) 
    );
end mux_rd;

architecture behavior of mux_rd is
begin
    process(imm_rd, rs2, rd, fun7)
    begin
        if imm_rd = '1' then
            salida_rd <= fun7 & rs2;  
        else
            if rd(4) = '1' then
                salida_rd <= "1000000" & rs2;
            else
                salida_rd <= "0000000" & rs2;
            end if;
        end if;
    end process;
end behavior;
