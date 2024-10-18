library ieee;
use ieee.std_logic_1164.all;
Entity INPR is
  port(
       inin    : in  std_logic_vector(7 downto 0 );
       outin   : out std_logic_vector(7 downto 0 );
       FGI     : in  std_logic                    ;
       clk     : in  std_logic
       );
end entity;
Architecture INPR_behave of INPR is
Begin
 process (clk)
      begin
           if clk'event and clk='1' then
               if FGI='0' then
                       outin <= inin   ;
               end if;
           end if;
       end process;
end Architecture;