-- Milena Namie Tanioka
-- 05.APR.2023

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ULA16bits is
	port( in0 : in unsigned(15 downto 0);
		  in1 : in unsigned(15 downto 0);
		  op : in unsigned(1 downto 0);
		  out0 : out unsigned(15 downto 0);
		  zero : out std_logic;
		  grt : out std_logic
		);
end entity;

architecture a_ULA16bits of ULA16bits is
	begin
		out0 <= in0 + in1 when op = "00" else					--SUM
				in0 - in1 when op = "01" else					--SUBT
				in0(14 downto 0) & '0' when op = "10" else		--SHIFT LEFT for in0 (doesn't work for some numbers)
				in1(14 downto 0) & '0' when op = "11" else		--SHIFT LEFT for in1 (doesn't work for some numbers)
				"0000000000000000";
				
		grt  <= '1' when in0 > in1 and op = "01" else
				'0';
				
		zero <= '1' when op = "01" and in0 = in1 else
				'1' when op = "10" and (in0 = 0 or in1 = 0) else
				'0';
end architecture;