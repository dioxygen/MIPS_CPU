`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/23 09:28:38
// Design Name: 
// Module Name: MEM
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


module MEM( clk,LwMEM,SwMEM,ShMEM,ALUoutMEM,R2MEM, MemoutMEM,Mfc0MEM,DoutMEM,ALUoutMEMsel);
input wire clk;
input wire LwMEM,SwMEM,ShMEM,Mfc0MEM;
input wire [31:0] ALUoutMEM,R2MEM,DoutMEM;
output wire [31:0] MemoutMEM,ALUoutMEMsel;
wire HighMEM;
wire [31:0]MemAddress,MemDin;

assign HighMEM=ALUoutMEM[1];
assign MemAddress=ALUoutMEM;
assign MemDin=ShMEM?(HighMEM?({R2MEM[15:0],MemoutMEM[15:0]}):({MemoutMEM[31:16],R2MEM[15:0]})):R2MEM;
assign ALUoutMEMsel=Mfc0MEM?DoutMEM:ALUoutMEM;
RAM ram(clk,SwMEM,LwMEM,MemAddress,MemDin,MemoutMEM);

endmodule
