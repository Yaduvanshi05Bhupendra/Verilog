<h1 align="center">Verilog Practice and Projects</h1>
<br/>
<p align="center">
  <img src="https://www.meldium.com/wp-content/uploads/2018/11/FpgaServices.png" alt="perl" width="60" height="60"/>
</p>


## Index

* [Verilog-Topics](#Verilog-Topics)
    * [Verilog-HDL-Syntax-And-Semantics](#Verilog-HDL-Syntax-And-Semantics)
    * [Gate-Level-Modeling](#Gate-Level-Modeling)
    * [User-Defined-Primitives](#User-Defined-Primitives)
    * [Verilog-Operators](#Verilog-Operators)
    * [Verilog-Behavioral-Modeling](#Verilog-Behavioral-Modeling)
    * [Procedural-Timing-Control](#Procedural-Timing-Control)
    * [Task-And-Functions](#Task-And-Functions)
    * [System-Task-And-Function](#System-Task-And-Function)
    * [Writing-TestBenches](#Writing-TestBenches)
    * [Modeling-Memories-And-FSM](#Modeling-Memories-And-FSM)
    * [Parameterized-Modules](#Parameterized-Modules)
    * [Compiler-Directives](#Compiler-Directives)
    
    
* [Verilog-Mini-Projects](#Verilog-Mini-Projects)
    * [Combinational-Circuit](#Combinational-Circuit)
       * [HALF-ADDER](#HALF-ADDER)
       * [FULL-ADDER](#FULL-ADDER)
       * [2x1-MUX](#2x1-MUX)
       * [4x1-MULTIPLXER](#4x1-MULTIPLXER)
       * [4x1-MUX-USING-2x1-MUX](#4x1-MUX-USING-2x1-MUX)
       * [2-BIT-MULTIPLIER](#2-BIT-MULTIPLIER)
       * [4-BIT-MULTIPLIER-USING-FULL-AND-HALF-ADDER](#4-BIT-MULTIPLIER-USING-FULL-AND-HALF-ADDER)
       * [4-BIT-MULTIPLIER-USING-2-BIT-MULTIPLIER](#4-BIT-MULTIPLIER-USING-2-BIT-MULTIPLIER)
       * [1x4-DEMUX](#1x4-DEMUX)
       * [8x3-ENCODER](#8x3-ENCODER)
       * [PRIORITY-ENCODER](#PRIORITY-ENCODER)
       * [3x8-DECODER](#3x8-DECODER)
       * [SYNTHESIS-OF-2x4-DECODER](#SYNTHESIS-OF-2x4-DECODER)
       
    * [Sequential-Circuit](#Sequential-Circuit)
       * [SR-FLIP-FLOP](#SR-FLIP-FLOP)
       * [JK-FLIP-FLOP](#JK-FLIP-FLOP)
       * [D-FLIP-FLOP](#D-FLIP-FLOP)
       * [T-FLIP-FLOP](#T-FLIP-FLOP)
       * [UP-COUNTER](#UP-COUNTER)
       * [DOWN-COUNTER](#DOWN-COUNTER)
       * [UP-DOWN-COUNTER](#UP-DOWN-COUNTER)
       * [4-BIT-SYNCHRONOUS-COUNTER](#4-BIT-SYNCHRONOUS-COUNTER)
       * [4-BIT-ASYNCHRONOUS-COUNTER](#4-BIT-ASYNCHRONOUS-COUNTER)
       * [FSM-MELAY-1010](#FSM-MELAY-1010)
       * [FSM-MOORE-1010](#FSM-MOORE-1010)
       * [N-BIT-SERIAL-ADDER](#N-BIT-SERIAL-ADDER)
       * [N-BIT-BINARY-TO-GRAY-CODE-CONVERTER](#N-BIT-BINARY-TO-GRAY-CODE-CONVERTER)
       * [SINGLE-PORT-RAM](#SINGLE-PORT-RAM)
       * [DUAL-PORT-RAM](#DUAL-PORT-RAM)
       * [ROM](#ROM)

* [Verilog-Major-Projects](#Verilog-Major-Projects)
    * [EVM](#EVM)
    * [REAL-TIME-CLOCK](#REAL-TIME-CLOCK)

* [Verilog-Questions](#Verilog-Questions)
    * [Dlock](#Dlock)

* [Misc](#Misc)
* [Verilog-Installation](#Verilog-Installation)
* [Credits](#Credits)
* [Contributing](#Contributing)
* [Contact-Info](#Contact-Info)
* [License](#License)

## Verilog-Topics
### Verilog-HDL-Syntax-And-Semantics
### Gate-Level-Modeling
### User-Defined-Primitives
### Verilog-Operators
### Verilog-Behavioral-Modeling
### Procedural-Timing-Control
### Task-And-Functions
### System-Task-And-Function
### Writing-TestBenches
### Modeling-Memories-And-FSM
### Parameterized-Modules
### Compiler-Directives
    
    
## Verilog-Mini-Projects
### Combinational-Circuit
#### HALF-ADDER
#### FULL-ADDER
#### 2x1-MUX
#### 4x1-MULTIPLXER
#### 4x1-MUX-USING-2x1-MUX
#### 2-BIT-MULTIPLIER
#### 4-BIT-MULTIPLIER-USING-FULL-AND-HALF-ADDER
#### 4-BIT-MULTIPLIER-USING-2-BIT-MULTIPLIER
#### 1x4-DEMUX
#### 8x3-ENCODER
#### PRIORITY-ENCODER
#### 3x8-DECODER
#### SYNTHESIS-OF-2:4-DECODER

### Sequential-Circuit
#### SR-FLIP-FLOP
#### JK-FLIP-FLOP
#### D-FLIP-FLOP
#### T-FLIP-FLOP
#### UP-COUNTER
#### DOWN-COUNTER
#### UP-DOWN-COUNTER
#### 4-BIT-SYNCHRONOUS-COUNTER
#### 4-BIT-ASYNCHRONOUS-COUNTER
#### FSM-MELAY-1010
#### FSM-MOORE-1010 
#### N-BIT-SERIAL-ADDER
#### N-BIT-BINARY-TO-GRAY-CODE-CONVERTER
#### SINGLE-PORT-RAM
#### DUAL-PORT-RAM
#### ROM

## Verilog-Major-Projects
### EVM
### REAL-TIME-CLOCK

## Verilog-Questions
### Dlock
**Question: ** *It is required to implement a digital lock that will accept a specific bit sequence “110100” through an input button “b_in” serially in synchronism with the negative edge of an input clock "clk" and will generate an “unlock” signal “1” as output; for any other bit sequence the “unlock” signal will remain at logic “0”. An active low “clear” signal is used to asynchronously reset the lock in its initial/default state. Write a Verilog module to implement the specification as per the following template: module dlock (unlock, b_in, clear, clk);*
**Solution**
**Main Module of Dlock**
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
 
 **Test bench of Dlock**
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
                        // nanoseconds, ps precision

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

 
Note: I'm beginner please suggest any improvement :grin:

## Misc

## Verilog-Installation
There are various software to work in verilog. Three software are mentioned here:
* ModelSim PE Student Edition - Mentor Graphics
* ISE Design Suite - Xilinx
* Intel Quartus Prime - Intel

### Installation Process of ModelSim PE Student Edition (Mentor Graphics)

1. Download the latest ModelSim PE Student Edition from [here](https://www.mentor.com/products/request?&fmpath=/company/higher_ed/modelsim-student-edition-eval&id=c3694f2b-35f0-48a7-bdcd-efd77417ded0)

**Please note:** You must be logged in as the administrator on the computer you are installing ModelSim PE Student Edition.
 
2. **Install the Software**

* After the file downloads completely, double-click on the .exe file to begin the installation process.
* You must agree to the Mentor Graphics End-User License agreement during installation to continue.

3. **Complete the License Request Form**

* At the end of the installation process, select Finish and a browser window will open with the License Request form

**Please note** - clicking on an existing license request link from your browser bookmark or from a link posted on the web - WILL NOT WORK.

* Complete the all of the form fields with attention to the email address field and submit the license request form.
* Once your request has been received the ModelSim PE Student Edition license file will be generated, matched to your host computer and will be emailed to you along with license installation instructions.
Please note - the license.dat file email could get reside in your Spam or Junk mail folder. If you do not receive the email within a few minutes, check your spam folder or email provider.
* If you do not receive your license.dat file email - You will need to rerun the installation sequence and request a new license file. This is an automated process. We are unable to manually generate a license file for you.

2. **Important Information about your Installation**

* License files are valid only for the current installation of the software on the computer on which the software is installed.
* If you need to re-install the software on a computer, you are encouraged to download the latest release and corresponding license file.
* If for any reason you need a new license file - you must go through the entire process of download, installation and license request.

## Credits

## Contributing

Contributions are welcome!  For bug reports or requests please [submit an issue](https://github.com/Yaduvanshi05Bhupendra/Verilog/issues).

## Contact-Info

Feel free to contact me to discuss any issues, questions, or comments.

* Email: [Yaduvanshi05Bhupendra@gmail.com](mailto:Yaduvanshi05Bhupendra@gmail.com)
* GitHub: [Bhupendra Kumar Yadav](https://github.com/Yaduvanshi05Bhupendra)
* LinkedIn: [Bhupendra Kumar Yadav](https://www.linkedin.com/in/yaduvanshi05bhupendra)

## Licence

This repository contains a variety of content; developed by Bhupendra Kumar Yadav, and some from third-parties.  The third-party content is distributed under the license provided by those parties.

The content developed by Bhupendra Kumar Yadav is distributed under the following license:

*I am providing code and resources in this repository to you under an open source license.*

    Copyright 2015 Bhupendra Kumar Yadav

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
