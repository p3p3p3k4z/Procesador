library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder is
    port(
        dato     : in  STD_LOGIC_VECTOR(31 downto 0); 
        funct7   : out STD_LOGIC_VECTOR(7 downto 0);  
        rs2      : out STD_LOGIC_VECTOR(4 downto 0); 
        rs1      : out STD_LOGIC_VECTOR(4 downto 0);  
        funct3   : out STD_LOGIC_VECTOR(3 downto 0);  
        rd       : out STD_LOGIC_VECTOR(4 downto 0);  
        opcode   : out STD_LOGIC_VECTOR(6 downto 0)  
    );
end decoder;

architecture behavior of decoder is
begin      
	-- Separación de las señales de la entrada (división de 'dato')
	funct7 <= dato(31 downto 24);
	rs2 <= dato(24 downto 20);
	rs1 <= dato(19 downto 15);
	funct3 <= dato(14 downto 11);
	rd <= dato(11 downto 7);
	opcode <= dato(6 downto 0);
            
end behavior;