module DATABASE_ID_MODULE 
#(
parameter 	WORD_SIZE = 5,
		ADDRESS_SIZE = 4
)
(
input clk, mode, control, read_enable, 
input [WORD_SIZE-1:0] officer_id, voter_id, reset_id, 
output reg voter_id_status, reset_id_status, officer_id_status, write,
output reg [ADDRESS_SIZE-1:0] valid_voter_address,
output reg [WORD_SIZE-1:0] valid_voter  //voter with valid id will be send to ram memory
);

reg [WORD_SIZE-1:0] mem_officer_id [1:0];
reg [WORD_SIZE-1:0] mem_voter_id [2**ADDRESS_SIZE-1:0];

//storing officer id and reset id 
always @(*)
begin
mem_officer_id[0] = 5'b11111; //officer id
mem_officer_id[1] = 5'b11110; // reset id
end

//storing voter id
always @(*)
begin
mem_voter_id[0] <= 5'b00000;
mem_voter_id[1] <= 5'b00001;
mem_voter_id[2] <= 5'b00010;
mem_voter_id[3] <= 5'b00011;
mem_voter_id[4] <= 5'b00100;
mem_voter_id[5] <= 5'b00101;
mem_voter_id[6] <= 5'b00110;
mem_voter_id[7] <= 5'b00111;
mem_voter_id[8] <= 5'b01000;
mem_voter_id[9] <= 5'b01001;
mem_voter_id[10] <= 5'b01010;
mem_voter_id[11] <= 5'b01011;
mem_voter_id[12] <= 5'b01100;
mem_voter_id[13] <= 5'b01101;
mem_voter_id[14] <= 5'b01110;
end

//Verifing officer and reset id
always @(*)
begin
if ( mode==1'b1 && control == 1'b1)
begin
	officer_id_status <= (mem_officer_id[0] == officer_id) ? 1'b1 : 1'b0;

	reset_id_status <= (mem_officer_id[1] == reset_id) ? 1'b1 : 1'b0;
end
end

//verifing voter id and sending voter id and it address to ram to store it
always@(*)
begin
	if ( mode==1'b1 && control == 1'b1)
	begin
			if(mem_voter_id[0] == voter_id)
			begin
				voter_id_status <= 1'b1;
				valid_voter <= voter_id;
				valid_voter_address <= 0;
				write <= 1'b1;
			end
			else if(mem_voter_id[1] == voter_id)
			begin
				voter_id_status <= 1'b1;
				valid_voter <= voter_id;
				valid_voter_address <= 1;
				write <= 1'b1;
			end
			else if(mem_voter_id[2] == voter_id)
			begin
				voter_id_status <= 1'b1;
				valid_voter <= voter_id;
				valid_voter_address <= 2;
				write <= 1'b1;
			end
			else if(mem_voter_id[3] == voter_id)
			begin
				voter_id_status <= 1'b1;
				valid_voter <= voter_id;
				valid_voter_address <= 3;
				write <= 1'b1;
			end
			else if(mem_voter_id[4] == voter_id)
			begin
				voter_id_status <= 1'b1;
				valid_voter <= voter_id;
				valid_voter_address <= 4;
				write <= 1'b1;
			end
			else if(mem_voter_id[5] == voter_id)
			begin
				voter_id_status <= 1'b1;
				valid_voter <= voter_id;
				valid_voter_address <= 5;
				write <= 1'b1;
			end
			else if(mem_voter_id[6] == voter_id)
			begin
				voter_id_status <= 1'b1;
				valid_voter <= voter_id;
				valid_voter_address <= 6;
				write <= 1'b1;
			end
			else if(mem_voter_id[7] == voter_id)
			begin
				voter_id_status <= 1'b1;
				valid_voter <= voter_id;
				valid_voter_address <= 7;
				write <= 1'b1;
			end
			else if(mem_voter_id[8] == voter_id)
			begin
				voter_id_status <= 1'b1;
				valid_voter <= voter_id;
				valid_voter_address <= 8;
				write <= 1'b1;
			end
			else if(mem_voter_id[9] == voter_id)
			begin
				voter_id_status <= 1'b1;
				valid_voter <= voter_id;
				valid_voter_address <= 9;
				write <= 1'b1;
			end
			else if(mem_voter_id[10] == voter_id)
			begin
				voter_id_status <= 1'b1;
				valid_voter <= voter_id;
				valid_voter_address <= 10;
				write <= 1'b1;
			end
			else if(mem_voter_id[11] == voter_id)
			begin
				voter_id_status <= 1'b1;
				valid_voter <= voter_id;
				valid_voter_address <= 11;
				write <= 1'b1;
			end
			else if(mem_voter_id[12] == voter_id)
			begin
				voter_id_status <= 1'b1;
				valid_voter <= voter_id;
				valid_voter_address <= 12;
				write <= 1'b1;
			end
			else if(mem_voter_id[13] == voter_id)
			begin
				voter_id_status <= 1'b1;
				valid_voter <= voter_id;
				valid_voter_address <= 13;
				write <= 1'b1;
			end
			else if(mem_voter_id[14] == voter_id)
			begin
				voter_id_status <= 1'b1;
				valid_voter <= voter_id;
				valid_voter_address <= 14;
				write <= 1'b1;
			end
			else if(mem_voter_id[15] == voter_id)
			begin
				voter_id_status <= 1'b1;
				valid_voter <= voter_id;
				valid_voter_address <= 15;
				write <= 1'b1;
			end
			else
			begin
				voter_id_status <= 1'b0;
				valid_voter <= 5'bx;
				valid_voter_address <= 4'bx;
				write <= 1'bx;
			end
	end
end
endmodule