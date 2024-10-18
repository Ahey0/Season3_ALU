library ieee;
use ieee.std_logic_1164.all ;
use ieee.std_logic_unsigned.all ;
Entity AC_16 is 
port (
      inac : in    std_logic_vector(15  downto 0);
      outac: out   std_logic_vector(15  downto 0);
      clk  : in    std_logic                     ;
      load : in    std_logic                     ;
      incr : in    std_logic                     ;
	    	AC15 : out   std_logic                     ;
		    AC0  : out   std_logic                     ;
      clr  : in    std_logic                    
      );
End Entity;
Architecture AC_16_behave of AC_16 is 
signal S_AC : std_logic_vector(15  downto 0):="0000000000000000";
Begin
 process (clk)
  begin
    if clk'event and clk='1' then
    if    clr='1' then 
       S_AC <= "0000000000000000" ;
    elsif incr='1' and S_AC /="1111111111111111"  then
       S_AC <= S_AC + "0000000000000001" ;
    elsif incr='1' and S_AC  ="1111111111111111"  then
       S_AC <= "0000000000000000" ;
    elsif  load='1' then
       S_AC <= inac;
    end if;
    end if;
	 if S_AC="0000000000000000" then
	 AC0<='1';
	 else 
	 AC0<='0';
	 end if;
 end process;
outac<=S_AC;
AC15<=S_AC(15);
end Architecture;