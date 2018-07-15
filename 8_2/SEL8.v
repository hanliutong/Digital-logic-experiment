module SEL8 (in,sel,EN,out);//创建一个名为SEL8的四位8选1模块
	input EN;//定义输入变量EN（使能端）
	input [7:0]in;
	input [2:0]sel;//定义3位的输入变量sel（选择端）
	output out;//定义输出变量out
	reg [3:0]out;//输出变量设置为4位的寄存器型变量

		always @ (in or sel or EN) //定义敏感事件
			begin
			if (EN==1) //判断使能端是否为1（高有效）
				begin
					case (sel)//使用case语句根据真值表设置选择器的输出
					3'b000:out={3'b000,in[0]};
					3'b001:out={3'b000,in[1]};
					3'b010:out={3'b000,in[2]};
					3'b011:out={3'b000,in[3]};
					3'b100:out={3'b000,in[4]};
					3'b101:out={3'b000,in[5]};
					3'b110:out={3'b000,in[6]};
					3'b111:out={3'b000,in[7]};
					default:;
					endcase
				end
			else 
			out = 4'b0000;//如果使能端为0，则输出0
			end
endmodule