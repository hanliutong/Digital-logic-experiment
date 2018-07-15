module adder8 (in1,in2,in3,in4,in5,in6,in7,in8,cnt,Aen,clk);
input in1,in2,in3,in4,in5,in6,in7,in8,clk,Aen;
output reg [2:0]cnt;
reg [2:0]sum;

always @(posedge clk)
begin//计算有效值个数
sum = (3'b111-(in1+in2+in3+in4+in5+in6+in7+in8));
if (Aen == 1)//如使能有效
	begin
	if (cnt<sum) cnt = cnt+1'b1;//当前值小于有效值个数
	else cnt = 0;//否则清零（回到第一个值）
	end
else cnt = 0;
end
endmodule
