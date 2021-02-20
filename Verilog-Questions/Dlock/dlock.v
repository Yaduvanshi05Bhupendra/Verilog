// Copyright (c) Bhupendra Kumar Yadav
// -----------------------------------------------------------------
// FILE NAME: dlock.v
// TYPE: module
// DEPARTMENT: Verilog Design with FPGA
// AUTHOR: Bhupendra Kumar Yadav
// AUTHOR'S EMAIL: Yaduvanshi05bhupendra@gmail.com
//------------------------------------------------------------------
// Release history
// VERSION DATE AUTHOR DESCRIPTION
// 1.0 19/02/2021 Bhupendra kumar yadav
//------------------------------------------------------------------
// KEYWORDS: FSM
//------------------------------------------------------------------
// PURPOSE: module to detect 110100 sequence using FSM

module dlock
 #( //Binary encoding of state
   parameter STATE_WIDTH = 3,
	parameter S0 = 3'b000,
	parameter S1 = 3'b001,
	parameter S2 = 3'b010,
	parameter S3 = 3'b011,
	parameter S4 = 3'b100,
	parameter S5 = 3'b101
  )

 ( //Ports
  input clk,
  input clear,
  input d_in,
  output reg unlock
 );

 reg [(STATE_WIDTH-1):0] present_state;  
 reg [(STATE_WIDTH-1):0] next_state;
 
 // Present state register
 // Sequential logic
 // Make sure sensitivity list in always block is 
 //edge triggered or level triggered
 always @(posedge clk or negedge clear)
    begin
       if (clear == 1'b0)
          present_state <= S0;       
       else 
          present_state <= next_state;
   end

 // body of FSM is case statement
 // Next state logic
 // Combinational logic
 always @(present_state or d_in)
    begin 
       case(present_state)
          S0 : begin
                  next_state <= d_in ? S1 : S0;
                  unlock <= 1'b0;
               end
          S1 : begin
                  next_state <= d_in ? S2 : S0;
                  unlock <= 1'b0;
               end
          S2 : begin
                  next_state <= d_in ? S2 : S3;
                  unlock <= 1'b0;
               end
          S3 : begin
                  next_state <= d_in ? S4 : S0;
                  unlock <= 1'b0;
               end
          S4 : begin
                  next_state <= d_in ? S2 : S5;
                  unlock <= 1'b0;
               end
          S5 : begin
                  next_state <= d_in ? S1 : S0;
                  unlock     <= d_in ? 1'b0 : 1'b1;
               end
     default : begin
                  next_state <= S0;
                  unlock <= 1'b0;
               end  
       endcase
    end
 endmodule         