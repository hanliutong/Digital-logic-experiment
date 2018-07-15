module frequency_divider(clk_50MHz,rst,clk_1KHz,clk_100Hz,clk_10Hz,clk_1Hz);
	input clk_50MHz,rst;
	output reg clk_1KHz,clk_100Hz,clk_10Hz,clk_1Hz;
	reg [31:0]cnt_1KHz,cnt_100Hz,cnt_10Hz,cnt_1Hz;
	parameter N=50000000;
	//parameter N=500;
	always @ (posedge clk_50MHz)
		begin
			if (!rst) 
				begin
				clk_1KHz<=1'b0;
				clk_100Hz<=1'b0;
				clk_10Hz<=1'b0;
				clk_1Hz<=1'b0;
				cnt_1KHz<=1'b0;
				cnt_100Hz<=1'b0;
				cnt_10Hz<=1'b0;
				cnt_1Hz<=1'b0;
				end
			else
			begin
				begin
					if (cnt_1KHz < N/1000/2-1) cnt_1KHz<=cnt_1KHz+1;
					else
						begin	
							cnt_1KHz<=1'b0;
							clk_1KHz<=~clk_1KHz;
						end
				end
						
				begin
					if (cnt_100Hz < N/100/2-1) cnt_100Hz<=cnt_100Hz+1'b1;
					else
						begin	
							cnt_100Hz<=1'b0;
							clk_100Hz<=~clk_100Hz;
						end
				end

				begin
					if (cnt_10Hz < N/10/2-1) cnt_10Hz<=cnt_10Hz+1'b1;
					else
						begin	
							cnt_10Hz<=1'b0;
							clk_10Hz<=~clk_10Hz;
						end
				end

				begin
					if (cnt_1Hz < N/2-1) cnt_1Hz<=cnt_1Hz+1'b1;
					else
						begin	
							cnt_1Hz<=1'b0;
							clk_1Hz<=~clk_1Hz;
						end
				end
			end
		end
endmodule
