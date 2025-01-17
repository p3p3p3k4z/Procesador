library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is
    port(
        alu_op         : in  STD_LOGIC_VECTOR(3 downto 0);
        op1            : in  STD_LOGIC_VECTOR(31 downto 0);
        op2            : in  STD_LOGIC_VECTOR(31 downto 0);
        alu_resultado  : out STD_LOGIC_VECTOR(31 downto 0)
    );
end ALU;

architecture behavior of ALU is
begin
    process(alu_op, op1, op2)
        variable signed_op1  : SIGNED(31 downto 0);
        variable signed_op2  : SIGNED(31 downto 0);
        variable unsigned_op1 : UNSIGNED(31 downto 0);
        variable unsigned_op2 : UNSIGNED(31 downto 0);
        variable result       : STD_LOGIC_VECTOR(31 downto 0);
    begin
        signed_op1 := SIGNED(op1);
        signed_op2 := SIGNED(op2);
        unsigned_op1 := UNSIGNED(op1);
        unsigned_op2 := UNSIGNED(op2);

        case alu_op is
            when "0000" => -- Suma
                result := STD_LOGIC_VECTOR(unsigned_op1 + unsigned_op2);
            when "0001" => -- Resta
                result := STD_LOGIC_VECTOR(unsigned_op1 - unsigned_op2);
            when "0010" => -- AND
                result := op1 AND op2;
            when "0011" => -- OR
                result := op1 OR op2;
            when "0100" => -- XOR
                result := op1 XOR op2;
            when "0101" => -- Set if less than (signed)
                if signed_op1 < signed_op2 then
                    result := (others => '0'); result(0) := '1';
                else
                    result := (others => '0');
                end if;
            when "0110" => -- Set if less than (unsigned)
                if unsigned_op1 < unsigned_op2 then
                    result := (others => '0'); result(0) := '1';
                else
                    result := (others => '0');
                end if;
            when "0111" => -- Shift left logical
                result := STD_LOGIC_VECTOR(SHIFT_LEFT(unsigned_op1, TO_INTEGER(unsigned_op2(4 downto 0))));
            when "1000" => -- Shift right logical
                result := STD_LOGIC_VECTOR(SHIFT_RIGHT(unsigned_op1, TO_INTEGER(unsigned_op2(4 downto 0))));
            when "1001" => -- Shift right arithmetic
                result := STD_LOGIC_VECTOR(SHIFT_RIGHT(signed_op1, TO_INTEGER(unsigned_op2(4 downto 0))));
            when "1010" => -- Equals (bitwise AND comparison)
                result := (others => '0');
                if op1 = op2 then
                    result(0) := '1';
                end if;
            when others => -- Default case
                result := (others => '0');
        end case;

        alu_resultado <= result; -- Asignar el resultado final a la salida
    end process;

end behavior;
