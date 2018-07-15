module shifting_register(Clk,Data,Mode,Dout0,Dout1,Dout2,Dout3,Dout4,Dout5,Dout6,Dout7,F);
input Clk,F;//时钟信号
input [3:0]Data;//输入的4位16进制数
input [1:0]Mode;//工作模式
output reg [3:0]Dout0,Dout1,Dout2,Dout3,Dout4,Dout5,Dout6,Dout7;
wire F_C;
assign F_C= ((Clk&(!Mode[0]))|((Clk)&(!Mode[1]))|(F&Mode[1]&Mode[0]));
always @ (posedge F_C)
	if (Mode == 2'b00)//清零
		begin
			Dout0	<=	4'b0000;
			Dout1	<=	4'b0000;
			Dout2	<=	4'b0000;
			Dout3	<=	4'b0000;
			Dout4	<=	4'b0000;
			Dout5	<=	4'b0000;
			Dout6	<=	4'b0000;
			Dout7	<=	4'b0000;
		end
	else if (Mode == 2'b01)//左移
		begin
			Dout7	<=	Dout6;
			Dout6	<=	Dout5;
			Dout5	<=	Dout4;
			Dout4	<=	Dout3;
			Dout3	<=	Dout2;
			Dout2	<=	Dout1;
			Dout1	<=	Dout0;
			Dout0	<=	Data;
		end
	else if (Mode == 2'b10)//右移
		begin
			Dout7	<=	Data;
			Dout6	<=	Dout7;
			Dout5	<=	Dout6;
			Dout4	<=	Dout5;
			Dout3	<=	Dout4;
			Dout2	<=	Dout3;
			Dout1	<=	Dout2;
			Dout0	<=	Dout1;
		end
	else
		begin
			Dout7	<=	Dout6;
			Dout6	<=	Dout5;
			Dout5	<=	Dout4;
			Dout4	<=	Dout3;
			Dout3	<=	Dout2;
			Dout2	<=	Dout1;
			Dout1	<=	Dout0;
			Dout0	<=	Data;
		end
endmodule
