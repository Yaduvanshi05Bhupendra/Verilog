//////////////////////////////////////////////////////////////////////////////////////////
// Copyright (c) Bhupendra Kumar Yadav                                                  //
// -------------------------------------------------------------------------------------//
// FILE NAME: ARITHMATIC.v                                                              //
// TYPE: module                                                                         //
// DEPARTMENT: FPGA Project                                                             //
// AUTHOR: Bhupendra Kumar Yadav                                                        //
// AUTHOR'S EMAIL: Yaduvanshi05bhupendra@gmail.com                                      //
//--------------------------------------------------------------------------------------//
// Release history                                                                      //
// VERSION DATE AUTHOR DESCRIPTION                                                      //
// 1.0 25/04/2021 Bhupendra Kumar Yadav                                                 //
//--------------------------------------------------------------------------------------//
// KEYWORDS: Addition, Subtraction, Arithmatic operation                                //
//--------------------------------------------------------------------------------------//
// PURPOSE: To add or subtract two 16 bit data                                          //
//////////////////////////////////////////////////////////////////////////////////////////

module ARITHMATIC  
#( 
  // 16 bit from addition and subtraction
  parameter DATA_WIDTH = 16 
 )

( // If LCM_GCD = 1; LCM will be found otherwise GCD
  input LCM_GCD,                                 
  // Output of MUX X. This data will be greater (16 bit)
  input [(DATA_WIDTH-1):0] mux_x_in,              
  // Output of MUX Y. This data will be smaller (16 bit)
  input [(DATA_WIDTH-1):0] mux_y_in,              
  // Result of addition or subtraction. This output will go to MUX_DATA_SELECT (16 bit)
  output reg [(DATA_WIDTH-1):0] arithmatic_out ); 
  
always @ ( * )
begin
	if ( LCM_GCD == 1'b1 )
		// For LCM. It will do addition
		arithmatic_out <= mux_x_in + mux_y_in;   
	else
		// For GCD. It will do subtraction 
		arithmatic_out <= mux_x_in - mux_y_in;   
end

endmodule