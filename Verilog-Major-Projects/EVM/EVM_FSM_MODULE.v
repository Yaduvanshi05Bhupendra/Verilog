module 	EVM_FSM_MODULE(input clk, 
                       input reset, 
		       input control, 
		       input mode, 
		       input push1, push2, push3, push4, 
		       input voter_eligible, 
		       input officer_id_status,
		       output reg status_led, 
		       output reg [1:0] incr_party_vote
		       );

reg [3:0] present_state;
reg [3:0] next_state;

parameter idle        = 3'b000;
parameter seal        = 3'b001;
parameter delay       = 3'b010;
parameter reset_state = 3'b011;
parameter check       = 3'b100;

always@(posedge clk or posedge reset)
begin
   if(reset==1'b1)
      present_state <= reset_state;
   else
      present_state <= next_state;
end

always@(*)
begin
   if(voter_eligible==1'b1 && officer_id_status==1'b1)
   begin
      case(present_state)
      check:  begin
              if(mode == 1'b0 && control == 1'b0)
              begin
                 next_state = check;
                 status_led = 1'b0;
	      end
	      else if(mode == 1'b1 && control == 1'b1)
                 begin
                    next_state = idle;
                    status_led = 1'b1;
	      end
	      else
                 next_state = check;
	end

idle: begin
         status_led = 1'b1;
         if(mode == 1'b0)
         begin
            next_state = seal;
         end
         else if(push1 == 1'b0 && push2 == 1'b0 && push3 == 1'b0 && push4 == 1'b0)
         begin
            next_state = idle;
            status_led = 1'b1;
         end
         else if(push1 == 1'b1)
         begin
            incr_party_vote = 2'b00;
            next_state = delay;
         end
         else if(push2 == 1'b1)
         begin
            incr_party_vote = 2'b01;
            next_state = delay;
         end
         else if(push3 == 1'b1)
         begin
            incr_party_vote = 2'b10;
            next_state = delay;
         end
         else if(push4 == 1'b1)
         begin
            incr_party_vote = 2'b11;
            next_state = delay;
         end
         else 
         begin
            incr_party_vote = 2'bxx;
            next_state = delay;
         end
         end

delay: begin
          status_led = 1'b0;
          next_state = idle;
       end

seal: next_state = seal;

default: next_state = check;
endcase
end
   else 
      incr_party_vote = 2'bxx;
end

endmodule