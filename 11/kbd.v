module kbd(clk,SWC,SWR0,SWR1,SWR2,SWR3,key,key_E_4B,F);
input clk;
input [3:0]SWC;//列状态输入
output reg SWR0,SWR1,SWR2,SWR3;//行扫描信号
output reg [15:0]key=16'b1111111111111111;//16位键盘状态输出
output reg [3:0]key_E_4B;//4位键盘状态输出
output reg F;//按键状态标记输出
reg [1:0]state;
parameter S0=0,S1=1,S2=2,S3=3;
integer i,j,k,l;//for循环变量

always @ (posedge clk)//状态转换：根据CLK信号改变键盘行扫描信号
	begin
	case (state)
	S0:begin state<=S1;
		{SWR0,SWR1,SWR2,SWR3}<=4'b1011;
		end
	S1:begin state<=S2;
		{SWR0,SWR1,SWR2,SWR3}<=4'b1101;
		end
	S2:begin state<=S3;
		{SWR0,SWR1,SWR2,SWR3}<=4'b1110;
		end
	S3:begin state<=S0;
		{SWR0,SWR1,SWR2,SWR3}<=4'b0111;
		end
	default:state<=S0;
	endcase
	end

always @ (posedge clk)//按键检测
	begin
	case (state)
	S0:begin//使用for循环，在第一行为低电平时，依次检测1-4列的电平
		for (i=0;i<=3;i=i+1)//循环变量i由0-3变化
		begin
		if(SWC[i]==0)//如果某列是低电平，则对应的key值赋为0
			begin
			key[i]=1'b0;
			end 
		else key[i]=1'b1;//如果某列是高电平，则对应的key值赋为1
		end
		end
	S1:begin
		for (j=0;j<=3;j=j+1)
		begin
		if(SWC[j]==0)
			begin
			key[j+4]=1'b0;
			end 
		else key[j+4]=1'b1;
		end
		end
	S2:begin
		for (k=0;k<=3;k=k+1)
		begin
		if(SWC[k]==0)
			begin
			key[k+8]=1'b0;
			end 
		else key[k+8]=1'b1;
		end
		end
	S3:begin
		for (l=0;l<=3;l=l+1)
		begin
		if(SWC[l]==0)
			begin
			key[l+12]=1'b0;
			end 
		else key[l+12]=1'b1;
		end
		end
	default:key=16'b1111111111111111;
	endcase
	end

always @(posedge clk)//译码模块，将16位二进制码译为4位二进制码，增加输出标记F，如果当前没有按键按下则F=1；
begin
	case (key)
	16'b0111_1111_1111_1111:begin F=0; key_E_4B=4'b1111;end
	16'b1011_1111_1111_1111:begin F=0; key_E_4B=4'b1110;end
	16'b1101_1111_1111_1111:begin F=0; key_E_4B=4'b1101;end
	16'b1110_1111_1111_1111:begin F=0; key_E_4B=4'b1100;end
	16'b1111_0111_1111_1111:begin F=0; key_E_4B=4'b1011;end
	16'b1111_1011_1111_1111:begin F=0; key_E_4B=4'b1010;end
	16'b1111_1101_1111_1111:begin F=0; key_E_4B=4'b1001;end
	16'b1111_1110_1111_1111:begin F=0; key_E_4B=4'b1000;end
	16'b1111_1111_0111_1111:begin F=0; key_E_4B=4'b0111;end
	16'b1111_1111_1011_1111:begin F=0; key_E_4B=4'b0110;end
	16'b1111_1111_1101_1111:begin F=0; key_E_4B=4'b0101;end
	16'b1111_1111_1110_1111:begin F=0; key_E_4B=4'b0100;end
	16'b1111_1111_1111_0111:begin F=0; key_E_4B=4'b0011;end
	16'b1111_1111_1111_1011:begin F=0; key_E_4B=4'b0010;end
	16'b1111_1111_1111_1101:begin F=0; key_E_4B=4'b0001;end
	16'b1111_1111_1111_1110:begin F=0; key_E_4B=4'b0000;end
	16'b1111_1111_1111_1111:begin F=1; key_E_4B=key_E_4B;end//如果当前没有按键按下，4位二进制码保持前一个值不变。
	default:key_E_4B=4'b0000;//其他状态（多键按下），则为零。//可以根据需要定义某几个键同时按下时的输出情况（组合键）
	endcase
end
endmodule

	