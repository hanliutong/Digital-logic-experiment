module Verilog1 (Clk,F,Mode,F_C);
input Clk,F;
input [1:0]Mode;
output reg F_C;
always @(Clk or F or Mode)
F_C= ((Clk&(!Mode[0]))|((Clk)&(!Mode[1]))|(F&Mode[1]&Mode[0]));
endmodule
