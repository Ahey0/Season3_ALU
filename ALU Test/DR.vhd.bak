library ieee;
use ieee.std_logic_1164.all ;
use ieee.std_logic_unsigned.all ;
Entity DR_16 is 
port (
      indr : in    std_logic_vector(15  downto 0);
      outdr: out   std_logic_vector(15  downto 0);
      clk  : in    std_logic                     ;
      load : in    std_logic                     ;
      incr : in    std_logic                     ;
    		DR0  : out   std_logic                     ;
      clr  : in    std_logic                    
      );
End Entity;
Architecture DR_16_behave of DR_16 is 
signal S_DR : std_logic_vector(15  downto 0):="0000000000000000";
Begin
 process (clk)
  begin
    if clk'event and clk='1' then
       if    clr='1' then 
             S_DR <= "0000000000000000" ;
       elsif incr='1' and S_DR /="1111111111111111"  then
             S_DR <= S_DR + "0000000000000001" ;
       elsif incr='1' and S_DR  ="1111111111111111"  then
             S_DR <= "0000000000000000" ;
       elsif load='1' then
             S_DR <= indr;
       end if;
    end if;
	 if S_DR = "0000000000000000" then
	 DR0<='1';
	 else 
	 DR0<='0';
	 end if;
 end process;
outdr<=S_DR;
end Architecture;