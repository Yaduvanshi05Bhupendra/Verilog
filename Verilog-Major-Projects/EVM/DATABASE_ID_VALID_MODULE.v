module DATABASE_ID_VALID_MODULE 
#(
parameter WORD_SIZE = 5,
          ADDRESS_SIZE = 4
)
(
input clk, 
input reset, 
input mode, 
input control, 
input read, 
input write, 
input [WORD_SIZE-1:0] valid_voter, 
input [WORD_SIZE-1:0]voter_id,
input [ADDRESS_SIZE-1:0] valid_voter_address,
output reg valid_voter_id_status
);

// read_write = 1 write      

reg [WORD_SIZE-1:0] MEM [2**ADDRESS_SIZE-1:0];

//storing valid voter id who has given vote for one time

always @(posedge clk)
begin
   if (mode==1'b1 && control==1'b1 && write==1'b1)
	   MEM[valid_voter_address] <= valid_voter;
   else if(reset==1'b1)
      begin
         MEM[0]=0; MEM[1]=0; MEM[2]=0; MEM[3]=0; MEM[4]=0; MEM[5]=0; MEM[6]=0; MEM[7]=0; 
         MEM[8]=0; MEM[9]=0; MEM[10]=0; MEM[11]=0; MEM[12]=0; MEM[13]=0; MEM[14]=0;
      end
end

//verfing if voter have given votes

always@(posedge clk)
   if ( mode==1'b1 && control == 1'b1 && read==1'b1)
   begin
	             if (MEM[0]  == voter_id) valid_voter_id_status <= 1'b1;
		else if (MEM[1]  == voter_id) valid_voter_id_status <= 1'b1;
		else if (MEM[2]  == voter_id) valid_voter_id_status <= 1'b1;
		else if (MEM[3]  == voter_id) valid_voter_id_status <= 1'b1;
		else if (MEM[4]  == voter_id) valid_voter_id_status <= 1'b1;
		else if (MEM[5]  == voter_id) valid_voter_id_status <= 1'b1;
		else if (MEM[6]  == voter_id) valid_voter_id_status <= 1'b1;
		else if (MEM[7]  == voter_id) valid_voter_id_status <= 1'b1;
		else if (MEM[8]  == voter_id) valid_voter_id_status <= 1'b1;
		else if (MEM[9]  == voter_id) valid_voter_id_status <= 1'b1;
		else if (MEM[10] == voter_id) valid_voter_id_status <= 1'b1;
		else if (MEM[11] == voter_id) valid_voter_id_status <= 1'b1;
		else if (MEM[12] == voter_id) valid_voter_id_status <= 1'b1;
		else if (MEM[13] == voter_id) valid_voter_id_status <= 1'b1;
		else if (MEM[14] == voter_id) valid_voter_id_status <= 1'b1;
		else                          valid_voter_id_status <= 1'b0;
   end

endmodule