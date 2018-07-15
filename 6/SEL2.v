module SEL2 (in0,in1,sel,EN,out);//创建一个名为SEL6的四位6选1模块
	input EN;//定义输入变量EN（使能端）
	input [3:0]in0,in1;//定义4位的输入变量in0和in1
	input sel;//定义1位的输入变量sel（选择端）
	output out;//定义输出变量out
	reg [3:0]out;//输出变量设置为4位的寄存器型变量
		always @ (in0 or in1 or sel or EN) //当输入变量改变时
			begin
			if (EN==1) //判断使能端是否为1（高有效）
				begin
					case (sel)//使用case语句根据真值表设置选择器的输出
					1'b0:out=in0;
					1'b1:out=in1;
					default:out=4'b1111;//若输入了非法码，则输出“14”，数码管将显示“E”表示错误
					endcase
				end
			else 
			out = 4'b1110;//如果使能端为0，则输出“14”，数码管将显示“E”表示错误
			end
endmodule
					
					