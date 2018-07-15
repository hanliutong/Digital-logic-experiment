module xl_generate(clk,din,clr,dout);
input clk, clr;
output reg dout;
input [7:0]din;
reg [7:0]data;
always @(posedge clk)
	begin
	if(!clr)
		begin
			dout<=0;
			data<=din;//装载
		end
	else
		begin
			dout<=data[7];
			data<={data[6:0],data[7]};
		end
		end
endmodule

