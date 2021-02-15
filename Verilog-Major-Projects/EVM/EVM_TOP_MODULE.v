/////////////////////////////////////////////////////
// Copyright (c) Bhupendra Kumar Yadav             //
// ------------------------------------------------//
// FILE NAME: EVM_TOP_MODULE.v                     //
// TYPE: module                                    //
// DEPARTMENT: Verilog Design with FPGA            //
// AUTHOR: Bhupendra Kumar Yadav                   //
// AUTHOR'S EMAIL: Yaduvanshi05bhupendra@gmail.com //
//-------------------------------------------------//
// Release history                                 //
// VERSION DATE AUTHOR DESCRIPTION                 //
// 1.0 03/02/2021 Bhupendra Kumar Yadav            //
//-------------------------------------------------//
// KEYWORDS: EVM, Top module, RAM, ROM, COUNTER    // 
//           FSM, SEVEN_SEGMENT, LCD               //
//-------------------------------------------------//
// PURPOSE: 16-bit binary counter                  //
/////////////////////////////////////////////////////

module EVM_TOP_MODULE
#(
parameter WORD_SIZE = 5,
          ADDRESS_SIZE = 4
)
(
input clk, 
input reset, 
input control, 
input mode, 
input system_reset, 
input read_enable, 
input push1, push2, push3, push4, 
input show_result,
input [WORD_SIZE-1:0] voter_id, 
input [WORD_SIZE-1:0] reset_id, 
input [WORD_SIZE-1:0] officer_id,
output status_led,
output [1:0] winner,
output [7:0]total_voting,
output [5:0] vote_party1, 
output [5:0] vote_party2, 
output [5:0] vote_party3, 
output [5:0] vote_party4
);

wire voter_eligible; 
wire valid_voter_id_status; 
wire read; 
wire write;  
wire voter_id_status;
wire reset_id_status;
wire officer_id_status;
wire [1:0] incr_party_vote;
wire [ADDRESS_SIZE-1:0] valid_voter_address;
wire [WORD_SIZE-1:0] valid_voter;


//Instantiating DATABASE for voter id verification
DATABASE_ID_MODULE DBI1 (.clk(clk), 
                         .mode(mode), 
                         .control(control), 
                         .read_enable(read_enable), 
                         .officer_id(officer_id),
                         .voter_id(voter_id),
                         .reset_id(reset_id), 
                         .voter_id_status(voter_id_status), 
                         .reset_id_status(reset_id_status), 
                         .officer_id_status(officer_id_status), 
                         .valid_voter(valid_voter),
                         .valid_voter_address(valid_voter_address), 
                         .write(write)
                        );

//Instantiating DATABASE for voter id verification that voter 
// has not given any votes

DATABASE_ID_VALID_MODULE DBIV1 	(.clk(clk), 
                                 .reset(reset), 
                                 .mode(mode), 
                                 .control(control), 
                                 .write(write),
                                 .read(1'b1), 
                                 .voter_id(voter_id), 
                                 .valid_voter(valid_voter), 
                                 .valid_voter_address(valid_voter_address),
                                 .valid_voter_id_status(valid_voter_id_status)
                                );
											 
and AND1(voter_eligible, voter_id_status, valid_voter_id_status);

//Instantiating FSM for voting process
EVM_FSM_MODULE FSM1 (.clk(clk), 
                     .reset(reset), 
                     .mode(mode), 
                     .control(control), 
                     .voter_eligible(voter_eligible), 
                     .officer_id_status(officer_id_status), 
                     .push1(push1), 
                     .push2(push2), 
                     .push3(push3), 
                     .push4(push4),
                     .incr_party_vote(incr_party_vote), 
                     .status_led(status_led)
                    );

//Instantiating Counter module for voting
COUNTER_MODULE CM1 (.clk(clk), 
                    .reset(reset), 
                    .mode(mode), 
                    .control(control), 
                    .show_result(show_result), 
                    .system_reset(system_reset), 
                    .reset_id_status(reset_id_status),
                    .incr_party_vote(incr_party_vote), 
                    .vote_party1(vote_party1), 
                    .vote_party2(vote_party2), 
                    .vote_party3(vote_party3), 
                    .vote_party4(vote_party4), 
                    .winner(winner),
                    .total_voting(total_voting)
                   );

endmodule