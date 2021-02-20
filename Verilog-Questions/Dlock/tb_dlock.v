// Copyright (c) Bhupendra Kumar Yadav
// -----------------------------------------------------------------
// FILE NAME: tb_dlock.v
// TYPE: module
// DEPARTMENT: Verilog Design with FPGA
// AUTHOR: Bhupendra Kumar Yadav
// AUTHOR'S EMAIL: Yaduvanshi05bhupendra@gmail.com
//------------------------------------------------------------------
// Release history
// VERSION DATE AUTHOR DESCRIPTION
// 1.0 20/02/2021 Bhupendra kumar yadav
//------------------------------------------------------------------
// KEYWORDS: test bench, FSM
//------------------------------------------------------------------
// PURPOSE: test bench module to detect 110100 sequence using FSM

`timescale 1 ns / 1 ps  // set timescale to
                        //nanoseconds, ps precision

module tb_dlock ();  //  no sensitivity list!

// signal declarations
reg d_in;         // data input stimulus
reg clear;        // data input stimulus
reg clk;          // data input stimulus
wire unlock;      // data output stimulus
reg expected;     // expected unlock result 

// DUT instantiation       
test1 dut (.unlock(unlock), 
           .d_in(d_in), 
           .clear(clear), 
           .clk(clk)
          );

initial begin
clk = 0;
clear = 0;
// Clock of 50ns clock period with 50% duty cycle
forever #25 clk=~clk;
end

// Test stimulus generation
initial begin
    clear = 1'b1;
    d_in = 1'b0; expected = 1'b0;
#25 d_in = 1'b1; expected = 1'b0;
#50 d_in = 1'b1; expected = 1'b0;
#50 d_in = 1'b0; expected = 1'b0;
#50 d_in = 1'b1; expected = 1'b0;
#50 d_in = 1'b0; expected = 1'b0;
#50 d_in = 1'b0; expected = 1'b1;
#50 d_in = 1'b1; expected = 1'b0;
#50 d_in = 1'b1; expected = 1'b0;
#50 d_in = 1'b1; expected = 1'b0;
#50 d_in = 1'b0; expected = 1'b0;
#50 d_in = 1'b1; expected = 1'b0;
#50 d_in = 1'b0; expected = 1'b0;
#50 d_in = 1'b0; expected = 1'b1;
#50 d_in = 1'b1; expected = 1'b0;
#50 d_in = 1'b1; expected = 1'b0;
end

// Test Results
initial begin 
$monitor ($time, " Clock: %b", clk,
                 " Clear: %b", clear,
                 " Data_in: %b", d_in,
                 " Unlock: %b", unlock,
                 " Expected: %b", expected
          );
end

// Stop simulation after 750ns
initial begin
#750 $stop;
end 

endmodule
