library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
Entity CONVERTER is
port(
     INS    : in  std_logic_vector(15 downto 0)  ;
	  datadig1 : out integer  range 0 to 9          ;
	  datadig2 : out integer  range 0 to 9          ;
	  datadig3 : out integer  range 0 to 9          ;
	  datadig4 : out integer  range 0 to 9          ;
	  datadig5 : out integer  range 0 to 9          
	  );
End Entity;
Architecture CONVERTER_Behave of CONVERTER is
signal data1     :  integer range 0 to 65535        ;
signal data2     :  integer range 0 to 65535        ;
signal data3     :  integer range 0 to 65535        ;
signal data4     :  integer range 0 to 65535        ;
signal data5     :  integer range 0 to 65535        ;
signal data6     :  integer range 0 to 65535        ;
signal OUTS     :  std_logic_vector(15 downto 0)    ;
Begin
		  OUTS      <= INS ;
		  data1      <= conv_integer(unsigned(OUTS));
		  datadig1  <= data1 rem 10  ;
		  data2      <= data1/10     ;
     datadig2  <= data2 rem 10  ;
		  data3      <= data2/10     ;
    	datadig3  <= data3 rem 10  ;
     data4      <= data3/10     ;
		  datadig4  <= data4 rem 10  ;
		  data5      <= data4/10     ; 
		  datadig5  <= data5 rem 10  ;
End Architecture;