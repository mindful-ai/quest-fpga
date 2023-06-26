----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.06.2023 09:22:02
-- Design Name: 
-- Module Name: mux_4_1 - Behavioral
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


-- 1101 = 13 (unsigned)
-- 1101 = 101 -> 5, msb 1 -> -  => overall value -5 (signed)


entity mux_4_1 is
    port (
            sel: in unsigned(1 downto 0);
            a, b, c, d: in std_logic;
            y: out std_logic   
    );
end mux_4_1;

architecture Behavioral of mux_4_1 is
begin
    
--    -- Usage of when... else... statement
--    y <= a when sel = "00" else
--         b when sel = "01" else
--         c when sel = "10" else
--         d; -- when sel = "11";

--      -- Usage of process block with if.. else.. statement
--      -- Verilog -> always@(<sensitivity list>), always@(*)
--      process(a, b, c, d, sel)
--      begin
--        if(sel(1) = '0') then
--            if(sel(0) = '0') then
--                y <= a;
--            else
--                y <= b;
--            end if;
--         else
--            if(sel(0) = '0') then
--                y <= c;
--            -- elsif() then
--            -- elsif() then
--            else
--                y <= d;
--            end if;
--         end if;
--      end process;

--        -- process block with a case statement
--        process(a, b, c, d, sel)
--        begin
--            case sel is 
--                when "00" => y <= a;
--                when "01" => y <= b;
--                when "10" => y <= c;
--                when "11" => y <= d;
--            end case;
--        end process;
        
        -- with... select... statement
        with sel select
            y <= a when "00",
                 b when "01",
                 c when "10",
                 d when others;
        
end Behavioral;
