module tb_COUNTER_MODULE();

reg clk;
reg reset;
reg mode;
reg control;
reg show_result;
reg system_reset;
reg reset_id_status;
reg [1:0]incr_party_vote;
wire [6:0] total_voting;
wire [1:0] winner;
wire [4:0] vote_party1;
wire [4:0] vote_party2;
wire [4:0] vote_party3;
wire [4:0] vote_party4;

COUNTER_MODULE uut (.clk(clk), 
                    .reset(reset), 
                    .mode(mode), 
                    .control(control), 
                    .show_result(show_result), 
                    .system_reset(system_reset), 
                    .incr_party_vote(incr_party_vote), 
                    .total_voting(total_voting), 
                    .vote_party1(vote_party1), 
                    .vote_party2(vote_party2), 
                    .vote_party3(vote_party3), 
                    .vote_party4(vote_party4), 
                    .winner(winner));

initial begin
clk             = 1'b0;
reset           = 1'b0;
mode            = 1'b1;
control         = 1'b1;
system_reset    = 1'b0;
reset_id_status = 1'b0;
incr_party_vote = 2'bxx;
forever #5 clk  = ~clk;
end

initial begin
#10 incr_party_vote=0;
#10 incr_party_vote=1;
#10 incr_party_vote=2;

#10 incr_party_vote=2;
#10 incr_party_vote=2;
#10 incr_party_vote=3;

#10 incr_party_vote=0;
#10 incr_party_vote=1;
#10 incr_party_vote=0;

#10 incr_party_vote=1;
#10 incr_party_vote=3;
#10 incr_party_vote=1;

#10 incr_party_vote=0;
#10 incr_party_vote=2;
#10 incr_party_vote=1;
#10 incr_party_vote=2;

#10 mode=1'b0; control=1'b0; show_result=1'b1;
#10 system_reset=1'b1;
#10 show_result=1'b1;
end

initial begin
$monitor ($time, "  show_result: %d", show_result,
                 "  system_reset: %d", system_reset,
                 "  incr_party_vote: %d", incr_party_vote,
                 "  total_voting: %d", total_voting,
                 "  vote_party1: %d", vote_party1,
                 "  vote_party2: %d", vote_party2,
                 "  vote_party3: %d", vote_party3,
                 "  vote_party4: %d", vote_party4,
                 "  winner: %d", winner
         );
end

endmodule