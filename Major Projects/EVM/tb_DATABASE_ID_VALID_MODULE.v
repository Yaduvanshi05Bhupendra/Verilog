module tb_DATABASE_ID_VALID_MODULE();
reg clk, reset, mode, control, read, write;
reg [4:0] valid_voter, voter_id;
reg [3:0] valid_voter_address;
wire valid_voter_id_status;

DATABASE_ID_VALID_MODULE uut 	(.clk(clk), .reset(reset), .mode(mode), .control(control), .read(read), .write(write), .valid_voter(valid_voter), 
				 .voter_id(voter_id), .valid_voter_address(valid_voter_address), .valid_voter_id_status(valid_voter_id_status));

initial begin
clk=0;
reset=1'b0;
mode=1'b1;
control=1'b1;
forever #5 clk=~clk;
end

initial begin
#10 write = 1'b1;
#10 valid_voter_address = 0; valid_voter = 5'b11011;
#10 valid_voter_address = 1; valid_voter = 5'b11110;
#10 valid_voter_address = 2; valid_voter = 5'b11100;
#10 valid_voter_address = 3; valid_voter = 5'b11000;
#10 valid_voter_address = 4; valid_voter = 5'b11001;
#10 valid_voter_address = 5; valid_voter = 5'b10000;
#10 valid_voter_address = 6; valid_voter = 5'b10001;
#10 write = 1'b0;
#10 read = 1'b1;
#10 voter_id = 5'b11011;
#10 voter_id = 5'b00010;
#10 voter_id = 5'b10010;
#10 voter_id = 5'b10110;
read=1'b0;
reset=1'b1;
#100; 
end

initial begin
	$monitor ($time, "read=%d, write=%b, valid_voter=%b, voter_id=%b, valid_voter_address=%b, valid_voter_id_status=%b",
		  read, write, valid_voter, voter_id, valid_voter_address, valid_voter_id_status);
end
initial begin
	#250 $stop;
end
endmodule 