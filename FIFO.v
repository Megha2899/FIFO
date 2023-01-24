`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.01.2023 23:15:40
// Design Name: 
// Module Name: FIFO
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


module FIFO( Clk, dataIn, RD, WR, EN, dataOut, Rst,EMPTY, FULL ); 
input  Clk,  RD,  WR,  EN,  Rst;
output  EMPTY,  FULL;
input   [31:0]    dataIn;
output reg [31:0] dataOut; // internal registers 
reg [2:0]  Count = 0; 
reg [31:0] FIFO [0:7]; 
reg [2:0]  readCounter = 0, //rd counter ko 0 set kiye
           writeCounter = 0; //wr counter ko 0 set kiye
assign EMPTY = (Count==0)? 1'b1:1'b0; // agar Ct=0 to empty 1 hoga
assign FULL = (Count==8)? 1'b1:1'b0; //agar ct=8 to full 1 hoga
always @ (posedge Clk) 
begin 
 if (EN==0); 
 else begin 
  if (Rst) begin 
   readCounter = 0; 
   writeCounter = 0; 
  end 
  else if (RD ==1'b1 && Count!=0) begin //
   dataOut  = FIFO[readCounter]; 
   readCounter = readCounter+1; 
  end 
  else if (WR==1'b1 && Count<8) begin
   FIFO[writeCounter]  = dataIn; 
   writeCounter  = writeCounter+1; 
  end 
  else; 
 end 
 if (writeCounter==8) 
  writeCounter=0; 
 else if (readCounter==8) 
  readCounter=0; 
 else;
 if (readCounter > writeCounter) begin 
  Count=readCounter-writeCounter; // DS se padhna h isko!!
 end 
 else if (writeCounter > readCounter) 
  Count=writeCounter-readCounter; 
 else;
end 

endmodule
