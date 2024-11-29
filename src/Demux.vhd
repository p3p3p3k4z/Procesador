library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Demux is
    port(
        op_instruccion : in STD_LOGIC;                    -- Señal de control para seleccionar la entrada
        ext             : in STD_LOGIC_VECTOR(31 downto 0); -- Entrada de 31 bits del extensor de signo
        banco           : in STD_LOGIC_VECTOR(31 downto 0); -- Entrada de 31 bits del banco de registros
        salida          : out STD_LOGIC_VECTOR(31 downto 0)  -- Salida seleccionada (31 bits)
    );
end Demux;

architecture behavior of Demux is
begin
    process(op_instruccion, ext, banco)
    begin
        if op_instruccion = '1' then
            -- Si op_instruccion es 1, tomamos el valor de ext directamente
            salida <= ext;  -- La salida será directamente el valor de ext, ya que es de 31 bits
        else
            -- Si op_instruccion es 0, tomamos el valor de banco directamente
            salida <= banco;  -- La salida será directamente el valor de banco, también de 31 bits
        end if;
    end process;
end behavior;
