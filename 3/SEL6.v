module SEL6 (in5,in6,sel,EN,out);//创建一个名为SEL6的四位6选1模块
	input EN;//定义输入变量EN（使能端）
	input [3:0]in5,in6;//定义4位的输入变量in5和in6
	input [2:0]sel;//定义3位的输入变量sel（选择端）
	output out;//定义输出变量out
	reg [3:0]out;//输出变量设置为4位的寄存器型变量
	//利用parameter函数对变量赋值
	parameter in1 =4'b0001;	//1
	parameter in2 =4'b0000;	//6
	parameter in3 =4'b0101;	//0
	parameter in4 =4'b0010;	//7
		always @ (in1 or in2 or in3 or in4 or in5 or in6 or sel or EN) //当输入变量改变时
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
					default:out=4'b1111;//若输入了非法码，则输出“14”，数码管将显示“E”表示错误
					endcase
				end
			else 
			out = 4'b1110;//如果使能端为0，则输出“14”，数码管将显示“E”表示错误
			end
endmodule
					
					