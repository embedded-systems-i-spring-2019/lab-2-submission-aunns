----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/07/2019 01:03:01 PM
-- Design Name: 
-- Module Name: my_alu - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity my_alu is
 Port (opcode: in std_logic_vector(3 downto 0);
        A,B: in std_logic_vector(3 downto 0);
           Y: out std_logic_vector( 3 downto 0) );
end my_alu;

architecture Behavioral of my_alu is



begin


process (opcode)
begin
case (opcode) is
    when "0000" => Y<=std_logic_vector(unsigned(A) + unsigned(B));
    when "0001"=>  Y<=std_logic_vector(unsigned(A) - unsigned(B));
    when "0010"=> Y<=std_logic_vector(unsigned(A) + 1 );
    when "0011"=> Y<=std_logic_vector(unsigned(A) - 1);
    when "0100"=> Y<= std_logic_vector(0 - unsigned(A));
    when "0101"=> if (A>B) then Y<="0001"; else Y<="0000" ;end if;
    when "0110"=> Y<=std_logic_vector(unsigned(A) sll 1);
    when "0111"=> Y<=std_logic_vector(unsigned(A) srl 1);
    when "1000"=> Y<=std_logic_vector(shift_right(signed(A),1));
    when "1001"=> Y<=not A;
    when "1010"=> Y<=A and B;
    when "1011"=> Y<=A or B;
    when "1100"=> Y<=A xor B;
    when "1101"=> Y<=A xnor B;
    when "1110"=> Y<=A nand B;
    when "1111"=> Y<=A nor B;


    
end case;
end process;
end Behavioral;
