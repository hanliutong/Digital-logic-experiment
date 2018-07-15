module shifting_register(Clk,Din,Mode,Drc,Num,Dout);
input Clk;//时钟信号
input [7:0]Din;//输入的8位2进制数
input [2:0]Num;//需要移动的位数
input Drc;//移动方向：0左1右
input [1:0]Mode;//工作模式：00逻辑；01算数；10循环；11扭环；
output reg [7:0]Dout;//移动后的8位2进制数
reg [2:0]count;//计数器
reg [7:0]state,NX_state;//现态、次态
always @ (posedge Clk)
begin
	if(count==0)state=Din;
	begin
	if(count < Num)
		begin
		count <= count + 1;
		case ({Drc,Mode})
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
	else
		begin
		NX_state=state;
		count <= 0;
		end
	end
end

always @ (NX_state)
begin
	Dout=NX_state;
end
	
endmodule

