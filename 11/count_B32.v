module count_B32(F,Din,cnt);
input F;
input [3:0]Din;
output reg [3:0]cnt=0;

always @ (posedge F)
begin
	if (Din==4'b1111)	begin if (cnt>0)cnt=cnt-1'b1;end
	else if (Din==4'b1110) cnt=0;
	else if (cnt<4'b1000) cnt=cnt+1'b1;
	else;
end

endmodule
	