Library Ieee;
Use Ieee.Std_Logic_1164.All;
Use Ieee.Std_Logic_Arith.All;
Entity ALU_Test Is 
      Port(
		     DOS  :  IN  Std_Logic_Vector(7 Downto 0) ;
			  HOL  :  IN  Std_Logic                    ;
			  SmDm :  IN  Std_Logic                    ;
			  ACd  :  IN  Std_Logic                    ;
			  DRd  :  IN  Std_Logic                    ;
			  INPd :  IN  Std_Logic                    ;
			  Clk  :  IN  std_logic                    ;
			  Carry:  Out Std_Logic                    ;
			  Dig1 :  Out Std_Logic_Vector(6 Downto 0) ;
			  Dig2 :  Out Std_Logic_Vector(6 Downto 0) ;
			  Dig3 :  Out Std_Logic_Vector(6 Downto 0) ;
			  Dig4 :  Out Std_Logic_Vector(6 Downto 0) ;
			  Dig5 :  Out Std_Logic_Vector(6 Downto 0) 
			  );
End Entity;
Architecture ALU_Test_Behave Of ALU_Test is
Component MiniALU is
 port (
        Sel     :  in  std_logic_vector(2  downto 0);
        DRin    :  in  std_logic_vector(15 downto 0);
        Acin    :  in  std_logic_vector(15 downto 0);
        ALUout  :  out std_logic_vector(15 downto 0);
        inpr    :  in  std_logic_vector(7 downto 0 );
        Cin     :  in  std_logic                    ;
        Cout    :  out std_logic                   
		  );
End Component;
Component INPR is
  port(
       inin    : in  std_logic_vector(7 downto 0 );
       outin   : out std_logic_vector(7 downto 0 );
       FGI     : in  std_logic                    ;
       clk     : in  std_logic
       );
End Component;
Component  AC_16 is 
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
End Component;
Component DR_16 is 
port (
      indr : in    std_logic_vector(15  downto 0);
      outdr: out   std_logic_vector(15  downto 0);
      clk  : in    std_logic                     ;
      load : in    std_logic                     ;
      incr : in    std_logic                     ;
      DR0  : out   std_logic                     ;
      clr  : in    std_logic                    
      );
End Component;
Component  E is
port(
     inE    : in   std_logic  ;
	  loadE  : in   std_logic  ;
	  clearE : in   std_logic  ;
	  NOTE   : in   std_logic  ; 
     clk    : in   std_logic  ;
     oute   : out  std_logic  
     );
End Component;
Component Clock_controll_50MHZ_T_50HZ is 
  port(
        clkin   : in  std_logic     ;
        EN      : in  std_logic     ;
        reset   : in  std_logic     ;
        clkout  : out std_logic     
       );
End Component;
Component CONVERTER is
port(
     INS      : in  std_logic_vector(15 downto 0)  ;
	  datadig1 : out integer  range 0 to 9          ;
	  datadig2 : out integer  range 0 to 9          ;
	  datadig3 : out integer  range 0 to 9          ;
	  datadig4 : out integer  range 0 to 9          ;
	  datadig5 : out integer  range 0 to 9          
	  );
End Component;
Component  Disp_CA is
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
End Component;
Signal Sel      :   Std_Logic_Vector(2  Downto 0):="110"   ;--Select For ALU
Signal DR       :   Std_Logic_Vector(15 Downto 0)          ;--DR Input  Data
Signal AC       :   Std_Logic_Vector(15 Downto 0)          ;--AC Input  Data
Signal DRo      :   Std_Logic_Vector(15 Downto 0)          ;--DR OUTput Data
Signal ACo      :   Std_Logic_Vector(15 Downto 0)          ;--AC OUTput Data
Signal DR_L     :   Std_Logic_Vector(7  Downto 0)          ;--DR Lower  8bit Data
Signal DR_H     :   Std_Logic_Vector(7  Downto 0)          ;--DR Higher 8bit Data
Signal AC_L     :   Std_Logic_Vector(7  Downto 0)          ;--AC Lower  8bit Data
Signal AC_H     :   Std_Logic_Vector(7  Downto 0)          ;--AC Higher 8bit Data
Signal INPRs    :   Std_Logic_Vector(7  Downto 0)          ;--INPR Input  Data
Signal INPRo    :   Std_Logic_Vector(7  Downto 0)          ;--INPR OUTput Data 
Signal EData    :   Std_logic:='0'                         ;--E Input  Data 
Signal Eo       :   Std_logic:='0'                         ;--E OUTput Data 
Signal datadig1 :   integer  range 0 to 9                  ;--Converted digit 1
Signal datadig2 :   integer  range 0 to 9                  ;--Converted digit 2
Signal datadig3 :   integer  range 0 to 9                  ;--Converted digit 3
Signal datadig4 :   integer  range 0 to 9                  ;--Converted digit 4
Signal datadig5 :   integer  range 0 to 9                  ;--Converted digit 5
Signal ALUout   :   Std_Logic_Vector(15 Downto 0)          ;--Alu Output data 
Signal Clk0     :   Std_Logic                              ;--Controlled Clk

Begin 


CC1 : Clock_controll_50MHZ_T_50HZ Port Map (Clk,'1','0',Clk0);

      Process(clk0) 
             Begin 
				      If Clk0'event And Clk0='1' Then 
						   If SmDm='1' Then 
							   If Hol='1' Then 
								   Sel <= DOS(2 Downto 0);
								End If;
						   Elsif SmDm='0' Then
							      If Acd='0' Then
								      If HOL='0' Then
									      AC_L <= DOS ;	
										Elsif HOL='1' Then 
										   AC_H <= DOS ;
										End If;
									Elsif DRd='0' Then 
									   If HOL='0' Then
									      DR_L <= DOS ;	
										Elsif HOL='1' Then 
										   DR_H <= DOS ;
										End If;
									Elsif INPd='0' Then 
									      INPRs<= DOS ;
									End If;
							End If;
					  End If;
					  AC <= AC_H & AC_L ;
					  DR <= DR_H & DR_L ;
		End Process;

	
R1  : AC_16     Port Map (AC,ACo,Clk,'1','0',Open,Open,'0');
R2  : DR_16     Port Map (DR,DRo,Clk,'1','0',open,'0');
R3  : INPR      Port Map (INPRS,INPRo,'0',Clk);
D1  : E         Port Map (Edata,'1','0','0',CLk,Eo);


AA1 : MiniALU    Port Map (Sel,DRo,ACo,AlUout,INPRo,Eo,EData);

CO1 : CONVERTER  Port Map (ALUout,datadig1,datadig2,datadig3,datadig4,datadig5);
DI1 : Disp_CA    Port Map (datadig1,datadig2,datadig3,datadig4,datadig5,Clk0,Dig1,Dig2,Dig3,Dig4,Dig5);

   Process(CLk0)
          Begin 
			      If Clk0'event And Clk0='1' Then 
				       Carry <= Eo ;
					End If;
	End Process;
End Architecture;