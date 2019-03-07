----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/07/2019 01:47:21 PM
-- Design Name: 
-- Module Name: alu_tester - Behavioral
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

entity alu_tester is
 Port (sw,btn: in std_logic_vector(3 downto 0);
        clk: in std_logic;
        led: out std_logic_vector(3 downto 0)
                 );
end alu_tester;

architecture Behavioral of alu_tester is

component my_alu is
 Port (opcode: in std_logic_vector(3 downto 0);
        A,B: in std_logic_vector(3 downto 0);
           Y: out std_logic_vector( 3 downto 0) );
end component;

component debounce is
 Port (clk: in std_logic;
        btn: in std_logic;
        dbnc: out std_logic );
        end component;
   signal dbn1,dbn2,dbn3,dbn0: std_logic;
   
signal input1,input2,input3,output: std_logic_vector(3 downto 0);      
   
begin

 d1: debounce 
    port map(clk=>clk,      --button for loading B
             btn=>btn(0),
             dbnc=>dbn0);
 d2: debounce 
    port map(clk=>clk,      --button for laoding A
             btn=>btn(1),
             dbnc=>dbn1);
 d3: debounce               --button for loading opcode
    port map(clk=>clk,
             btn=>btn(2),
             dbnc=>dbn2);
 d4: debounce               --button for resetting
    port map(clk=>clk,
             btn=>btn(3),
             dbnc=>dbn3);
             
a1: my_alu
    port map(opcode=>input1,
                A=>input2,
                B=>input3,
                Y=>output);            
                                                  
process(clk)
begin
if (rising_edge(clk)) then
    if(dbn2='1') then       --loading opcode
        input1<=sw;
        end if;
        
    if(dbn1='1') then       --loading A
            input2<=sw;
            end if;   
                    
    if(dbn0='1') then       --loading B
            input3<=sw;
            end if;    
                
    if(dbn3='1') then       --resetting
            input1 <="0000" ;
            input2 <="0000" ;
            input3 <="0000" ;
            
            end if;   
    led<=output;                         
    
end if;
end process;

   
    
end Behavioral;
