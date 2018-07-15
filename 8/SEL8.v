module SEL8 (in1,in2,in3,in4,in5,in6,in7,in8,sel,EN,out);//创建一个名为SEL8的四位8选1模块
	input EN;//定义输入变量EN（使能端）
	input [3:0]in1,in2,in3,in4,in5,in6,in7,in8;//定义4位的输入变量in1和in2
	input [2:0]sel;//定义3位的输入变量sel（选择端）
	output out;//定义输出变量out
	reg [3:0]out;//输出变量设置为4位的寄存器型变量

		always @ (in1 or in2 or in3 or in4 or in5 or in6 or in7 or in8 or sel or EN) //定义敏感事件
			begin
			if (EN==1) //判断使能端是否为1（高有效）
				begin
					case (sel)//使用case语句根据真值表设置选择器的输出
					3'b000:out=in1;
					3'b001:out=in2;
					3'b010:out=in3;
					3'b011:out=in4;
					3'b100:out=in5;
					3'b101:out=in6;
					3'b110:out=in7;
					3'b111:out=in8;
					default:;
					endcase
				end
			else 
			out = 4'b0000;//如果使能端为0，则输出0
			end
endmodule
					
					