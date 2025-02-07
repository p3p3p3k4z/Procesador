library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Memoria_de_Datos is
    Port (
        clk : in STD_LOGIC;                     -- Se�al de reloj
        we  : in STD_LOGIC;                     -- Se�al de habilitaci�n de escritura
        ad  : in STD_LOGIC_VECTOR(31 downto 0); -- Direcci�n de memoria
        di  : in STD_LOGIC_VECTOR(31 downto 0); -- Datos a escribir
        do  : out STD_LOGIC_VECTOR(31 downto 0); -- Valor le�do de la memoria
        palabra: in STD_LOGIC_VECTOR(3 downto 0) -- Selector de palabra/media/byte
    );
end Memoria_de_Datos;

architecture Behavioral of Memoria_de_Datos is

    type mem_array is array (0 to 31) of STD_LOGIC_VECTOR(31 downto 0);

    -- Memoria de datos inicializada con valores por defecto 
    signal mem : mem_array := (
        0 => "00000000000000000000000000000000",  1 => "00000000000000000000000000000000",  2 => "00000000000000000000000000000000",  3 => "00000000000000000000000000000000",
        4 => "00000000000000000000000000000000",  5 => "00000000000000000000000000000000",  6 => "00000000000000000000000000000000",  7 => "00000000000000000000000000000000",
        8 => "00000000000000000000000000000000",  9 => "00000000000000000000000000000000",  10 => "00000000000000000000000000000000", 11 => "00000000000000000000000000000000",
        12 => "00000000000000000000000000000110", 13 => "00000000000000000000000000000000", 14 => "00000000000000000000000000000000", 15 => "00000000000000000000000000000000",
        16 => "00000000000000000000000000010000", 17 => "00000000000000000000000000000000", 18 => "00000000000000000000000000000000", 19 => "00000000000000000000000000000000",
        20 => "00000000000000000000000000001010", 21 => "00000000000000000000000000000000", 22 => "00000000000000000000000000000000", 23 => "00000000000000000000000000000000",
        24 => "00000000000000000000000000001011", 25 => "00000000000000000000000000000000", 26 => "00000000000000000000000000000000", 27 => "00000000000000000000000000000000",
        28 => "00000000000000000000000000011100", 29 => "00000000000000000000000000000000", 30 => "00000000000000000000000000000000", 31 => "00000000000000000000000000000000"
    );

    -- Se�ales para almacenar los datos seleccionados seg�n el valor de 'palabra'
    signal palabra_seleccionada : STD_LOGIC_VECTOR(31 downto 0);
    signal do_seleccionado : STD_LOGIC_VECTOR(31 downto 0); -- Se�al para lectura seleccionada

begin

    -- Proceso para seleccionar palabra completa, media palabra o byte basado en 'palabra'
    process (palabra, ad, di)
    begin
        -- Inicializar las se�ales con ceros
        palabra_seleccionada <= (others => '0');
        do_seleccionado <= (others => '0');
        
        -- Selecci�n para escritura (di)
        case palabra is
            when "0000" => -- Palabra completa
                palabra_seleccionada <= di;  -- Selecciona toda la palabra para escritura
            when "0001" => -- Media palabra superior
                palabra_seleccionada(15 downto 0) <= di(31 downto 16);  -- Escribe solo los 16 bits superiores
            when "0010" => -- Media palabra inferior
                palabra_seleccionada(15 downto 0) <= di(15 downto 0);  -- Escribe solo los 16 bits inferiores
            when "0011" => -- Byte 1 (m�s significativo)
                palabra_seleccionada(7 downto 0) <= di(31 downto 24); -- Escribe el primer byte
            when "0100" => -- Byte 2
                palabra_seleccionada(7 downto 0) <= di(23 downto 16); -- Escribe el segundo byte
            when "0101" => -- Byte 3
                palabra_seleccionada(7 downto 0) <= di(15 downto 8);   -- Escribe el tercer byte
            when "0110" => -- Byte 4 (menos significativo)
                palabra_seleccionada(7 downto 0) <= di(7 downto 0);    -- Escribe el cuarto byte
            when others => 
                palabra_seleccionada <= (others => '1');  -- Valor predeterminado para 'others'
        end case;
    
        -- Selecci�n para lectura (do)
        case palabra is
            when "0000" => -- Palabra completa
                do_seleccionado <= mem(conv_integer(ad(4 downto 0)));  -- Lee toda la palabra
            when "0001" => -- Media palabra superior
                do_seleccionado(15 downto 0) <= mem(conv_integer(ad(4 downto 0)))(31 downto 16);  -- Lee los 16 bits superiores
            when "0010" => -- Media palabra inferior
                do_seleccionado(15 downto 0) <= mem(conv_integer(ad(4 downto 0)))(15 downto 0);  -- Lee los 16 bits inferiores
            when "0011" => -- Byte 1 (m�s significativo)
                do_seleccionado(7 downto 0) <= mem(conv_integer(ad(4 downto 0)))(31 downto 24);  -- Lee el primer byte
            when "0100" => -- Byte 2
                do_seleccionado(7 downto 0) <= mem(conv_integer(ad(4 downto 0)))(23 downto 16);  -- Lee el segundo byte
            when "0101" => -- Byte 3
                do_seleccionado(7 downto 0) <= mem(conv_integer(ad(4 downto 0)))(15 downto 8);  -- Lee el tercer byte
            when "0110" => -- Byte 4 (menos significativo)
                do_seleccionado(7 downto 0) <= mem(conv_integer(ad(4 downto 0)))(7 downto 0);   -- Lee el cuarto byte
            when others => 
                do_seleccionado <= (others => '1');  -- Valor predeterminado para 'others'
        end case;
    
    end process;

    process (clk)
    begin
        if rising_edge(clk) then
            if we = '1' then
                mem(conv_integer(ad(4 downto 0))) <= palabra_seleccionada;  -- Escritura en la direcci�n v�lida
            end if;
        end if;
    end process;

    do <= do_seleccionado; -- Salida de la memoria con el valor seleccionado

end Behavioral;
