module tb_EVM_TOP_MODULE ();

reg clk;
reg reset;
reg control;
reg mode;
reg system_reset; 
reg read_enable;
reg push1, push2, push3, push4;
reg show_result;
reg [4:0] voter_id;
reg [4:0] reset_id;
reg [4:0] officer_id;

wire status_led; 
wire [1:0] winner;
wire [7:0] total_voting;
wire [5:0] vote_party1;
wire [5:0] vote_party2;
wire [5:0] vote_party3;
wire [5:0] vote_party4;

EVM_TOP_MODULE uut (.clk(clk), 
                    .reset(reset), 
                    .control(control), 
                    .mode(mode), 
                    .system_reset(system_reset), 
                    .read_enable(read_enable), 
                    .push1(push1), 
                    .push2(push2), 
                    .push3(push3), 
                    .push4(push4), 
                    .show_result(show_result), 
                    .voter_id(voter_id),
                    .reset_id(reset_id), 
                    .officer_id(officer_id), 
                    .status_led(status_led), 
                    .winner(winner), 
                    .total_voting(total_voting),
                    .vote_party1(vote_party1), 
                    .vote_party2(vote_party2), 
                    .vote_party3(vote_party3), 
                    .vote_party4(vote_party4)
                    );

initial begin
clk          = 1'b0;
mode         = 1'b1;
control      = 1'b1;
reset        = 1'b0;
system_reset = 1'b0;
read_enable  = 1'b1;
end
always #5 clk= ~clk;


initial begin
#10 officer_id = 5'b11111;

#10 voter_id = 5'b00001;
#10 push1=1'b1; push2=1'bx; push3=1'bx; push4=1'bx;

#10 voter_id = 5'b00010;
#10 push1=1'bx; push2=1'b1; push3=1'bx; push4=1'bx;

#10 voter_id = 5'b00011;
#10 push1=1'bx; push2=1'bx; push3=1'b1; push4=1'bx;

#10 voter_id = 5'b00100;
#10 push1=1'bx; push2=1'bx; push3=1'bx; push4=1'b1;

#10 voter_id = 5'b00101;
#10 push1=1'b1; push2=1'bx; push3=1'bx; push4=1'bx;

#10 voter_id = 5'b00110;
#10 push1=1'bx; push2=1'bx; push3=1'bx; push4=1'b1;

#10 voter_id = 5'b00111;
#10 push1=1'b1; push2=1'bx; push3=1'bx; push4=1'bx;

#10 voter_id = 5'b01001;
#10 push1=1'b1; push2=1'bx; push3=1'bx; push4=1'bx;

#10 push1=1'bx; push2=1'bx; push3=1'bx; push4=1'bx;
#10 mode=1'b0; control=1'b0; show_result = 1'b1;

#10 reset_id = 5'b00000;
#10 system_reset=1'b1; 

#10 reset_id = 5'b11110;
#10 system_reset=1'b1;
end

initial begin
$monitor ($time, "  officer_id: %b", officer_id,
                 "  voter_id: %b", voter_id,
		 "  push1: %b", push1,
		 "  push2: %b", push2,
		 "  push3: %b", push3,
		 "  push4: %b", push4,
		 "  show_result: %b", show_result,
		 "  status_led: %b", status_led,
		 "  vote_party1: %b", vote_party1,
		 "  vote_party2: %b", vote_party2,
		 "  vote_party3: %b", vote_party3,
		 "  vote_party4: %b", vote_party4,
		 "  winner: %b", winner,
		 "  total_voting: %b", total_voting 
	);
end

initial begin
#500 $stop;
end

endmodule 