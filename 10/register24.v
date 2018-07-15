module register24(CP,,F,MODE,min,s,ms,Dout,ZERO,RST);
	input CP,F,MODE,RST;//时钟、寄存器选择、工作模式、清零
	input [7:0]min,s,ms;//输入的数据（分、秒、毫秒）
	output reg [23:0]Dout;//输出的数据
	output reg ZERO;//0标记
	reg [23:0]R=0;//寄存器
always @ (posedge CP)
	begin
		if (RST==0) R=23'b0;//如果清零，则寄存器清零
		else
		begin
			begin//如果被选中（F=0）且工作在存入数据模式，则存入当前值
				if ((F == 0)&&(MODE == 0)) R={min,s,ms};
				else Dout=R;//否则输出当前值
			end
			begin
				if (R == 0) ZERO=1'b1;//如果寄存器位0，0标记为1
				else ZERO=1'b0;//寄存器有值，0标记为0
			end
		end
	end
endmodule	