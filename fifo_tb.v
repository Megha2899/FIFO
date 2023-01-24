`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.01.2023 23:35:42
// Design Name: 
// Module Name: fifo_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fifo_tb;
 reg Clk ,WR,EN,Rst,RD,WR,EN,Rst;
 reg [31:0] dataIn;

 wire [31:0] dataOut;
 wire EMPTY;
 wire FULL;

 

 FIFO dut ( .Clk(Clk),  .dataIn(dataIn), .RD(RD),  .WR(WR),  
 .EN(EN),  .dataOut(dataOut),  .Rst(Rst),  .EMPTY(EMPTY), .FULL(FULL));



 initial begin

  Clk  = 1'b0;
   dataIn  = 32'h0;
   RD  = 1'b0;
   WR  = 1'b0;
   EN  = 1'b0;
 Rst  = 1'b1;
#100;        
EN  = 1'b1; Rst  = 1'b1;
#20;
Rst  = 1'b0;  WR  = 1'b1; dataIn  = 32'h0;
#20;
 dataIn  = 32'h1;
#20;
  dataIn  = 32'h2;
#20;
 dataIn  = 32'h3;

  #20;
dataIn  = 32'h4;

  #20;
 WR = 1'b0;
RD = 1'b1;  
end 

   always #10 Clk = ~Clk;    


endmodule
