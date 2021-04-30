//////////////////////////////////////////////////////////////////////////////////////////
// Copyright (c) Bhupendra Kumar Yadav                                                  //
// -------------------------------------------------------------------------------------//
// FILE NAME: COMPARATOR.v                                                              //
// TYPE: module                                                                         //
// DEPARTMENT: FPGA Project                                                             //
// AUTHOR: Bhupendra Kumar Yadav                                                        //
// AUTHOR'S EMAIL: Yaduvanshi05bhupendra@gmail.com                                      //
//--------------------------------------------------------------------------------------//
// Release history                                                                      //
// VERSION DATE AUTHOR DESCRIPTION                                                      //
// 1.0 25/04/2021 Bhupendra Kumar Yadav                                                 //
//--------------------------------------------------------------------------------------//
// KEYWORDS: Comparator                                                                 //
//--------------------------------------------------------------------------------------//
// PURPOSE: To compare data in reg A and reg B                                          //
//////////////////////////////////////////////////////////////////////////////////////////

module COMPARATOR
#( 
  // Width of register to store incoming data from data bus
  parameter DATA_WIDTH = 16   
 )
( // Input data from register A (16 bit)
  input [(DATA_WIDTH-1):0] data_reg_a, 
  // Input data from register B (16 bit)
  input [(DATA_WIDTH-1):0] data_reg_b,  
  // If data in reg A is less than data in reg B this signal will become high
  output wire less_than,
  // If data in reg A is equal to data in reg B this signal will become high
  output wire equal,
  // If data in reg A is greater than data in reg B this signal will become high
  output wire greater_than );

// If Data_reg_A is less than Data_reg_B, then less_than = 1 otherwise less_than = 0
assign less_than    =  data_reg_a < data_reg_b;
// If Data_reg_A is greater than Data_reg_B, then greater_than = 1 otherwise greater_than = 0
assign greater_than =  data_reg_a > data_reg_b;
// If Data_reg_A is equal Data_reg_B, then equal = 1 otherwise equal = 0
assign equal        =  data_reg_a == data_reg_b;

endmodule