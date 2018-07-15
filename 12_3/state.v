module state(Fin_1up,Fin_2up,Fin_3up,Fin_2dn,Fin_3dn,Fin_4dn,Fin_1,Fin_2,Fin_3,Fin_4,clk_1KHz,c_floor,drc,t_floor,full,arrival);
input full,arrival;
input Fin_1up,Fin_2up,Fin_3up;
input Fin_2dn,Fin_3dn,Fin_4dn;
input Fin_1,Fin_2,Fin_3,Fin_4;
input [1:0]c_floor;
input clk_1KHz;
output reg [1:0]drc=2'b00;//drc-运行方向：00为等待，01上行，10下行
output reg [1:0]t_floor=2'b00;//目标层

always @ (posedge clk_1KHz)
begin
if (full)//满载情况下，只响应内部请求
	begin
		if (drc==2'b00)//当电梯等待时，跟据当前层和内部请求得到下一时刻的运行方向
		case (c_floor)
		2'b00:
			begin
				if (Fin_1==0) drc<=2'b00;
				if (Fin_2==0) drc<=2'b01;
				if (Fin_3==0) drc<=2'b01;
				if (Fin_4==0) drc<=2'b01;
			end
		2'b01:
			begin
				if (Fin_1==0) drc<=2'b10;
				if (Fin_2==0) drc<=2'b00;
				if (Fin_3==0) drc<=2'b01;
				if (Fin_4==0) drc<=2'b01;
			end
		2'b10:
			begin
				if (Fin_1==0) drc<=2'b10;
				if (Fin_2==0) drc<=2'b10;
				if (Fin_3==0) drc<=2'b00;
				if (Fin_4==0) drc<=2'b01;
			end
		2'b11:
			begin
				if (Fin_1==0) drc<=2'b10;
				if (Fin_2==0) drc<=2'b10;
				if (Fin_3==0) drc<=2'b10;
				if (Fin_4==0) drc<=2'b00;
			end
		default:drc<=2'b00;
		endcase
		
		else if (drc==2'b01)//当电梯上行时，跟据当前层和内部请求得到下一时刻的目标层；只响应比当前层更高的请求。
			case (c_floor)
			2'b00:begin //当前电梯在1层
						if (Fin_2==0) t_floor<=2'b01;//首先判断2层有无请求，若有则目标层为2层
						else if (Fin_3==0) t_floor<=2'b10;//如果2层没有请求，再判断3层有无请求，若有，则目标层为3层
						else if (Fin_4==0) t_floor<=2'b11;//如果3层没有请求，再判断4层有无请求，若有，则目标层为4层
						else begin t_floor<=2'b00; drc<=2'b00;end//若4层也没有请求，则当前电梯没有任何请求，目标层为当前层并转换为等待模式
					end
			2'b01:begin //当前电梯在2层，判断逻辑与之前一致，只是不响应1层的请求（上行仅响应比当前层更高的请求。）
						if (Fin_3==0) t_floor<=2'b10;
						else if (Fin_4==0) t_floor<=2'b11;
						else begin t_floor<=2'b01; drc<=2'b00;end
					end	
			2'b10:begin //当前电梯在3层，判断逻辑与之前一致，只是不响应1、2层的请求（上行仅响应比当前层更高的请求。）
						if (Fin_4==0) t_floor<=2'b11;
						else begin t_floor<=2'b10; drc<=2'b00;end
					end	
			2'b11:begin //当前电梯在，4层不能继续上行；目标层设为4层，进入等待模式
						begin t_floor<=2'b11; drc<=2'b00;end
					end	
			default:;
			endcase
	
		else if (drc==2'b10)//当电梯下行时，跟据当前层和内部请求得到下一时刻的目标层；只响应比当前层更低的请求。
			case (c_floor)
			2'b11:begin 
						if (Fin_3==0) t_floor<=2'b10;
						else if (Fin_2==0) t_floor<=2'b01;
						else if (Fin_1==0) t_floor<=2'b00;
						else begin t_floor<=2'b11; drc<=2'b00;end
					end
			2'b10:begin 
						if (Fin_2==0) t_floor<=2'b01;
						else if (Fin_1==0) t_floor<=2'b00;
						else begin t_floor<=2'b10; drc<=2'b00;end
					end	
			2'b01:begin 
						if (Fin_1==0) t_floor<=2'b00;
						else begin t_floor<=2'b01; drc<=2'b00;end
					end	
			2'b00:begin 
						begin t_floor<=2'b00; drc<=2'b00;end
					end	
			default:;
			endcase
		else drc<=2'b00;
	end
	
else//非满载状态
	begin
		if (drc==2'b00)//当电梯等待时，跟据当前层和请求得到下一时刻的运行方向
		case (c_floor)
		2'b00://当前电梯在1层
			begin
				if (Fin_1up==0) drc<=2'b01;
				if (Fin_2up==0) drc<=2'b01;
				if (Fin_3up==0) drc<=2'b01;
				if (Fin_2dn==0) drc<=2'b01;
				if (Fin_3dn==0) drc<=2'b01;
				if (Fin_4dn==0) drc<=2'b01;
				if (Fin_1==0) drc<=2'b00;
				if (Fin_2==0) drc<=2'b01;
				if (Fin_3==0) drc<=2'b01;
				if (Fin_4==0) drc<=2'b01;
			end
		2'b01://当前电梯在2层
			begin
			if (Fin_1up==0) drc<=2'b10;	//若存在1层上行请求，则向下运行
				if (Fin_2up==0) drc<=2'b01;//若存在2层上行请求，则向上运行
				if (Fin_3up==0) drc<=2'b01;//若存在3层上行请求，则向上运行
				if (Fin_2dn==0) drc<=2'b10;//若存在2层下行请求，则向下运行
				if (Fin_3dn==0) drc<=2'b01;//若存在3层下行请求，则向上运行
				if (Fin_4dn==0) drc<=2'b01;//若存在4层下行请求，则向上运行
				if (Fin_1==0) drc<=2'b10;	//若存在1层内部请求，则向下运行
				if (Fin_2==0) drc<=2'b00;	//若存在2层内部请求，则保持等待
				if (Fin_3==0) drc<=2'b01;	//若存在3层内部请求，则向上运行
				if (Fin_4==0) drc<=2'b01;	//若存在4层内部请求，则向上运行
			end
		2'b10://当前电梯在3层
			begin
				if (Fin_1up==0) drc<=2'b10;
				if (Fin_2up==0) drc<=2'b10;
				if (Fin_3up==0) drc<=2'b01;
				if (Fin_2dn==0) drc<=2'b10;
				if (Fin_3dn==0) drc<=2'b10;
				if (Fin_4dn==0) drc<=2'b01;
				if (Fin_1==0) drc<=2'b10;
				if (Fin_2==0) drc<=2'b10;
				if (Fin_3==0) drc<=2'b00;
				if (Fin_4==0) drc<=2'b01;
			end
		2'b11://当前电梯在4层
			begin
				if (Fin_1up==0) drc<=2'b10;
				if (Fin_2up==0) drc<=2'b10;
				if (Fin_3up==0) drc<=2'b10;
				if (Fin_2dn==0) drc<=2'b10;
				if (Fin_3dn==0) drc<=2'b10;
				if (Fin_4dn==0) drc<=2'b10;
				if (Fin_1==0) drc<=2'b10;
				if (Fin_2==0) drc<=2'b10;
				if (Fin_3==0) drc<=2'b10;
				if (Fin_4==0) drc<=2'b00;
			end
		default:drc<=2'b00;
		endcase
		
		else if (drc==2'b01)//当电梯上行时，跟据当前层和请求得到下一时刻的目标层；只响应比当前层更高的请求。
			case (c_floor)
			2'b00:begin 
						if ((Fin_2==0)|(Fin_2dn==0)|(Fin_2up==0)) t_floor<=2'b01;
						else if ((Fin_3==0)|(Fin_3dn==0)|(Fin_3up==0)) t_floor<=2'b10;
						else if ((Fin_4==0)|(Fin_4dn==0)) t_floor<=2'b11;
						else begin if (arrival==1)begin t_floor<=2'b00; drc<=2'b00;end else t_floor<=2'b00; end
					end
			2'b01:begin 
						if ((Fin_3==0)|(Fin_3dn==0)|(Fin_3up==0)) t_floor<=2'b10;
						else if ((Fin_4==0)|(Fin_4dn==0)) t_floor<=2'b11;
						else begin if (arrival==1)begin t_floor<=2'b01; drc<=2'b00;end else t_floor<=2'b01; end
					end	
			2'b10:begin 
						if ((Fin_4==0)|(Fin_4dn==0)) t_floor<=2'b11;
						else begin if (arrival)begin t_floor<=2'b10; drc<=2'b00;end else t_floor<=2'b10; end
					end	
			2'b11:begin 
						begin if (arrival)begin t_floor<=2'b11; drc<=2'b00;end else t_floor<=2'b11;end
					end	
			default:;
			endcase
	
		else if (drc==2'b10)//当电梯下行时，跟据当前层和请求得到下一时刻的目标层；只响应比当前层更低的请求。
			case (c_floor)
			2'b11:begin 
						if ((Fin_3==0)|(Fin_3dn==0)|(Fin_3up==0)) t_floor<=2'b10;
						else if ((Fin_2==0)|(Fin_2dn==0)|(Fin_2up==0)) t_floor<=2'b01;
						else if ((Fin_1==0)|(Fin_1up==0)) t_floor<=2'b00;
						else begin if (arrival)begin t_floor<=2'b11; drc<=2'b00;end else t_floor<=2'b11;end
					end
			2'b10:begin 
						if ((Fin_2==0)|(Fin_2dn==0)|(Fin_2up==0)) t_floor<=2'b01;
						else if ((Fin_1==0)|(Fin_1up==0)) t_floor<=2'b00;
						else begin if (arrival)begin t_floor<=2'b10; drc<=2'b00;end else t_floor<=2'b10; end
					end	
			2'b01:begin 
						if ((Fin_1==0)|(Fin_1up==0)) t_floor<=2'b00;
						else begin if (arrival)begin t_floor<=2'b01; drc<=2'b00;end else t_floor<=2'b01; end
					end	
			2'b00:begin 
						begin if (arrival)begin t_floor<=2'b00; drc<=2'b00;end else t_floor<=2'b00; end
					end	
			default:;
			endcase
		else drc<=2'b00;
	end
end	
endmodule
