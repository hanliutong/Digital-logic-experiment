module led(data,LED_sel,a,b,c,d,e,f,g,EN); //创建一个名为led的模块
	input [3:0]data; //定义一个输入变量data,为4位的二进制数
	input EN;
	output a,b,c,d,e,f,g,LED_sel; //定义输出变量 其中a-g为数码管的七段输出，LED_sel为位选信号
	reg a,b,c,d,e,f,g; //设置a-g为reg型变量
	assign LED_sel=0; //设置位选信号LED_sel为0
	always @ (data) //当输入变量data改变时启动always
		begin
			if (EN)
				{a,b,c,d,e,f,g}=7'b0000000;
			else begin
			case(data) //根据真值表，使用case语句定义各输出变量值
				4'b0000:{a,b,c,d,e,f,g}=7'b1111110;//0
				4'b0001:{a,b,c,d,e,f,g}=7'b0110000;//1
				4'b0010:{a,b,c,d,e,f,g}=7'b1101101;//2
				4'b0011:{a,b,c,d,e,f,g}=7'b1111001;//3
				4'b0100:{a,b,c,d,e,f,g}=7'b0110011;//4
				4'b0101:{a,b,c,d,e,f,g}=7'b1011011;//5
				4'b0110:{a,b,c,d,e,f,g}=7'b1011111;//6
				4'b0111:{a,b,c,d,e,f,g}=7'b1110000;//7
				4'b1000:{a,b,c,d,e,f,g}=7'b1111111;//8
				4'b1001:{a,b,c,d,e,f,g}=7'b1111011;//9
				4'b1010:{a,b,c,d,e,f,g}=7'b1110111;//A
				4'b1011:{a,b,c,d,e,f,g}=7'b0011111;//B
				4'b1100:{a,b,c,d,e,f,g}=7'b1001110;//C
				4'b1101:{a,b,c,d,e,f,g}=7'b0111101;//D
				4'b1110:{a,b,c,d,e,f,g}=7'b1001111;//E
				4'b1111:{a,b,c,d,e,f,g}=7'b1000111;//F
				default:;
			endcase
			end
		end
endmodule