library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Extensor_Signo is
    Port (
        rst1      : in  STD_LOGIC_VECTOR(4 downto 0); -- Dirección de 5 bits
        fun7      : in  STD_LOGIC_VECTOR(6 downto 0); -- Valor de 7 bits
        shift_op  : in  STD_LOGIC;                    -- Señal de control para corrimiento
        ext       : out STD_LOGIC_VECTOR(31 downto 0) -- Salida de 32 bits
    );
end Extensor_Signo;

architecture Behavioral of Extensor_Signo is
begin
    process(rst1, fun7, shift_op)
    begin
        if shift_op = '0' then
            -- Si el bit más significativo de fun7 es '1', extendemos con '1's
            if fun7(6) = '1' then
                ext <= (others => '1'); -- Inicializamos todo en '1'
                ext(11 downto 0) <= fun7 & rst1; -- Asignamos los 12 bits de concatenación
            else
                -- Si el bit más significativo de fun7 es '0', extendemos con '0's
                ext <= (others => '0'); -- Inicializamos todo en '0'
                ext(11 downto 0) <= fun7 & rst1; -- Asignamos los 12 bits de concatenación
            end if;
        else
            -- Para shift_op = '1', rellenamos con ceros y usamos rst1 directamente
            ext <= (others => '0'); -- Inicializamos todo en ceros
            ext(4 downto 0) <= rst1; -- Asignamos los 5 bits de rst1
        end if;
    end process;
end Behavioral;
