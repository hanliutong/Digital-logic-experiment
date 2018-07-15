module register8(CP,F,MODE,Din,Dout,ZERO);
	input CP,F,MODE;
	input [7:0]Din;
	output reg [7:0]Dout;
	output reg ZERO;
	reg [7:0]R=00000000;
	always @ (posedge CP)
	begin
		begin
		if ((F == 0)&&(MODE == 0)) R=Din;
		else Dout=R;
		end
		begin
		if (R == 00000000) ZERO=1'b1;
		else ZERO=1'b0;
		end
	end
		
endmodule	