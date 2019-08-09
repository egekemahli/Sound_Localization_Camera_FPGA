library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity servo_pwm is
    PORT (
        clk   : IN  STD_LOGIC;
        reset : IN  STD_LOGIC;
--        pos   : IN  STD_LOGIC_VECTOR(6 downto 0);
        Sensorin1: IN  STD_LOGIC;
        Sensorin2: IN  STD_LOGIC;
        Sensorin3: IN  STD_LOGIC;
        servo : OUT STD_LOGIC
    );
end servo_pwm;

architecture Behavioral of servo_pwm is
    -- Counter, from 0 to 1279.
    signal cnt : unsigned(10 downto 0);
    -- Temporal signal used to generate the PWM pulse.
    signal pwmi: unsigned(7 downto 0);
    
    signal posout :  STD_LOGIC_VECTOR(6 downto 0);
    signal enable : std_logic;
begin
    -- Minimum value should be 0.5ms.
    pwmi <= unsigned('0' & posout) + 32;
    -- Counter process, from 0 to 1279.
    
    
    
    counter: process (reset, clk) begin
        if (reset = '1') then
            cnt <= (others => '0');
        elsif rising_edge(clk) then
            if (cnt = 1279) then
                cnt <= (others => '0');
            else
                cnt <= cnt + 1;
            end if;
        end if; 
    end process;

    process(Sensorin1, Sensorin2, Sensorin3,posout,clk)
    begin
    
-- if rising_edge (clk )then
--     if(Sensorin1 = '1' and Sensorin2 = '0' and Sensorin3 = '0' ) then
--       posout  <= "0000000";
--          enable <= '1';
--       elsif(Sensorin1 = '0' and Sensorin2 = '1' and Sensorin3 = '0') then
--       posout  <= "0001000";
--          enable <= '1';
--       elsif(Sensorin1 = '1' and Sensorin2 = '1' and Sensorin3 = '0') then
--       posout  <= "0011000";
--          enable <= '1';
--       elsif(Sensorin1 = '0' and Sensorin2 = '0' and Sensorin3 = '1') then
--       posout  <= "1111111";
--          enable <= '1';
--       elsif(Sensorin1 = '1' and Sensorin2 = '0' and Sensorin3 = '1'  ) then
--       posout  <= "0111000";
--          enable <= '1';
--       elsif(Sensorin1 = '0' and Sensorin2 = '1' and Sensorin3 = '1' ) then
--       posout  <= "1010000";
--          enable <= '1';
--       elsif (Sensorin1 = '1' and Sensorin2 = '1' and Sensorin3 = '1' ) then
--       posout  <= "0111000";
--          enable <= '1';
--       else 
--      enable <= '0';
--       end if;
--      end if;
--       end process;



 if rising_edge (clk )then
 
     if(Sensorin1 = '1' and Sensorin2 = '0' and Sensorin3 = '0' ) then
       posout  <= "0000000";
          enable <= '1';
       elsif(Sensorin1 = '0' and Sensorin2 = '1' and Sensorin3 = '0') then
       posout  <= "0011000";
          enable <= '1';
       elsif(Sensorin1 = '1' and Sensorin2 = '1' and Sensorin3 = '0') then
       posout  <= "0011000";
          enable <= '1';
       elsif(Sensorin1 = '0' and Sensorin2 = '0' and Sensorin3 = '1') then
       posout  <= "0111000";
          enable <= '1';
       elsif(Sensorin1 = '1' and Sensorin2 = '0' and Sensorin3 = '1'  ) then
       posout  <= "0011000";
          enable <= '1';
       elsif(Sensorin1 = '0' and Sensorin2 = '1' and Sensorin3 = '1' ) then
       posout  <= "0011000";
          enable <= '1';
       elsif (Sensorin1 = '1' and Sensorin2 = '1' and Sensorin3 = '1' ) then
       posout  <= "0011000";
          enable <= '1';
       else 
      enable <= '0';
       end if;
      end if;
       end process;



--    process(Sensorin1,  Sensorin3,posout)
--begin
-- if rising_edge (clk )then
--    if(Sensorin1 = '0' and Sensorin3 = '0'  ) then
--   posout  <= "0111000";
--   enable <= '1';
   
--   elsif(Sensorin1 = '1' and  Sensorin3 = '0') then
--   posout  <= "0000000";
--   enable <= '1';
   
--   elsif(Sensorin1 = '0' and  Sensorin3 = '1') then
--   posout  <= "1111111";
--   enable <= '1';
--   elsif(Sensorin1 = '1' and  Sensorin3 = '1') then
--      posout  <= "0111000";
--      enable <= '1';


--   end if;
--   end if;
--   end process;
    
    
    
    
    
    
   --  Output signal for the servomotor.
    servo <= '1' when ((cnt < pwmi) and enable = '1' ) else '0';
end Behavioral;

