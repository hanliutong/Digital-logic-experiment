module SEL9 (in1,in2,in3,in4,in5,in6,in7,in8,in9,sel,EN,out);//创建一个名为SEL8的四位8选1模块
	input EN;//定义输入变量EN（使能端）
	input [7:0]in1,in2,in3,in4,in5,in6,in7,in8,in9;//定义4位的输入变量in1和in2
	input [7:0]sel;//定义7位的输入变量sel（选择端）
	output out;//定义输出变量out
	reg [7:0]out;//输出变量设置为4位的寄存器型变量

		always @ (in1 or in2 or in3 or in4 or in5 or in6 or in7 or in8 or in9 or sel or EN) //定义敏感事件
			begin
			if (EN==1) //判断使能端是否为1（高有效）
				begin
					case (sel)//使用case语句根据真值表设置选择器的输出
					8'b11111110:out=in1;
					8'b11111101:out=in2;
					8'b11111011:out=in3;
					8'b11110111:out=in4;
					8'b11101111:out=in5;
					8'b11011111:out=in6;
					8'b10111111:out=in7;
					8'b01111111:out=in8;
					default:out=in1;
					endcase
				end
			else 
			out = in9;//如果使能端为0，则输出in9
			end
endmodule
					
					