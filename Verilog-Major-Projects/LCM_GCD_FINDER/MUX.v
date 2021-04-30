//////////////////////////////////////////////////////////////////////////////////////////
// Copyright (c) Bhupendra Kumar Yadav                                                  //
// -------------------------------------------------------------------------------------//
// FILE NAME: MUX.v                                                                     //
// TYPE: module                                                                         //
// DEPARTMENT: FPGA Project                                                             //
// AUTHOR: Bhupendra Kumar Yadav                                                        //
// AUTHOR'S EMAIL: Yaduvanshi05bhupendra@gmail.com                                      //
//--------------------------------------------------------------------------------------//
// Release history                                                                      //
// VERSION DATE AUTHOR DESCRIPTION                                                      //
// 1.0 25/04/2021 Bhupendra Kumar Yadav                                                 //
//--------------------------------------------------------------------------------------//
// KEYWORDS: 2X1 Multiplexer                                                            //
//--------------------------------------------------------------------------------------//
// PURPOSE: Multiplexer to route data                                                   //
//////////////////////////////////////////////////////////////////////////////////////////

module MUX
#(
  // 16 bit LCM or GCD 
  parameter DATA_WIDTH = 16    
 )

( // Select line for mux
  input select_line,            
  // Data input on port 1 of mux  
  input [(DATA_WIDTH-1):0] data_1,      
  // Data input on port 0 of mux
  input [(DATA_WIDTH-1):0] data_0,       
  // Data out from MUX
  output reg [(DATA_WIDTH-1):0] mux_out );   
  
// If select_line = 1, select data at port 1 otherwise choose port 0
// assign mux_out = ( select_line ) ? data_1 : data_0;

always @ ( * )
begin
   if ( select_line )
      mux_out = data_1;
   else
     mux_out = data_0;
end
    
endmodule