module BCDplus(A,B,C,co);//创建一个名为BCDplus的模块
input [3:0] A,B;//定义A，B为四位长度的输入变量
output reg [3:0] C;//定义C为reg型的4位长度的输出变量
reg [4:0] c;//定义c位5位长度的reg型变量
output reg co;//定义co位reg型的1位长度的输出变量，表示进位
always @(A or B)//当A或B发生变化时
begin 
	if ((A>4'b1001)|(B>4'b1001)) //如果A或B大于1001（9），即输入为非法码
		begin//使得输出C为一个非法码，进位c为0
		C=4'b1111;
		co=1'b0;
		end
	else//若输入合法
		begin
		c=A+B;//令c为A与B的和
			if (c>=5'b01010)//如果加和结果大于等于10，
				begin//执行+6修正
				c=c+5'b00110;
				end
				else;	//如果加和结果不大于10，不进行修正
		C=c[3:0];//输出变量C为c的第1到第4位
		co=c[4];	//输出变量co（进位）为c的第5位	
		end
end
endmodule
