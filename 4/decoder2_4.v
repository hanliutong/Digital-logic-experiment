module decoder2_4(s,out1,out2,out3,out4);//创建一名为“decoder2_4”的模块
input [1:0]s;//定义s为2位长度的输入变量
output reg out1,out2,out3,out4;//定义out1-out4为1位长度的reg型的输出变量
always @(s)//每当s发生变化时
begin
out1=1'b1;
out2=1'b1;
out3=1'b1;
out4=1'b1;//out1-out4均置为1
	case(s)//根据真值表列出各个状态对应的输出
	2'b00:out1=1'b0;//当输入00时，out1有效
	2'b01:out2=1'b0;//当输入01时，out2有效
	2'b10:out3=1'b0;//当输入10时，out3有效
	2'b11:out4=1'b0;//当输入11时，out4有效
	endcase
end
endmodule
	