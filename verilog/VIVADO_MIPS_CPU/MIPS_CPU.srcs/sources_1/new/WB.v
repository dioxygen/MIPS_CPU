`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/23 09:28:51
// Design Name: 
// Module Name: WB
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

module WB(clk,SyscallWB,WeWB,JalWB,LwWB,ALUoutWB,MemoutWB,PCPlus4WB,regv0,HaltWB,DinWB,Mfc0WB,DoutWB);
input  wire clk,SyscallWB,WeWB,JalWB,LwWB,Mfc0WB;
input  wire [31:0] ALUoutWB,MemoutWB,PCPlus4WB,regv0,DoutWB;
output reg  HaltWB;
output  wire [31:0]DinWB;
wire haltcome;

initial
begin
    HaltWB<=0;
end

assign DinWB=Mfc0WB?DoutWB:(JalWB?PCPlus4WB:(LwWB?MemoutWB:ALUoutWB));
assign haltcome=SyscallWB?(regv0==10):0;

always@(posedge clk)
begin
    HaltWB<=haltcome;
end
endmodule
