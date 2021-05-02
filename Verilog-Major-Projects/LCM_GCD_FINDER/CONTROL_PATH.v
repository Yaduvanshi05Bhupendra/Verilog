//////////////////////////////////////////////////////////////////////////////////////////
// Copyright (c) Bhupendra Kumar Yadav                                                  //
// -------------------------------------------------------------------------------------//
// FILE NAME: CONTROL_PATH.v                                                            //
// TYPE: module                                                                         //
// DEPARTMENT: FPGA Project                                                             //
// AUTHOR: Bhupendra Kumar Yadav                                                        //
// AUTHOR'S EMAIL: Yaduvanshi05bhupendra@gmail.com                                      //
//--------------------------------------------------------------------------------------//
// Release history                                                                      //
// VERSION DATE AUTHOR DESCRIPTION                                                      //
// 1.0 25/04/2021 Bhupendra Kumar Yadav                                                 //
//--------------------------------------------------------------------------------------//
// KEYWORDS: FSM, Controller, Select select generator                                   //
//--------------------------------------------------------------------------------------//
// PURPOSE: It will control flow of Data_Path by providing control signal               //
//////////////////////////////////////////////////////////////////////////////////////////

module CONTROL_PATH ( // Clock for synchronization
                      input clk, 
					  // If data in reg A is less than data in reg B this signal will become high
                      input less_than,
                      // If data in reg A is greater than data in reg B this signal will become high					  
                      input greater_than, 
					  // If data in reg A is equal to data in reg B this signal will become high
                      input equal,  
					  // Start will begin the process of calculation
                      input start, 
                      output reg load_A, 
                      output reg load_B,
                      output reg load_M, 
                      output reg load_N, 					  
                      output reg select_x, 
                      output reg select_y, 
                      output reg select_input, 
                      output reg done );

reg [2:0] present_state;
parameter STATE_0_LOAD_AM      = 3'b000;
parameter STATE_1_LOAD_BN      = 3'b001;
parameter STATE_2_START        = 3'b010;
parameter STATE_3_LESS_THAN    = 3'b011;
parameter STATE_4_GREATER_THAN = 3'b100;
parameter STATE_5_DONE         = 3'b101;

always @( posedge clk )
begin
case ( present_state )
        STATE_0_LOAD_AM : begin                 // This state will load reg B and M
                          if ( start )          // After start only whole process begin
                             present_state <= STATE_1_LOAD_BN; // State will go to next state at every clock cycle
						  else                  // If start is low than it will remain in same state
						     present_state <= STATE_0_LOAD_AM;
                          end
        STATE_1_LOAD_BN : begin                 // This state will load reg A and N
                             present_state <= STATE_2_START;
                          end
          STATE_2_START : begin // From here algorithm will start
                          if ( equal ) 
                             present_state <= STATE_5_DONE;
                          else if ( less_than ) 
                             present_state <= STATE_3_LESS_THAN;
                          else if ( greater_than ) 
                             present_state <= STATE_4_GREATER_THAN;
                          end
      STATE_3_LESS_THAN : begin
                          if ( equal ) 
                             present_state <= STATE_5_DONE;
                          else if ( less_than ) 
                             present_state <= STATE_3_LESS_THAN;
                          else if ( greater_than ) 
                             present_state <= STATE_4_GREATER_THAN;
                          end
   STATE_4_GREATER_THAN : begin
                          if ( equal ) 
                             present_state <= STATE_5_DONE;
                          else if ( less_than ) 
                             present_state <= STATE_3_LESS_THAN;
                          else if ( greater_than ) 
                             present_state <= STATE_4_GREATER_THAN;
                          end
           STATE_5_DONE : begin
                             present_state <= STATE_5_DONE;
                          end
                default : begin
                             present_state <= STATE_0_LOAD_AM;
                          end
endcase
end

always @(present_state)
begin
case (present_state)
        STATE_0_LOAD_AM : begin 
                             select_input = 1'b1; // 
                             load_A = 1'b1; // Due to combinational ciruit, this signal will not load A
                             load_M = 1'b0; // Reg M will not be loaded
                             load_B = 1'b0; // Reg B will be loaded due to combinational circuit
                             load_N = 1'b1; // Reg N will not be loaded
                             done   = 1'b0; 
                          end
        STATE_1_LOAD_BN : begin 
                             select_input = 1'b1; 
                             load_A = 1'b0; 
                             load_M = 1'b1;
                             load_B = 1'b1; 
                             load_N = 1'b0;
                             done   = 1'b0; 
	                      end
          STATE_2_START : begin
                          if ( equal ) 
                             done = 1'b1;
                          else if ( less_than ) 
                          begin
                             select_input = 1'b0;
                             select_x = 1'b1; 
                             select_y = 1'b1; 
                             load_A = 1'b0; 
                             load_M = 1'b0;
                             load_B = 1'b1; 
                             load_N = 1'b0;
                          end
                          else if ( greater_than ) 
                          begin
                             select_input = 1'b0;
                             select_x = 1'b0; 
                             select_y = 1'b0; 
                             load_A = 1'b1; 
                             load_M = 1'b0;
                             load_B = 1'b0; 
                             load_N = 1'b0;
                          end
                          end
      STATE_3_LESS_THAN : begin
                          if ( equal ) 
                             done = 1'b1;
                          else if ( less_than ) 
                          begin
                             select_input = 1'b0;
                             select_x = 1'b1; 
                             select_y = 1'b1; 
                             load_A = 1'b0; 
                             load_M = 1'b0;
                             load_B = 1'b1; 
                             load_N = 1'b0;
                          end
                          else if ( greater_than ) 
                          begin
                             select_input = 1'b0;
                             select_x = 1'b0; 
                             select_y = 1'b0; 
                             load_A = 1'b1; 
                             load_M = 1'b0;
                             load_B = 1'b0; 
                             load_N = 1'b0;
                          end
                          end
   STATE_4_GREATER_THAN : begin
                          if ( equal ) 
                             done = 1'b1;
                          else if ( less_than ) 
                          begin
                             select_input = 1'b0;
                             select_x = 1'b1; 
                             select_y = 1'b1; 
                             load_A = 1'b0; 
                             load_M = 1'b0;
                             load_B = 1'b1; 
                             load_N = 1'b0;
                          end
                          else if ( greater_than ) 
                          begin
                             select_input = 1'b0;
                             select_x = 1'b0; 
                             select_y = 1'b0; 
                             load_A = 1'b1; 
                             load_M = 1'b0;
                             load_B = 1'b0; 
                             load_N = 1'b0;
                          end
                          end
           STATE_5_DONE : begin  // exception
                             done = 1'b1; 
                             select_x = 1'b0; 
                             select_y = 1'b0; 
                             load_A = 1'b0; 
                             load_M = 1'b0;
                             load_B = 1'b0; 
                             load_N = 1'b0;
                          end
                default : begin 
                             load_A = 1'b0; 
                             load_M = 1'b0;
                             load_B = 1'b0; 
                             load_N = 1'b0;
                          end
endcase
end
endmodule