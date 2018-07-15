//分频器
module frequency_divider(clk_50MHz,rst,clk_1KHz,clk_100Hz,clk_10Hz,clk_1Hz);
  input clk_50MHz,rst;//定义输入时钟信号、复位信号
  output reg clk_1KHz,clk_100Hz,clk_10Hz,clk_1Hz;//定义4个reg型的输出信号
  reg [31:0]cnt_1KHz,cnt_100Hz,cnt_10Hz,cnt_1Hz;//定义4个32位的reg型的寄存器
	//parameter N_1=50000000;parameter N_10=50000000;parameter N_100=50000000;parameter N_1000=50000000;
	parameter N_1=16;parameter N_10=80;parameter N_100=400;parameter N_1000=2000;
  always @ (posedge clk_50MHz)//定义输入信号的上升沿到来为敏感事件
    begin
      if (!rst) //如果复位信号为低电平，则所有计数器和输出信号都置零
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
      else//如果复位信号为高电平，则进行计数
      begin
        begin//频率1KHz，分频系数N/1000
          if (cnt_1KHz < N_1000/1000/2-1) cnt_1KHz<=cnt_1KHz+1;
          else
            begin 
              cnt_1KHz<=1'b0;//当前计数器清零
              clk_1KHz<=~clk_1KHz;//当前信号翻转
            end
        end
            
        begin//频率100Hz，分频系数N/100
          if (cnt_100Hz < N_100/100/2-1) cnt_100Hz<=cnt_100Hz+1'b1;
          else
            begin 
              cnt_100Hz<=1'b0;//当前计数器清零
              clk_100Hz<=~clk_100Hz;//当前信号翻转
            end
        end

        begin//频率10Hz，分频系数N/10
          if (cnt_10Hz < N_10/10/2-1) cnt_10Hz<=cnt_10Hz+1'b1;
          else
            begin 
              cnt_10Hz<=1'b0;//当前计数器清零
              clk_10Hz<=~clk_10Hz;//当前信号翻转
            end
        end

        begin//频率1Hz，分频系数N/1
          if (cnt_1Hz < N_1/2-1) cnt_1Hz<=cnt_1Hz+1'b1;
          else
            begin 
              cnt_1Hz<=1'b0;//当前计数器清零
              clk_1Hz<=~clk_1Hz;//当前信号翻转
            end
        end
      end
    end
endmodule
