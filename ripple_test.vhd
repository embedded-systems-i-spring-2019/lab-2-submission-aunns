----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/07/2019 12:42:31 AM
-- Design Name: 
-- Module Name: ripple_test - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ripple_test is

end ripple_test;

architecture Behavioral of ripple_test is
 signal a,b:  std_logic_vector(3 downto 0);
 signal       cin:  std_logic:= '0';
   signal      cout:  std_logic;
      signal   output:  std_logic_vector(3 downto 0) ;

component ripple_adder is
Port (A,B : in std_logic_vector( 3 downto 0);
        C0: in std_logic;
        C4: out std_logic;
        Y: out std_logic_vector(3 downto 0) );
        
        end component;
        

begin
process
begin
wait for 4ns;
    a<="0010";
    b<="0100";
    cin<='0';
    
wait for 4ns;
    a<="0010";
    b<="0100";
    cin<='1';
    
wait for 4ns;
    a<="1010";
    b<="0100";
    cin<='0';    


end process;

r1: ripple_adder
port map(A=>a,
            B=>b,
            C0=>cin,
            C4=>cout,
            Y=>output);
        

end Behavioral;
