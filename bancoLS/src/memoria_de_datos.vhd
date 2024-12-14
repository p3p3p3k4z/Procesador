library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Memoria_de_Datos is
    Port (
        clk : in STD_LOGIC;                   -- Señal de reloj
        we  : in STD_LOGIC;                   -- Señal de habilitación de escritura
        a   : in STD_LOGIC_VECTOR(4 downto 0); -- Dirección del dato
        di  : in STD_LOGIC_VECTOR(31 downto 0); -- Dato de entrada
        do  : out STD_LOGIC_VECTOR(31 downto 0) -- Dato de salida
    );
end Memoria_de_Datos;

architecture Behavioral of Memoria_de_Datos is

    -- Definir tipo de arreglo de registros
    type mem_array is array (0 to 31) of STD_LOGIC_VECTOR(31 downto 0);

    -- Memoria de datos inicializada con valores por defecto
    signal mem : mem_array := (
        0 => X"00000000",  1 => X"00000001",  2 => X"00000002",  3 => X"00000003",
        4 => X"00000004",  5 => X"00000005",  6 => X"00000006",  7 => X"00000007",
        8 => X"00000008",  9 => X"00000009",  10 => X"0000000A", 11 => X"0000000B",
        12 => X"0000000C", 13 => X"0000000D", 14 => X"0000000E", 15 => X"0000000F",
        16 => X"00000010", 17 => X"00000011", 18 => X"00000012", 19 => X"00000013",
        20 => X"00000014", 21 => X"00000015", 22 => X"00000016", 23 => X"00000017",
        24 => X"00000018", 25 => X"00000019", 26 => X"0000001A", 27 => X"0000001B",
        28 => X"0000001C", 29 => X"0000001D", 30 => X"0000001E", 31 => X"0000001F"
    );

begin

    -- Proceso de escritura sincronizada
    process (clk)
    begin
        if rising_edge(clk) then
            if we = '1' then
                mem(conv_integer(a)) <= di;  -- Escritura en la dirección indicada
            end if;
        end if;
    end process;

    -- Lectura instantánea
    do <= mem(conv_integer(a));  -- Salida del dato de la dirección indicada

end Behavioral;