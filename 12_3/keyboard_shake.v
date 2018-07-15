module keyboard_shake(clk,F_IN,F_OUT);
input clk,F_IN;
output reg F_OUT;

parameter S0=0,S1=1,S2=2,S3=3;
reg [1:0]state;

always @ (state)
begin
	if (state==S3) F_OUT=1'b0;
	else F_OUT=1'b1;
end

always @ (posedge clk)
begin
	if (F_IN == 1'b0)
		begin
		case (state)
			S0:state<=S1;
			S1:state<=S2;
			S2:state<=S3;
			S3:state<=S3;
			default:state<=S0;
		endcase
		end
	else
		begin
		case (state)
			S0:state<=S0;
			S1:state<=S0;
			S2:state<=S0;
			S3:state<=S0;
			default:state<=S0;
		endcase
		end
end
endmodule
		