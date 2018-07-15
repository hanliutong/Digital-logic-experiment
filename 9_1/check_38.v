module check_38(clk,din,F,state);//0011_1000序列检测器
input clk,din;//输入信号clk：时钟；输入信号din：当前输入的1位2进制数；
output reg F;//输出信号F：检测标记，低有效
//output reg [3:0]state=4'b0001;//状态机当前状态
output reg [3:0]state;
parameter s1=1,s2=2,s3=3,s4=4,s5=5,s6=6,s7=7,s8=8;
//状态转换
always @ (posedge clk)//状态转换部分敏感事件：clk上升沿
	begin
		case (state)//根据状态转换图完成的case语句
		s1:begin if (din==0) state<=s2;else state<=s1; end
		s2:begin if (din==0) state<=s3;else state<=s1; end
		s3:begin if (din==1) state<=s4;else state<=s2; end
		s4:begin if (din==1) state<=s5;else state<=s2; end
		s5:begin if (din==1) state<=s6;else state<=s2; end
		s6:begin if (din==0) state<=s7;else state<=s1; end
		s7:begin if (din==0) state<=s8;else state<=s1; end
		s8:begin if (din==0) state<=s1;end
		default:begin state<=s1; end
		endcase
	end
//输出
always @ (state)//敏感事件：state发生改变
	begin
	if ((state==s8)&&(din==0)) //如果处于状态8且当前输入为1
	F=1'b0;//低有效输出
	else F=1'b1;//否则输出1
	end
endmodule
