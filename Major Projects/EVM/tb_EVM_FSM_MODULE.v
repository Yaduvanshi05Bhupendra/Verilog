module tb_EVM_FSM_MODULE ();
reg clk, reset, control, mode, push1, push2, push3, push4, voter_eligible, officer_id_status;
wire status_led;
wire [1:0] incr_party_vote;

EVM_FSM_MODULE uut (clk, reset, control, mode, push1, push2, push3, push4, voter_eligible, officer_id_status, status_led, incr_party_vote);

initial begin
clk=1'b0;
mode=1'b1;
control=1'b1;
reset=1'b0;
forever #5 clk = ~clk;
end

initial begin
voter_eligible=1'b1; officer_id_status=1'b1;
#20 push1=1'b1; 
#20 push1=1'bx; push2=1'b1;
#20 push1=1'bx; push2=1'bx; push3=1'b1;
#20 push1=1'bx; push2=1'bx; push3=1'bx; push4=1'b1;
#20 push1=1'b1; push2=1'bx; push3=1'bx; push4=1'bx;
#20 push1=1'bx; push2=1'bx; push3=1'bx; push2=1'b1;
#20 push1=1'bx; push2=1'bx; push3=1'b1;push4=1'bx;
#20 push1=1'bx; push2=1'bx; push3=1'bx;push4=1'b1;
#20 voter_eligible=1'b0; officer_id_status=1'b1;
#20 push3=1'b1;
#20 push4=1'b1;
#20 push1=1'b1;
#100; 
end

initial begin
$monitor ($time, " push1=%b, push2=%b, push3=%b, push4=%b, voter_eligible=%b, officer_id_status=%b, status_led=%b, incr_party_vote=%b",
	push1, push2, push3, push4, voter_eligible, officer_id_status, status_led, incr_party_vote);
end
endmodule