module KS8 (clk,SW_IN,SW_OUT);
input clk;
input [7:0]SW_IN;
output [7:0]SW_OUT;
	keyboard_shake(.clk(clk),.SW_IN(SW_IN[0]),.SW_OUT(SW_OUT[0]));
	keyboard_shake(.clk(clk),.SW_IN(SW_IN[1]),.SW_OUT(SW_OUT[1]));
	keyboard_shake(.clk(clk),.SW_IN(SW_IN[2]),.SW_OUT(SW_OUT[2]));
	keyboard_shake(.clk(clk),.SW_IN(SW_IN[3]),.SW_OUT(SW_OUT[3]));
	keyboard_shake(.clk(clk),.SW_IN(SW_IN[4]),.SW_OUT(SW_OUT[4]));
	keyboard_shake(.clk(clk),.SW_IN(SW_IN[5]),.SW_OUT(SW_OUT[5]));
	keyboard_shake(.clk(clk),.SW_IN(SW_IN[6]),.SW_OUT(SW_OUT[6]));
	keyboard_shake(.clk(clk),.SW_IN(SW_IN[7]),.SW_OUT(SW_OUT[7]));
endmodule
