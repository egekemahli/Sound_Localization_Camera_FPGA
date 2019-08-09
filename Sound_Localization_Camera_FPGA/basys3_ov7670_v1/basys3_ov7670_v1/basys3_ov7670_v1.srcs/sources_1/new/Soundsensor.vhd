library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Soundsensor is
port(   clk : in std_logic;
        Sin : in std_logic;
        inputswit : in std_logic;
        LED: out std_logic);
end Soundsensor;
architecture Behavioral of Soundsensor is
begin
process(clk)
begin
    if rising_edge (clk )then
        if Sin = '1' then
            LED <= '1' ;
        end if;
    if inputswit = '1' then
        LED <= '0';
    end if ;
    end if;
end process;
end Behavioral;