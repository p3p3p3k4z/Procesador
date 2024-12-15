library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity suma4 is
    Port (
        clk   : in  STD_LOGIC;                    -- Señal de reloj
        rst   : in  STD_LOGIC;                    -- Señal de reset
        a_in  : in  STD_LOGIC_VECTOR(5 downto 0); -- Valor inicial
        a_out : out STD_LOGIC_VECTOR(5 downto 0)  -- Dirección incrementada
    );
end suma4;

architecture Behavioral of suma4 is
    signal counter : INTEGER range 0 to 38 := 0; -- Contador interno
    signal base    : INTEGER := 0;                -- Base para el valor inicial
begin
    process(clk, rst)
    begin
        if rst = '1' then
            -- Cuando el reset está activo, inicializamos base y counter con el valor de a_in
            base <= to_integer(unsigned(a_in));
            counter <= base; -- Inicializa con el valor de a_in
        elsif rising_edge(clk) then
            -- Si el contador llega a un valor mayor que 38, reiniciamos con la base
            if (counter + 4) > 38 then
                counter <= base; -- Reinicia al valor base
            else
                counter <= counter + 4; -- Incrementa en 4
            end if;
        end if;
    end process;

    -- Salida convertida a STD_LOGIC_VECTOR
    a_out <= std_logic_vector(to_unsigned(counter, 6));
end Behavioral;
