`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/24 14:43:11
// Design Name: 
// Module Name: RAM
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


module RAM(clk,sw,lw,address,MemDin, MemDout);
input  wire clk,sw,lw;
input  wire [31:0]address,MemDin;
output wire [31:0]MemDout;
reg   [31:0]ram[0:1023];
integer i;
assign MemDout=ram[(address[11:2])];

initial
begin
    for(i=0;i<1024;i=i+1)
    ram[i]<=0;
end

always@(posedge clk)
begin 
    if(sw)
    begin 
        ram[(address[11:2])]<=MemDin;
    end
end

endmodule
