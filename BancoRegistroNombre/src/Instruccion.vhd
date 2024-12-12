library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Instruccion is
    port(
        clk      : in  STD_LOGIC;                     -- Reloj para la sincronización
        dato     : in  STD_LOGIC_VECTOR(31 downto 0); -- Entrada de 32 bits
        dato_imm : out STD_LOGIC_VECTOR(11 downto 0);  -- concatenado imm
        funct7   : out STD_LOGIC_VECTOR(6 downto 0);  -- Salida funct7
        rs2      : out STD_LOGIC_VECTOR(4 downto 0);  -- Salida rs2
        rs1      : out STD_LOGIC_VECTOR(4 downto 0);  -- Salida rs1
        funct3   : out STD_LOGIC_VECTOR(2 downto 0);  -- Salida funct3
        rd       : out STD_LOGIC_VECTOR(4 downto 0);  -- Salida rd
        opcode   : out STD_LOGIC_VECTOR(6 downto 0)  -- Salida opcode
    );
end Instruccion;

architecture behavior of Instruccion is
	signal count : integer range 0 to 12 := 0;  -- Contador para recorrer los bits de la entrada 
begin
    process(clk)
    begin
        if rising_edge(clk) then
            -- Aumentar el contador con cada ciclo de reloj
            if count < 12 then
                count <= count + 1;
            else
                count <= 0;  -- Reseteo el contador cuando llega a 31
            end if;
            
            -- Asignar valores secuenciales a funct3, funct7 y shift_op conforme el contador
            case count is
                when 0 => 
                    funct3 <= "000"; funct7 <= "0000000";   -- add
                when 1 => 
                    funct3 <= "000"; funct7 <= "0100000";   -- sub	
                when 2 => 
                    funct3 <= "111"; funct7 <= "0000000";   -- and
                when 3 => 
                    funct3 <= "110"; funct7 <= "0000000";   -- or
                when 4 => 
                    funct3 <= "100"; funct7 <= "0000000";   -- xor
                when 5 => 
                    funct3 <= "010"; funct7 <= "0000000";   -- stl
                when 6 => 
                    funct3 <= "011"; funct7 <= "0000000";   -- stlu
                when 7 => 
                    funct3 <= "001"; funct7 <= "0000000";   -- sll
                when 8 => 
                    funct3 <= "101"; funct7 <= "0000000";   -- srl
                when 9 => 
                    funct3 <= "101"; funct7 <= "0100000";   -- sra
                when others => 
                    funct3 <= "000"; funct7 <= "0000000";   -- Valores por defecto
            end case;
            
            -- Separación de las señales de la entrada (división de 'dato')
			dato_imm <= dato(31 downto 20);
            rs2 <= dato(24 downto 20);
            rs1 <= dato(19 downto 15);
            rd <= dato(11 downto 7);
            opcode <= dato(6 downto 0);
        end if;
    end process;
end behavior;
