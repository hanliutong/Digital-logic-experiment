module Flag(Din0,Din1,Din2,Din3,Din4,Din5,Din6,Din7,Flag);
input [7:0] Din0,Din1,Din2,Din3,Din4,Din5,Din6,Din7;
output reg [7:0]Flag;


always @ (Din0 or Din1 or Din2 or Din3 or Din4 or Din5 or Din6 or Din7)
	begin
	Flag = 8'b01111111;
	if (Din1==Din0) Flag[1]=0;
	if (Din2==Din0) Flag[2]=0;
	if (Din3==Din0) Flag[3]=0;
	if (Din4==Din0) Flag[4]=0;
	if (Din5==Din0) Flag[5]=0;
	if (Din6==Din0) Flag[6]=0;
	if (Din7==Din0) Flag[7]=0;
	end
endmodule
