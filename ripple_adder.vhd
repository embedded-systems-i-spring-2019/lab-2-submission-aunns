----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/07/2019 12:31:36 AM
-- Design Name: 
-- Module Name: ripple_adder - Behavioral
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

entity ripple_adder is
  Port (A,B : in std_logic_vector( 3 downto 0);
        C0: in std_logic;
        C4: out std_logic;
        Y: out std_logic_vector(3 downto 0) );
end ripple_adder;


architecture Behavioral of ripple_adder is

signal c1,c2,c3: std_logic;

component adder is
    Port (A,B,CIN : in std_logic;
            S,COUT: out std_logic );
end component;
begin

a1: adder
    port map(A=>A(0),
             B=>B(0),
             CIN=>C0,
             S=>Y(0),
             COUT=>c1);
             
a2: adder
    port map(A=>A(1),
             B=>B(1),
             CIN=>C1,
             S=>Y(1),
             COUT=>c2);
             
a3: adder
    port map(A=>A(2),
             B=>B(2),
             CIN=>C2,
             S=>Y(2),
             COUT=>c3);
             
a4: adder
    port map(A=>A(3),
             B=>B(3),
             CIN=>C3,
             S=>Y(3),
             COUT=>C4);                                       

end Behavioral;
