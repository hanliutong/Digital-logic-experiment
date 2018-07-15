module floor(Fin_1up,Fin_2up,Fin_3up,Fin_2dn,Fin_3dn,Fin_4dn,
Fin_1,Fin_2,Fin_3,Fin_4,clk_1KHz,c_floor,drc,Fout_1up,Fout_2up,Fout_3up,Fout_2dn,Fout_3dn,Fout_4dn,
Fout_1,Fout_2,Fout_3,Fout_4,arrival,door,lock,err,full);
input lock,err,full;
input Fin_1up,Fin_2up,Fin_3up;
input Fin_2dn,Fin_3dn,Fin_4dn;
input Fin_1,Fin_2,Fin_3,Fin_4;
input clk_1KHz;
input [1:0]c_floor,drc;
//c_floor-当前楼层：00一层，01二层，10三层，11四层；
//drc-运行方向：00为等待，01上行，10下行
output reg Fout_1up=1,Fout_2up=1,Fout_3up=1,Fout_2dn=1,Fout_3dn=1,Fout_4dn=1,Fout_1=1,Fout_2=1,Fout_3=1,Fout_4=1;
output reg arrival=1,door=1;
reg [15:0]cnt_0=0;
reg [31:0]cnt_1=0;
reg [31:0]cnt_2=0;
reg [31:0]cnt_3=0;
reg [31:0]cnt_4=0;

always @ (posedge clk_1KHz)
begin
if (err)//故障信号，如有效则忽略所有信号，输出1层内部请求，并在电梯到达1层时立刻进入门开启状态并保持
	begin
	Fout_1up=1;Fout_2up=1;Fout_3up=1;Fout_2dn=1;Fout_3dn=1;Fout_4dn=1;Fout_1=0;Fout_2=1;Fout_3=1;Fout_4=1;
	if (c_floor==2'b00) door=0;else begin arrival=1; door=1;end
	end
else if (full)//满载信号，如有效则不响应但保留所有外部请求信号，只响应内部的请求
	begin
	if (lock)//lock为楼层变更信号，每当变更楼层时，才判断是否到达
		case (c_floor)
		2'b00:begin if (Fout_1==1'b0) begin arrival<=0;Fout_1<=1'b1;end end
		2'b01:begin if (Fout_2==1'b0) begin arrival<=0;Fout_2<=1'b1;end end
		2'b10:begin if (Fout_3==1'b0) begin arrival<=0;Fout_3<=1'b1;end end
		2'b11:begin if (Fout_4==1'b0) begin arrival<=0;Fout_4<=1'b1;end end
		endcase
	if (Fin_1up==0) Fout_1up<=0;//按键-请求保留
	if (Fin_2up==0) Fout_2up<=0;
	if (Fin_3up==0) Fout_3up<=0;
	if (Fin_2dn==0) Fout_2dn<=0;
	if (Fin_3dn==0) Fout_3dn<=0;
	if (Fin_4dn==0) Fout_4dn<=0;
	if (Fin_1==0) begin cnt_1<=cnt_1+1'b1; if (cnt_1<=1000) Fout_1<=0;else Fout_1<=1;end else cnt_1<=0;//内部按键长按超过1S-请求取消
	if (Fin_2==0) begin cnt_2<=cnt_2+1'b1; if (cnt_2<=1000) Fout_2<=0;else Fout_2<=1;end else cnt_2<=0;
	if (Fin_3==0) begin cnt_3<=cnt_3+1'b1; if (cnt_3<=1000) Fout_3<=0;else Fout_3<=1;end else cnt_3<=0;
	if (Fin_4==0) begin cnt_4<=cnt_4+1'b1; if (cnt_4<=1000) Fout_4<=0;else Fout_3<=1;end else cnt_4<=0;
	
		if (arrival==0)//如果处于到达模式（满载状态下）
		begin
		if ((cnt_0<=6000))
		begin
		case (c_floor)//消除请求，如果按键按下则一直开门
		2'b00:begin if (Fout_1==1'b0) begin begin if (cnt_0>1000)cnt_0=1000;end Fout_1<=1'b1;end end
		2'b01:begin if (Fout_2==1'b0) begin begin if (cnt_0>1000)cnt_0=1000;end Fout_2<=1'b1;end end
		2'b10:begin if (Fout_3==1'b0) begin begin if (cnt_0>1000)cnt_0=1000;end Fout_3<=1'b1;end end
		2'b11:begin if (Fout_4==1'b0) begin begin if (cnt_0>1000)cnt_0=1000;end Fout_4<=1'b1;end end
		endcase
			if (cnt_0<=1000)
				cnt_0<=cnt_0+1'b1;
			else begin//1S后开门
				door<=0;
				cnt_0<=cnt_0+1'b1;
				end
		end
		else 
		begin
			door=1;//5秒后关门
			arrival<=1;
			cnt_0=0;
		end
		end
		
	end
else if (lock||(drc==2'b00||arrival==0))//楼层变更或处于等待模式或处于到达模式
	begin
	if (arrival==1)//不处于到达模式
	begin
	case ({c_floor,drc})//根据当前层和运行方向，判断是否需要进入到达模式并清除请求
		4'b0000:begin if ((Fout_1up==1'b0)||(Fout_1==1'b0))begin arrival<=0;Fout_1up<=1'b1;Fout_1<=1'b1;end end
		4'b0001:begin if ((Fout_1up==1'b0)||(Fout_1==1'b0))begin arrival<=0;Fout_1up<=1'b1;Fout_1<=1'b1;end end
		4'b0010:begin if ((Fout_1up==1'b0)||(Fout_1==1'b0))begin arrival<=0;Fout_1up<=1'b1;Fout_1<=1'b1;end end
		4'b0100:begin if ((Fout_2up==1'b0)||(Fout_2dn==1'b0)||(Fout_2==1'b0))
			begin arrival<=0;Fout_2up<=1'b1;Fout_2dn<=1'b1;Fout_2<=1'b1;end end
		4'b0101:begin if ((Fout_2up==1'b0)||(Fout_2==1'b0))begin arrival<=0;Fout_2up<=1'b1;Fout_2<=1'b1;end end
		4'b0110:begin if ((Fout_2dn==1'b0)||(Fout_2==1'b0))begin arrival<=0;Fout_2dn<=1'b1;Fout_2<=1'b1;end end
		4'b1000:begin if ((Fout_3up==1'b0)||(Fout_3dn==1'b0)||(Fout_3==1'b0))
			begin arrival<=0;Fout_3up<=1'b1;Fout_3dn<=1'b1;Fout_3<=1'b1;end end
		4'b1001:begin if ((Fout_3up==1'b0)||(Fout_3==1'b0))begin arrival<=0;Fout_3up<=1'b1;Fout_3<=1'b1;end end
		4'b1010:begin if ((Fout_3dn==1'b0)||(Fout_3==1'b0))begin arrival<=0;Fout_3dn<=1'b1;Fout_3<=1'b1;end end
		4'b1100:begin if ((Fout_4dn==1'b0)||(Fout_4==1'b0))begin arrival<=0;Fout_4dn<=1'b1;Fout_4<=1'b1;end end
		4'b1101:begin if ((Fout_4dn==1'b0)||(Fout_4==1'b0))begin arrival<=0;Fout_4dn<=1'b1;Fout_4<=1'b1;end end
		4'b1110:begin if ((Fout_4dn==1'b0)||(Fout_4==1'b0))begin arrival<=0;Fout_4dn<=1'b1;Fout_4<=1'b1;end end
		default:arrival<=1;
	endcase
	if (Fin_1up==0) Fout_1up<=0;//按键-请求保留
	if (Fin_2up==0) Fout_2up<=0;
	if (Fin_3up==0) Fout_3up<=0;
	if (Fin_2dn==0) Fout_2dn<=0;
	if (Fin_3dn==0) Fout_3dn<=0;
	if (Fin_4dn==0) Fout_4dn<=0;
	if (Fin_1==0) begin cnt_1<=cnt_1+1'b1; if (cnt_1<=1000) Fout_1<=0;else Fout_1<=1;end else cnt_1<=0;
	if (Fin_2==0) begin cnt_2<=cnt_2+1'b1; if (cnt_2<=1000) Fout_2<=0;else Fout_2<=1;end else cnt_2<=0;
	if (Fin_3==0) begin cnt_3<=cnt_3+1'b1; if (cnt_3<=1000) Fout_3<=0;else Fout_3<=1;end else cnt_3<=0;
	if (Fin_4==0) begin cnt_4<=cnt_4+1'b1; if (cnt_4<=1000) Fout_4<=0;else Fout_3<=1;end else cnt_4<=0;
	end
	else begin//处于到达模式
	if (Fin_1up==0) Fout_1up<=0;//按键-请求保留
	if (Fin_2up==0) Fout_2up<=0;
	if (Fin_3up==0) Fout_3up<=0;
	if (Fin_2dn==0) Fout_2dn<=0;
	if (Fin_3dn==0) Fout_3dn<=0;
	if (Fin_4dn==0) Fout_4dn<=0;
	if (Fin_1==0) begin cnt_1<=cnt_1+1'b1; if (cnt_1<=1000) Fout_1<=0;else Fout_1<=1;end else cnt_1<=0;
	if (Fin_2==0) begin cnt_2<=cnt_2+1'b1; if (cnt_2<=1000) Fout_2<=0;else Fout_2<=1;end else cnt_2<=0;
	if (Fin_3==0) begin cnt_3<=cnt_3+1'b1; if (cnt_3<=1000) Fout_3<=0;else Fout_3<=1;end else cnt_3<=0;
	if (Fin_4==0) begin cnt_4<=cnt_4+1'b1; if (cnt_4<=1000) Fout_4<=0;else Fout_3<=1;end else cnt_4<=0;
	
		if (cnt_0<=6000)
		begin
			case ({c_floor,drc})//根据当前层和运行方向，判断需要清除的请求，附带保持开门功能
		4'b0000:begin if ((Fout_1up==1'b0)||(Fout_1==1'b0))begin Fout_1up<=1'b1;Fout_1<=1'b1;begin if (cnt_0>1000)cnt_0=1000;end end end
		4'b0001:begin if ((Fout_1up==1'b0)||(Fout_1==1'b0))begin Fout_1up<=1'b1;Fout_1<=1'b1;begin if (cnt_0>1000)cnt_0=1000;end end end
		4'b0010:begin if ((Fout_1up==1'b0)||(Fout_1==1'b0))begin Fout_1up<=1'b1;Fout_1<=1'b1;begin if (cnt_0>1000)cnt_0=1000;end end end
		4'b0100:begin if ((Fout_2up==1'b0)||(Fout_2dn==1'b0)||(Fout_2==1'b0))
			begin Fout_2up<=1'b1;Fout_2dn<=1'b1;Fout_2<=1'b1;begin if (cnt_0>1000)cnt_0=1000;end end end
		4'b0101:begin if ((Fout_2up==1'b0)||(Fout_2==1'b0))begin Fout_2up<=1'b1;Fout_2<=1'b1;begin if (cnt_0>1000)cnt_0=1000;end end end
		4'b0110:begin if ((Fout_2dn==1'b0)||(Fout_2==1'b0))begin Fout_2dn<=1'b1;Fout_2<=1'b1;begin if (cnt_0>1000)cnt_0=1000;end end end
		4'b1000:begin if ((Fout_3up==1'b0)||(Fout_3dn==1'b0)||(Fout_3==1'b0))
			begin Fout_3up<=1'b1;Fout_3dn<=1'b1;Fout_3<=1'b1;begin if (cnt_0>1000)cnt_0=1000;end end end
		4'b1001:begin if ((Fout_3up==1'b0)||(Fout_3==1'b0))begin Fout_3up<=1'b1;Fout_3<=1'b1;begin if (cnt_0>1000)cnt_0=1000;end end end
		4'b1010:begin if ((Fout_3dn==1'b0)||(Fout_3==1'b0))begin Fout_3dn<=1'b1;Fout_3<=1'b1;begin if (cnt_0>1000)cnt_0=1000;end end end
		4'b1100:begin if ((Fout_4dn==1'b0)||(Fout_4==1'b0))begin Fout_4dn<=1'b1;Fout_4<=1'b1;begin if (cnt_0>1000)cnt_0=1000;end end end
		4'b1101:begin if ((Fout_4dn==1'b0)||(Fout_4==1'b0))begin Fout_4dn<=1'b1;Fout_4<=1'b1;begin if (cnt_0>1000)cnt_0=1000;end end end
		4'b1110:begin if ((Fout_4dn==1'b0)||(Fout_4==1'b0))begin Fout_4dn<=1'b1;Fout_4<=1'b1;begin if (cnt_0>1000)cnt_0=1000;end end end
		default:arrival<=1;
		endcase
		
			if (cnt_0<=1000)
				cnt_0<=cnt_0+1'b1;
			else begin//一秒后开门
				door<=0;
				cnt_0<=cnt_0+1'b1;
				end
		end
		else begin//五秒后关门
			door=1;
			arrival=1;
			cnt_0=0;
		end
		end
	end
else//其他状态，记录按键
	begin
	if (Fin_1up==0) Fout_1up<=0;//按键-请求保留
	if (Fin_2up==0) Fout_2up<=0;
	if (Fin_3up==0) Fout_3up<=0;
	if (Fin_2dn==0) Fout_2dn<=0;
	if (Fin_3dn==0) Fout_3dn<=0;
	if (Fin_4dn==0) Fout_4dn<=0;
	if (Fin_1==0) begin cnt_1<=cnt_1+1'b1; if (cnt_1<=1000) Fout_1<=0;else Fout_1<=1;end else cnt_1<=0;
	if (Fin_2==0) begin cnt_2<=cnt_2+1'b1; if (cnt_2<=1000) Fout_2<=0;else Fout_2<=1;end else cnt_2<=0;
	if (Fin_3==0) begin cnt_3<=cnt_3+1'b1; if (cnt_3<=1000) Fout_3<=0;else Fout_3<=1;end else cnt_3<=0;
	if (Fin_4==0) begin cnt_4<=cnt_4+1'b1; if (cnt_4<=1000) Fout_4<=0;else Fout_3<=1;end else cnt_4<=0;
	end
end
endmodule	