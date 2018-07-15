module shifting_register(Clk,Din,Mode,Drc,Num,Dout);
input Clk;//时钟信号
input [7:0]Din;//输入的8位2进制数
input [2:0]Num;//需要移动的位数
input Drc;//移动方向：0左1右
input [1:0]Mode;//工作模式：00逻辑；01算数；10循环；11扭环；
output reg [7:0]Dout;//移动后的8位2进制数
reg [2:0]count;//计数器
reg [7:0]state;//状态寄存器，存储每次移位的过程
always @ (posedge Clk) //敏感事件：时钟上升沿到来
begin
	if(count==0)state=Din;//如果计数器为0，则把输入的8位二进制数赋给现态
	begin
	if(count < Num)//移动次数（计数器）小于需要移动的位数（Num）
		begin
		count <= count + 1;//移动次数加一（计数器加一）
		case ({Drc,Mode})//根据输入执行对应的功能
		3'b000: state<={state[6:0],1'b0};			//逻辑左移
		3'b001: state<={state[6:0],1'b0};			//算数左移
		3'b010: state<={state[6:0],state[7]};		//循环左移
		3'b011: state<={state[6:0],(!state[7])};	//扭环左移
		3'b100: state<={1'b0,state[7:1]};			//逻辑右移
		3'b101: state<={state[7],state[7:1]};		//算数右移
		3'b110: state<={state[0],state[7:1]};		//循环右移
		3'b111: state<={(!state[0]),state[7:1]};	//扭环右移
		default:state<=8'b10101010;
		endcase
		end
	else//当移动次数等于目标移位位数时（只有当计数器记满需要移动的位数后才会进入）
		begin
		Dout=state;//现态值（移位完成的8位二进制数字）赋给输出（Dout） 
		count <= 0;//清零计数器（随后将会读入Din的值）
		end
	end
end
endmodule

