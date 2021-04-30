//////////////////////////////////////////////////////////////////////////////////////////
// Copyright (c) Bhupendra Kumar Yadav                                                  //
// -------------------------------------------------------------------------------------//
// FILE NAME: REGISTER.v                                                                //
// TYPE: module                                                                         //
// DEPARTMENT: FPGA Project                                                             //
// AUTHOR: Bhupendra Kumar Yadav                                                        //
// AUTHOR'S EMAIL: Yaduvanshi05bhupendra@gmail.com                                      //
//--------------------------------------------------------------------------------------//
// Release history                                                                      //
// VERSION DATE AUTHOR DESCRIPTION                                                      //
// 1.0 25/04/2021 Bhupendra Kumar Yadav                                                 //
//--------------------------------------------------------------------------------------//
// KEYWORDS: Register                                                                   //
//--------------------------------------------------------------------------------------//
// PURPOSE: Register to store data                                                      //
//////////////////////////////////////////////////////////////////////////////////////////

module REGISTER
#( 
  // Width of register A to store incoming data from data bus
  parameter DATA_WIDTH = 16   
 )
( // Clock for synchronization
  input clk,          
  // Load signal to load data from data path into register A
  input load,         
  // Incoming data (16 bit)
  input [(DATA_WIDTH-1):0] data_in,  
  // Outgoing data (16 bit)
  output reg [(DATA_WIDTH-1):0] data_out ); 

always @ ( posedge clk )
begin
	// If load signal is high store the data
	if ( load )                
		data_out <= data_in;
end
endmodule