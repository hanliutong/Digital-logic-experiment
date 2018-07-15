module led(data,LED_sel,a,b,c,d,e,f,g); //创建一个名为led的模块
	input [3:0]data; //定义一个输入变量data,为4位的二进制数
	output a,b,c,d,e,f,g,LED_sel; //定义输出变量 其中a-g为数码管的七段输出，LED_sel为位选信号
	reg a,b,c,d,e,f,g; //设置a-g为reg型变量
	assign LED_sel=0; //设置位选信号LED_sel为0
	always @ (data) //当输入变量data改变时启动always
		begin
			case(data) //根据真值表，使用case语句定义各输出变量值
				4'b0000:{a,b,c,d,e,f,g}=7'b1111110;
				4'b0001:{a,b,c,d,e,f,g}=7'b0110000;
				4'b0010:{a,b,c,d,e,f,g}=7'b1101101;
				4'b0011:{a,b,c,d,e,f,g}=7'b1111001;
				4'b0100:{a,b,c,d,e,f,g}=7'b0110011;
				4'b0101:{a,b,c,d,e,f,g}=7'b1011011;
				4'b0110:{a,b,c,d,e,f,g}=7'b1011111;
				4'b0111:{a,b,c,d,e,f,g}=7'b1110000;
				4'b1000:{a,b,c,d,e,f,g}=7'b1111111;
				4'b1001:{a,b,c,d,e,f,g}=7'b1111011;
				default:{a,b,c,d,e,f,g}=7'b1001111;//当输入其它数值时，数码管输出“E”
			endcase
		end
endmodule