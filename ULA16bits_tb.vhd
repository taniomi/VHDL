-- Milena Namie Tanioka
-- 05.APR.2023

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ULA16bits_tb is
end entity;

architecture a_ULA16bits of ULA16bits_tb is
	component ULA16bits
	port( in0 : in unsigned(15 downto 0);
		  in1 : in unsigned(15 downto 0);
		  op : in unsigned(1 downto 0);
		  out0 : out unsigned(15 downto 0);
		  zero : out std_logic;
		  grt : out std_logic
		);
	end component;
	signal in0, in1, out0 : unsigned(15 downto 0) := (others => '0');
	signal op : unsigned(1 downto 0) := (others => '0');
	signal zero, grt : std_logic;
	
begin
	uut: ULA16bits port map( in0 => in0,	-- pino => sinal
							 in1 => in1,
							 op => op,
							 out0 => out0,
							 zero => zero,
							 grt => grt
							);
process
begin
	-- SUM
	in0 <= "0000000000101010";
	in1 <= "0000000000101010";
	op <= "00";
	wait for 50 ns;
	-- SUB
	in0 <= "0000000001010100";
	in1 <= "0000000000101010";
	op <= "01";
	wait for 50 ns;
	-- SUB RESULT 0
	in0 <= "0000000000101010";
	in1 <= "0000000000101010";
	op <= "01";
	wait for 50 ns;
	-- SHIFT LEFT in0
	in0 <= "0000000000101010";
	in1 <= "0000000000101010";
	op <= "10";
	wait for 50 ns;
	-- SHIFT LEFT in0
	in0 <= "0000000000000000";
	in1 <= "0000000000101010";
	op <= "10";
	wait for 50 ns;
	-- SHIFT LEFT in1
	in0 <= "0000000000000000";
	in1 <= "0000000000101010";
	op <= "11";
	wait for 50 ns;
	wait;
end process;
end architecture;

	-- ghdl -a ULA16bits_tb.vhd
	-- ghdl -e ULA16bits_tb

	-- ghdl -r ULA16bits_tb --wave=ULA16bits_tb.ghw
	-- gtkwave ULA16bits_tb.ghw