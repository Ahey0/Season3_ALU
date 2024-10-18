Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
Entity MiniALU is
 port (
        Sel     :  in  std_logic_vector(2  downto 0);
        DRin    :  in  std_logic_vector(15 downto 0);
        Acin    :  in  std_logic_vector(15 downto 0);
        ALUout  :  out std_logic_vector(15 downto 0);
        inpr    :  in  std_logic_vector(7 downto 0 );
        Cin     :  in  std_logic                    ;
        Cout    :  out std_logic                   );
End Entity;
Architecture MiniALU_behave of MiniALU is
signal S_ALu  : std_logic_vector(16  downto 0):="00000000000000000" ;
signal W      : std_logic_vector(16  downto 0)                     ;
signal Q      : std_logic_vector(16  downto 0)                     ;
signal S_inpr : std_logic_vector(15  downto 0)                     ;
Begin
S_inpr <= "00000000" & inpr;
W      <= '0'        & ACin;
Q      <= '0'        & DRin;
    process(Sel , DRin , Acin , cin , S_inpr , W ,Q  , S_ALu)
            begin
               case Sel is
                   when "000" =>
                               ALUout <= S_inpr                   ; 
                   when "001" =>
                               S_ALU  <=   W +  Q                 ;
                               --ALUout <= S_ALU(15 downto 0)       ;
                               Cout <= S_ALU(16)                  ;
                   when "010" =>
                               S_ALU <= W and Q                   ;
                   when "011" =>
                               S_ALU <= Q                         ;
                   when "100" =>
                               S_ALU <= not W                     ;
                               S_ALU(16) <= '0'                   ;
                   when "101" =>
                               S_ALU <='0'& Cin & W(15 downto 1) ;
                   when "111" => 
                               S_ALU <='0'&Acin(14 downto 0)&'0' ;
                               Cout   <= w(15)                    ;
                   when others =>
                               S_ALU <= S_ALU                    ;
               end case;
ALUout <= S_ALU(15 downto 0)       ;
    end process;
End Architecture;
