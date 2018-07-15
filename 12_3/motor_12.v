module motor_12(t_floor,clk_1KHz,arrival,c_floor,lock);
input [1:0]t_floor;
output reg [1:0]c_floor;
output reg lock;
reg [1:0]c_floor_delay;
input clk_1KHz,arrival;
reg [15:0]cnt_3;
reg clk_3Hz;

always @ (posedge clk_1KHz)//判断是否运行，如果需要每三秒产生一个脉冲
begin
if (arrival==1)//如果当前不是“到达状态”
	begin
	if (c_floor==t_floor) cnt_3=0;//当前层=目标层，升降机不运行
	else//当前层不等于目标层，升降机需要运行，开始计数
		begin 
			if (cnt_3<3000)//未到3S时
				begin
				cnt_3=cnt_3+1'b1;//计数器+1
				clk_3Hz=0;//3Hz的脉冲信号为0
				end
			else//到3S时
				begin
				cnt_3=0;//计数器清零
				clk_3Hz=1;//产生脉冲
				end
		end
	end
	else cnt_3=0;//如果当前处于“到达状态”，升降机不运行
end

always @ (posedge clk_3Hz)//如果检测到运行脉冲
	begin
	if (c_floor<t_floor)c_floor=c_floor+1'b1;//当前层小于目标层，当前层加一（升高一层）
	else if (c_floor>t_floor)c_floor=c_floor-1'b1;//当前层大于目标层，当前层减一（降低一层）
	else c_floor=c_floor;
	end

always @ (posedge clk_1KHz)//产生楼层变更脉冲
begin
	//只要c_floor变化，则其前后状态异或运算结果为1，产生脉冲
	lock <= (c_floor[1]^c_floor_delay[1])|(c_floor[0]^c_floor_delay[0]);
	c_floor_delay <= c_floor;
end
	
endmodule
		