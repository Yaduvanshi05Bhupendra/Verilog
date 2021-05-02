//////////////////////////////////////////////////////////////////////////////////////////
// Copyright (c) Bhupendra Kumar Yadav                                                  //
// -------------------------------------------------------------------------------------//
// FILE NAME: LCM_GCD.v                                                                 //
// TYPE: module                                                                         //
// DEPARTMENT: FPGA Project                                                             //
// AUTHOR: Bhupendra Kumar Yadav                                                        //
// AUTHOR'S EMAIL: Yaduvanshi05bhupendra@gmail.com                                      //
//--------------------------------------------------------------------------------------//
// Release history                                                                      //
// VERSION DATE AUTHOR DESCRIPTION                                                      //
// 1.0 25/04/2021 Bhupendra Kumar Yadav                                                 //
//--------------------------------------------------------------------------------------//
// KEYWORDS: Top level module, Data path, Control Path                                  //
//--------------------------------------------------------------------------------------//
// PURPOSE: Top level of module will instantiate control and data path                  //
//////////////////////////////////////////////////////////////////////////////////////////

module LCM_GCD 
#( 
  parameter DATA_WIDTH = 16    // 16 bit LCM or GCD
 )
( input clk,      // Clock for register for loading data from data bus
  input LCM_GCD,
  input start,
  input [(DATA_WIDTH-1):0] data_input,  // Data by user
  output [(DATA_WIDTH-1):0] LCM_GCD_out );
 
// For Register
 wire load_A;
 wire load_B;
 wire load_M;
 wire load_N;
 wire done;
// For Mux
 wire select_x;
 wire select_y;
 wire select_input;
// For Comparator
 wire less_than;
 wire greater_than;
 wire equal;

//==========================================================================================
//                                          DATA_PATH                                     ||
//==========================================================================================
DATA_PATH DP ( .clk          (clk),     
               .load_A       (load_A),   
               .load_B       (load_B),  
               .load_M       (load_M),   
               .load_N       (load_N),   
               .LCM_GCD      (LCM_GCD),  
               .done         (done),
               .select_x     (select_x), 
               .select_y     (select_y), 
               .select_input (select_input), 
               .data_input   (data_input),
               .less_than    (less_than),     
               .greater_than (greater_than),  
               .equal        (equal),       
               .LCM_GCD_out  (LCM_GCD_out) );
  
//==========================================================================================
//                                        CONTROLLER                                      ||
//==========================================================================================
CONTROL_PATH CP ( .clk          (clk), 
                  .less_than    (less_than), 
                  .greater_than (greater_than), 
                  .equal        (equal), 
                  .start        (start), 
                  .load_A       (load_A), 
                  .load_B       (load_B),
                  .load_M       (load_M), 
                  .load_N       (load_N), 					  
                  .select_x     (select_x), 
                  .select_y     (select_y), 
                  .select_input (select_input), 
                  .done         (done) );
				  
endmodule
  