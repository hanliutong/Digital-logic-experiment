//本次实验需要使用实验台的模式2
module project7(clk_50MHz,rst,SW,reset,clk_1KHz,clk_100Hz,clk_10Hz,sel);//创建名为project7的顶层文件

//定义变量
input clk_50MHz,rst,reset,SW;//定义50MHz时钟、时钟复位信号rst、流水灯复位信号reset、流水灯方向选择信号SW为输入变量
output clk_1KHz,clk_100Hz,clk_10Hz;//定义1KHz、100Hz、10Hz的时钟信号为输出变量，连接到LED9-LED11上
output [7:0]sel;//定义流水灯位选信号sel为八位输出变量
wire clk_1Hz;//定义1Hz的时钟信号为wire型变量

//结构化描述
frequency_divider(.clk_50MHz(clk_50MHz),.rst(rst),.clk_1KHz(clk_1KHz),.clk_100Hz(clk_100Hz),.clk_10Hz(clk_10Hz),.clk_1Hz(clk_1Hz));
project5(.clk(clk_1Hz),.SW(SW),.reset(reset),.sel(sel));//clk_1Hz信号又frequency_divider（分频器）模块输出到project5（流水灯）模块
endmodule
