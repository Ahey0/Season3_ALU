library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_Unsigned.all;
Entity Clock_controll_50MHZ_T_50HZ is 
  port(
        clkin   : in  std_logic     ;
        EN      : in  std_logic     ;
        reset   : in  std_logic     ;
        clkout  : out std_logic     
       );
End Entity;
Architecture Clock_Controll_50MHZ_T_50HZ_Behave of Clock_controll_50MHZ_T_50HZ is
signal clkout_s : std_logic := '0' ;
Begin 
Process (clkin)
variable CH : integer range 0 to 1000000 := 0  ; 
    begin
     if EN='1' then
        if reset='0' then 
         if clkin'event and clkin='1' then
             if CH = 1000000 then 
                CH := 0 ;
                clkout_s <= Not clkout_s ;
             else
                CH := CH + 1 ;
             end if;  
         end if ;
        else 
         CH := 0 ;
        end if;
      end if;
end process;
clkout <= clkout_s ;
End Architecture;
