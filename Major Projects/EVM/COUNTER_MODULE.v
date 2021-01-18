module COUNTER_MODULE (
input clk, reset, mode, control, show_result, system_reset, 
input [1:0]incr_party_vote, 
output reg [7:0] total_voting,
output reg [1:0] winner,
output reg [5:0]vote_party1, vote_party2, vote_party3, vote_party4);

reg [5:0] party1=0, party2=0, party3=0, party4=0;
parameter VOTER_SIZE = 5'b11111;
parameter TOTAL_VOTER = 5'b11111;

always @(posedge clk)
begin
//incrementing party 1 vote
if (incr_party_vote==2'b00)
party1 <= party1 + 1;

//incrementing party 2 vote
else if (incr_party_vote==2'b01)
party2 <= party2 + 1;

//incrementing party 3 vote
else if (incr_party_vote==2'b10)
party3 <= party3 + 1;

//incrementing party 4 vote
else if (incr_party_vote==2'b11)
party4 <= party4 + 1;
end

//vote to each party , total vote and winner
//always @(posedge clk or posedge mode or posedge control or posedge show_result)
always@(posedge clk)
begin
if ( mode==1'b0 && control == 1'b0 && show_result == 1'b1)
begin
vote_party1 <= party1;
vote_party2 <= party2;
vote_party3 <= party3;
vote_party4 <= party4;
if (party1 > party2)
winner <= 2'b00;
else if (party2 > party3)
winner <= 2'b01;
else if (party3>party4)
winner <= 2'b10;
else
winner <= 2'b11;

total_voting <= (vote_party1 + vote_party2 + vote_party3 + vote_party4);
end
end

 /*always @(posedge clk or posedge system_reset) 
begin
if (system_reset==1'b1)
begin
 party1 <= 5'b00000;
 party2 <= 5'b00000;
 party3 <= 5'b00000;
 party4 <= 5'b00000;
 vote_party1 <= 5'b00000;
 vote_party2 <= 5'b00000;
 vote_party3 <= 5'b00000;
 vote_party4 <= 5'b00000;
 winner <= 2'bx;
end
end*/
endmodule 
