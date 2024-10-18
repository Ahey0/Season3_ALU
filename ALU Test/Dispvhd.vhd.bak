Library Ieee;
Use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
Entity Disp_CA is
  Port(
       datadig1 : in  integer  range 0 to 9          ;
       datadig2 : in  integer  range 0 to 9          ;
    	  datadig3 : in  integer  range 0 to 9          ;
    	  datadig4 : in  integer  range 0 to 9          ;
       datadig5 : in  integer  range 0 to 9          ;
       Clk      : in  std_logic                      ;
       dig1     : out std_logic_vector(6 downto 0)   ;
       dig2     : out std_logic_vector(6 downto 0)   ;
    	  dig3     : out std_logic_vector(6 downto 0)   ;
       dig4     : out std_logic_vector(6 downto 0)   ;
       dig5     : out std_logic_vector(6 downto 0)   
       );  
End Entity;
Architecture Disp_CA_Behave Of Disp_CA is
Begin
process(clk)
 Begin
  if clk'event and clk='1' then 
       Case datadig1 IS 
		         When 0 =>
			                 dig1<=Not "0111111" ;
			        when 1 => 
                     dig1<=Not "0000110" ;
			        when 2 =>
	                    dig1<=Not "1011011" ;
		         when 3 =>
	                    dig1<=Not "1001111" ;
		         when 4 =>
	                    dig1<=Not "1100110" ;
	     	  	 when 5 =>
                     dig1<=Not "1101101" ;
	       		 when 6 =>
         	           dig1<=Not "1111101" ;
	       		 when 7 =>
	                    dig1<=Not "0000111" ;
	       		 when 8 => 
	                    dig1<=Not "1111111" ;
		       	 when 9 =>
	                    dig1<=Not "1101111" ;		
		     End case;
		   Case datadig2 IS 
		         When 0 =>
			                 dig2<=Not "0111111" ;
			        when 1 => 
	                    dig2<=Not "0000110" ;
		         when 2 =>
	                    dig2<=Not "1011011" ;
	     	    when 3 =>
	                    dig2<=Not "1001111" ;
	     	    when 4 =>
	                    dig2<=Not "1100110" ;
		       	 when 5 =>
                     dig2<=Not "1101101" ;
		       	 when 6 =>
	                    dig2<=Not "1111101" ;
		       	 when 7 =>
	                    dig2<=Not "0000111" ;
		       	 when 8 => 
	                    dig2<=Not "1111111" ;
		       	 when 9 =>
	                    dig2<=Not "1101111" ;		
	    	  End case; 
	     Case datadig3 IS 
		         When 0 =>
			                 dig3<=Not "0111111" ;
		       	 when 1 => 
	                    dig3<=Not "0000110" ;
		       	 when 2 =>
	                    dig3<=Not "1011011" ;
	          when 3 =>
	                    dig3<=Not "1001111" ;
    		     when 4 =>
     	               dig3<=Not "1100110" ;
		  	     when 5 =>
                     dig3<=Not "1101101" ;
      			 when 6 =>
	                    dig3<=Not "1111101" ;
      			 when 7 =>
	                    dig3<=Not "0000111" ;
			      when 8 => 
	                    dig3<=Not "1111111" ;
	      		 when 9 =>
	                   dig3<=Not "1101111" ;		
		     End case;
		   Case datadig4 IS 
		        When 0 =>
			                dig4<=Not "0111111" ;
			       when 1 => 
	                   dig4<=Not "0000110" ;
       			 when 2 =>
	                   dig4<=Not "1011011" ;
     		    when 3 =>
	                   dig4<=Not "1001111" ;
     		    when 4 =>
        	           dig4<=Not "1100110" ;
	    	  	 when 5 =>
                    dig4<=Not "1101101" ;
	      		 when 6 =>
	                   dig4<=Not "1111101" ;
	      		 when 7 =>
	                   dig4<=Not "0000111" ;
		      	 when 8 => 
	                   dig4<=Not "1111111" ;
			       when 9 =>
	                   dig4<=Not "1101111" ;		
	    	  End case; 
		    Case datadig5 IS 
		        When 0 =>
			                 dig5<=Not "0111111" ;
			      when 1 => 
	                   dig5<=Not "0000110" ;
			      when 2 =>
	                   dig5<=Not "1011011" ;
      	   when 3 =>
	                   dig5<=Not "1001111" ;
          when 4 =>
	                   dig5<=Not "1100110" ;
		       when 5 =>
                    dig5<=Not "1101101" ;
			      when 6 =>
	                   dig5<=Not "1111101" ;
			      when 7 =>
	                   dig5<=Not "0000111" ;
			      when 8 => 
	                   dig5<=Not "1111111" ;
			      when 9 =>
	                   dig5<=Not "1101111" ;		
		     End case;
		End if;
End process;
End Architecture;