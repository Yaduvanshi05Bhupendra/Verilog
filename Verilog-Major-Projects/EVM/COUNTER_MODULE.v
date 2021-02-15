////////////////////////////////////////////////////////////////
// Copyright (c) Bhupendra Kumar Yadav                        //
// -----------------------------------------------------------//
// FILE NAME: COUNTER_MODULE.v                                //
// TYPE: module                                               //
// PROJECT: Electronic Voting Machine (EVM)                   //
// AUTHOR: Bhupendra Kumar Yadav                              //
// AUTHOR'S EMAIL: Yaduvanshi05bhupendra@gmail.com            //
//------------------------------------------------------------//
// Release history                                            //
// VERSION DATE AUTHOR DESCRIPTION                            //
// 1.0 17/08/2020 Bhupendra Kumar Yadav                       //
// 1.1 04/02/2021 Bhupendra Kumar Yadav                       //
//------------------------------------------------------------//
// KEYWORDS: binary counter, system reset, winner             //
//------------------------------------------------------------//
// PURPOSE: Party vote counter for EVM                        //
////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////
//-------------DEFINATION OF INPUT OUTPUT PORT----------------//
//----------------INPUT---------------------------------------//
// clk:             | Clock for synchronous function          //
//------------------|-----------------------------------------//
// reset:           | Reset for FSM. FSM will not start if    //
//                  | this is low                             //
//------------------|-----------------------------------------//
// mode:            | If mode is low EVM will be in seal mode //
//                  | If control is high counter will not show//
//                  | result                                  //
//                  | Mode = 1 Input mode                     //
//                  | Mode = 0 Output mode                    //
//------------------|-----------------------------------------// 
// contorl:         | It is control by officer. Officer will  //
//                  | make it high everytime voter have to    //
//                  | caste vote. Output can only been seen if//
//                  | control and mode is low. If control is  //
//                  | high counter will not show result       //
//------------------|-----------------------------------------//
// show_result:     |When this button is pressed Output       //
//                  |(Individual vote to each party and       //
//                  |Winner) will be displayed                //
//                  |It will work along with mode and control //
//------------------|-----------------------------------------//
// system_reset:    | This will clear counter value or party  //
//                  | vote will be set to zero                //
//------------------|-----------------------------------------//
// reset_id_status: | If you want to perform reset operation  //
//                  | you this signal to be high, Officer     //
//                  | will prove this signal                  //
//------------------|-----------------------------------------//
// incr_party_vote: | This signal will tell which             //
//                  | party vote will be incremented          // 
//                  | 00: Party 1                             //
//                  | 01: Party 2                             //
//                  | 10: Party 3                             //
//                  | 11: Party 4                             //
//------------------|-----------------------------------------//
//----------------OUTPUT--------------------------------------//
// total_voting:    | Total counting of voting done by voter  //
//------------------|-----------------------------------------//
// winner:          | Which Party gain max vote. Winner among //
//                  | four party                              //
//                  | 00: Party 1                             //
//                  | 01: Party 2                             //
//                  | 10: Party 3                             //
//                  | 11: Party 4                             //
//------------------|-----------------------------------------//
// vote_party1:     | Total vote gain by party 1              //
// vote_party1:     | Total vote gain by party 2              //
// vote_party1:     | Total vote gain by party 3              //
// vote_party1:     | Total vote gain by party 4              //
////////////////////////////////////////////////////////////////

module COUNTER_MODULE 
#(
parameter VOTE_LIMIT = 6                      // one party can get 2**6=64 vote only
)
(input clk,                        
 input reset,                     
 input mode,                       
 input control, 
 input show_result,
 input system_reset,          
 input reset_id_status,       
 input [1:0] incr_party_vote, 
 output reg [1:0] winner,
 output reg [VOTE_LIMIT+2:0] total_voting,
 output reg [VOTE_LIMIT-1:0] vote_party1, 
 output reg [VOTE_LIMIT-1:0] vote_party2, 
 output reg [VOTE_LIMIT-1:0] vote_party3, 
 output reg [VOTE_LIMIT-1:0] vote_party4
);

reg [VOTE_LIMIT-1:0] party1 = 0;                  //register to store vote of party 1
reg [VOTE_LIMIT-1:0] party2 = 0;                  //register to store vote of party 1
reg [VOTE_LIMIT-1:0] party3 = 0;                  //register to store vote of party 1
reg [VOTE_LIMIT-1:0] party4 = 0;                  //register to store vote of party 1

always @(posedge clk)
begin
   if ( mode==1'b1 && control == 1'b1)    // If mode is in input mode and officer has done
   begin                                  // control signal high
      if (incr_party_vote==2'b00)
         party1 <= party1 + 6'd1;         //incrementing party 1 vote

      else if (incr_party_vote==2'b01)
         party2 <= party2 + 6'd1;         //incrementing party 2 vote

      else if (incr_party_vote==2'b10)
         party3 <= party3 + 6'd1;         //incrementing party 3 vote

      else if (incr_party_vote==2'b11)
         party4 <= party4 + 6'd1;         //incrementing party 4 vote
   end 
   else                                   // If control is zero than no increment in vote
   begin
         party1 <= party1 + 6'd0;         //incrementing party 1 vote
         party2 <= party2 + 6'd0;         //incrementing party 2 vote
         party3 <= party3 + 6'd0;         //incrementing party 3 vote
         party4 <= party4 + 6'd0;         //incrementing party 4 vote  
   end
end

// This block will count vote to each party , total vote and winner

always@(posedge clk)
begin
   if ( mode==1'b0 && control == 1'b0 && show_result == 1'b1) // When this condition will meet then 
      begin                                                   // only party vote will assigned to output
         vote_party1 <= party1;                               // when show_result is high put value of party1 into vote_party1
         vote_party2 <= party2;
         vote_party3 <= party3;
         vote_party4 <= party4;
		 
         if (party1 > party2 && party1 > party3 && party1 > party4) // Checkig if party1 is winner
            winner <= 2'b00;
         else if (party2 > party3 && party2 > party4)               // Checkig if party2 is winner
            winner <= 2'b01;
         else if (party3 > party4)                                  // Checkig if party3 is winner
            winner <= 2'b10;
         else                                                       // else party4 is winner
            winner <= 2'b11;

            total_voting <= (vote_party1 + vote_party2 + vote_party3 + vote_party4); // Counting of total vote
      end
   else if (system_reset == 1'b1 && reset_id_status == 1'b1) // Setting all value to zero when system reset is done
   begin	
      vote_party1 <= 5'b00000;
      vote_party2 <= 5'b00000;
      vote_party3 <= 5'b00000;
      vote_party4 <= 5'b00000;
      winner      <= 2'bx;
   end
	else                                                       // If mode and control value are different then all
	begin                                                      // data will be deleated
      vote_party1 <= 5'bxxxxx;
      vote_party2 <= 5'bxxxxx;
      vote_party3 <= 5'bxxxxx;
      vote_party4 <= 5'bxxxxx;
      winner      <= 2'bx;
	end
end 

endmodule 