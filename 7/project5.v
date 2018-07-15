module project5(clk,SW,reset,sel);//创建一个名为project5的模块
parameter S0=8'b11111111,S1=8'b01111111,S2=8'b10111111,S3=8'b11011111,
S4=8'b11101111,S5=8'b11110111,S6=8'b11111011,S7=8'b11111101,S8=8'b11111110;
input clk,SW,reset;//定义clk（时钟信号p20）、SW（方向选择）、reset（重置信号）为输入变量
output reg [7:0]sel=S0;//定义sel（LED位选信号）为8位reg型输出变量

always @ (posedge clk)//当敏感事件clk上升沿到来时
begin
	if (!reset) sel<=S0;//如果reset为真，则sel复位（S0）
	else//不为真，则根据sel的当前状态，赋给其下一状态
	begin
	case(sel)//根据SW的不同，sel的下一状态也不同，具体见状态转移图
	S0:if (SW) sel<=S1;else sel<=S8;
	S1:if (SW) sel<=S2;else sel<=S8;
	S2:if (SW) sel<=S3;else sel<=S1;
	S3:if (SW) sel<=S4;else sel<=S2;
	S4:if (SW) sel<=S5;else sel<=S3;
	S5:if (SW) sel<=S6;else sel<=S4;
	S6:if (SW) sel<=S7;else sel<=S5;
	S7:if (SW) sel<=S8;else sel<=S6;
	S8:if (SW) sel<=S1;else sel<=S7;
	default:sel<=S0;
	endcase
	end
end
endmodule
