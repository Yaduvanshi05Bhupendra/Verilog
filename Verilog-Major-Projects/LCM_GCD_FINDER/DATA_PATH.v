//////////////////////////////////////////////////////////////////////////////////////////
// Copyright (c) Bhupendra Kumar Yadav                                                  //
// -------------------------------------------------------------------------------------//
// FILE NAME: DATA_PATH.v                                                               //
// TYPE: module                                                                         //
// DEPARTMENT: FPGA Project                                                             //
// AUTHOR: Bhupendra Kumar Yadav                                                        //
// AUTHOR'S EMAIL: Yaduvanshi05bhupendra@gmail.com                                      //
//--------------------------------------------------------------------------------------//
// Release history                                                                      //
// VERSION DATE AUTHOR DESCRIPTION                                                      //
// 1.0 25/04/2021 Bhupendra Kumar Yadav                                                 //
//--------------------------------------------------------------------------------------//
// KEYWORDS: Data flow path                                                             //
//--------------------------------------------------------------------------------------//
// PURPOSE: All data flow and arithmatic is done in data path                           //
//////////////////////////////////////////////////////////////////////////////////////////

module DATA_PATH 
#( 
   // 16 bit data to perform LCM or GCD
   parameter DATA_WIDTH = 16   
 )
( // Clock for register for loading data from data bus
  input clk,      
  // Signal from controller load data in register A 
  input load_A,   
  // Signal from controller load data in register B
  input load_B,   
  // Signal from controller load data in register M
  input load_M,   
  // Signal from controller load data in register N
  input load_N,   
  // Signal from user wether he want to perform LCM (1) or GCD (0)
  input LCM_GCD,  
  // If done is high, it means we got output now we will not load reg A and reg B
  input done,     
  // Select Signal for mux X from controller (It output will go to arithmatic block)
  input select_x, 
  // Select Signal for mux Y from controller (It output will go to arithmatic block)
  input select_y, 
  // Select Signal for mux_data_sel from controller (for fresh data or operated data by arithmatic)
  input select_input, 
  // Data by user
  input [(DATA_WIDTH-1):0] data_input,  
  // If data in register A is less than data in register B then it will become high
  output less_than,     
  // If data in register A is greater than data in register B then it will become high
  output greater_than,  
  // If data in register A is equal to data in register B then it will become high
  output equal,         
  // Final LCM or GCD, it will be only assigned to output if equal is high
  output reg [(DATA_WIDTH-1):0] LCM_GCD_out ); 
  
// This is xor of LCM_GCD and load_A signal. If it is high it will load data from data bus in register A
wire load_reg_A; 
// This is xor of LCM_GCD and load_B signal. If it is high it will load data from data bus in register B
wire load_reg_B; 
// This is xor of LCM_GCD and select_x signal. It will act as select line for mux_x 
wire mux_x_sel;  
// This is xor of LCM_GCD and select_y signal. It will act as select line for mux_y 
wire mux_y_sel;  
wire xor_reg_A;
wire xor_reg_B;
wire done_bar;
wire [(DATA_WIDTH-1):0] data_bus; 
wire [(DATA_WIDTH-1):0] mux_x_out;
wire [(DATA_WIDTH-1):0] mux_y_out;
wire [(DATA_WIDTH-1):0] wire_mux_x_0;
wire [(DATA_WIDTH-1):0] wire_mux_x_1;
wire [(DATA_WIDTH-1):0] wire_mux_y_0;
wire [(DATA_WIDTH-1):0] wire_mux_y_1; 
wire [(DATA_WIDTH-1):0] wire_mux_am_1;
wire [(DATA_WIDTH-1):0] wire_mux_bn_1;
wire [(DATA_WIDTH-1):0] arithmatic_out;

//==========================================================================================
//                    REGISTER A, REGISTER B, REGISTER M, REGISTER N                      ||
//==========================================================================================
// xor gate is used. If LCM_GCD is high it will invert input signal otherwise 
// it will act as buffer
// LCM_GCD is 1 for LCM and 0 for GCD
xor ( xor_reg_A, load_A, LCM_GCD );                                     
not ( done_bar, done );
and ( load_reg_A, done_bar, xor_reg_A );
REGISTER REG_A ( .clk      (clk), 
                 .load     (load_reg_A), 
                 .data_in  (data_bus), 
                 .data_out (wire_mux_x_0) ); 
					  
// 				 
xor (xor_reg_B, load_B, LCM_GCD);
and ( load_reg_B, done_bar, xor_reg_B );
REGISTER REG_B ( .clk      (clk), 
                 .load     (load_reg_B), 
                 .data_in  (data_bus), 
                 .data_out (wire_mux_y_0) );

REGISTER REG_M ( .clk      (clk), 
                 .load     (load_M), 
                 .data_in  (data_bus), 
                 .data_out (wire_mux_am_1) );
					  
REGISTER REG_N ( .clk      (clk), 
                 .load     (load_N), 
                 .data_in  (data_bus), 
                 .data_out (wire_mux_bn_1) );
					  
//==========================================================================================
//                    MUX_A_M, MUX_B_N, MUX_X, MUX_y, MUX_data_sel                        ||
//==========================================================================================
MUX MUX_A_M    ( .select_line (LCM_GCD), 
                 .data_0      (wire_mux_x_0), 
                 .data_1      (wire_mux_am_1), 
                 .mux_out     (wire_mux_y_1) );
					  
MUX MUX_B_N    ( .select_line (LCM_GCD), 
                 .data_0      (wire_mux_y_0), 
                 .data_1      (wire_mux_bn_1), 
                 .mux_out     (wire_mux_x_1) );

xor (mux_x_sel, select_x, LCM_GCD);

MUX MUX_X      ( .select_line (mux_x_sel), 
                 .data_0      (wire_mux_x_0), 
                 .data_1      (wire_mux_x_1), 
                 .mux_out     (mux_x_out) );
				 
xor (mux_y_sel, select_y, 1'b0);
MUX MUX_Y      ( .select_line (mux_y_sel), 
                 .data_0      (wire_mux_y_0), 
                 .data_1      (wire_mux_y_1), 
                 .mux_out     (mux_y_out) );
					  
MUX MUX_data_sel ( .select_line (select_input),   
                   .data_0      (arithmatic_out), 
                   .data_1      (data_input), 
                   .mux_out     (data_bus) );

//==========================================================================================
//                                      COMPARATOR                                        ||
//==========================================================================================
COMPARATOR COMP ( .data_reg_a   (wire_mux_x_0), 
                  .data_reg_b   (wire_mux_y_0), 
                  .less_than    (less_than), 
                  .greater_than (greater_than), 
                  .equal        (equal) );

//==========================================================================================
//                                      ARITHMATIC                                        ||
//==========================================================================================
ARITHMATIC AIRTH ( .LCM_GCD        (LCM_GCD), 
                   .mux_x_in       (mux_x_out), 
                   .mux_y_in       (mux_y_out), 
                   .arithmatic_out (arithmatic_out) );
				 
//==========================================================================================
//                                    ASSIGNING OUTPUT                                    ||
//==========================================================================================
always @ ( posedge clk )
begin
if ( equal ) 
   LCM_GCD_out <= wire_mux_x_0;
end
endmodule