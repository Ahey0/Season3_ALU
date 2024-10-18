Library Ieee;
use Ieee.std_logic_1164.all;
Entity E is
port(
     inE    : in   std_logic  ;
	    loadE  : in   std_logic  ;
	    clearE : in   std_logic  ;
	    NOTE   : in   std_logic  ; 
     clk    : in   std_logic  ;
     oute   : out  std_logic  
     );
End Entity;
Architecture E_behave of E is
Signal S_E : std_logic:='0';
Begin
     process(clk)
        Begin
              if clk'event and clk='1' then
				     if LoadE='1' then 
					      S_E <=inE     ;
						elsif ClearE='1' then
					      S_E <= '0'    ;
						elsif NOTE='1' then
					      S_E <= Not S_E ;
						end if;
					end if;	
     end process;
end Architecture;