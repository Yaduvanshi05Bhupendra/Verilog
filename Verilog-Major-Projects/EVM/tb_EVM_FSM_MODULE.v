module tb_EVM_FSM_MODULE ();

reg clk;
reg reset;
reg control;
reg mode;
reg push1, push2, push3, push4;
reg voter_eligible;
reg officer_id_status;
wire status_led;
wire [1:0] incr_party_vote;

EVM_FSM_MODULE uut (.clk(clk), 
                    .reset(reset), 
                    .control(control), 
                    .mode(mode), 
                    .push1(push1), 
                    .push(push2), 
                    .push3(push3), 
                    .push4(push4), 
                    .voter_eligible(voter_eligible), 
                    .officer_id_status(officer_id_status), 
                    .status_led(status_led), 
                    .incr_party_vote(incr_party_vote)
                    );

initial begin
clk           = 1'b0;
mode          = 1'b1;
control       = 1'b1;
reset         = 1'b0;
forever #5 clk= ~clk;
end

initial begin
voter_eligible   =1'b1; 
officer_id_status=1'b1;

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
$monitor ($time, "_push1=%b", push1,
                 "_push2=%b", push2,
                 "_push3=%b", push3,
                 "_push4=%b", push4,
                 "_voter_eligible=%b", voter_eligible,
                 "_officer_id_status=%b", officer_id_status,
                 "_status_led=%b", status_led,
                 "_incr_party_vote=%b", incr_party_vote
         );
end

endmodule