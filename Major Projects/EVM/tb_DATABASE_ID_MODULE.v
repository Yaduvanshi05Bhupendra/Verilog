module tb_DATABASE_ID_MODULE();
reg clk, mode, control, read_enable;
reg [4:0] officer_id, voter_id, reset_id;
wire voter_id_status, reset_id_status, officer_id_status, write;
wire [3:0] valid_voter_address;
wire [4:0] valid_voter;

DATABASE_ID_MODULE uut (.clk(clk), .mode(mode), .control(control), .read_enable(read_enable), .officer_id(officer_id), 
			.voter_id(voter_id), .reset_id(reset_id), 
			.voter_id_status(voter_id_status), .reset_id_status(reset_id_status), .officer_id_status(officer_id_status), 
			.valid_voter(valid_voter), .write(write), .valid_voter_address(valid_voter_address));
initial begin
clk=0;
mode=1;
control=1;
read_enable=1;
forever #10 clk=~clk;
end

initial begin
officer_id = 5'b11111;
#20 voter_id = 5'b00000;
#20 voter_id = 5'b00010;
#20 voter_id = 5'b00000;
#20 voter_id = 5'b00010;
#20 voter_id = 5'b11000;
#100;
end

initial begin
$monitor ($time, "officer_id=%b, officer_id_status=%b, reset_id=%b, reset_id_status=%b, voter_id=%b, voter_id_status=%b, valid_voter=%b, valid_voter_address=%b", 
		officer_id, officer_id_status, reset_id, reset_id_status, voter_id, voter_id_status, valid_voter, valid_voter_address);
end 

initial begin
#500 $stop;
end

endmodule