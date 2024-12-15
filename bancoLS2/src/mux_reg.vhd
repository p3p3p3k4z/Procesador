library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mux_reg is
    port(
        alu2reg			: in STD_LOGIC;                   
        operacion_alu             : in STD_LOGIC_VECTOR(31 downto 0);
        registro_mem         : in STD_LOGIC_VECTOR(31 downto 0);
        salida_reg          : out STD_LOGIC_VECTOR(31 downto 0) 
    );
end mux_reg;

architecture behavior of mux_reg is
begin
    process(alu2reg, operacion_alu, registro_mem)
    begin
        if alu2reg = '1' then
            salida_reg <= registro_mem;  
        else
            salida_reg <= operacion_alu;  
        end if;
    end process;
end behavior; 