

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity photocatch is
    Port ( clkin : in STD_LOGIC;
           inswit: in std_logic;
           clkout : out STD_LOGIC);
end photocatch;

architecture Behavioral of photocatch is

signal s : std_logic;

begin
   process (clkin)
    begin
    if  rising_edge (clkin) then
      if inswit = '1' then
           s  <= '1';
      end if ;
      if inswit = '0' then
            s <= '0';
      end if;      
    end if;
    end process;
    
with s select clkout
    <= clkin when '0',
    '0' when others;
    
    
end Behavioral;
