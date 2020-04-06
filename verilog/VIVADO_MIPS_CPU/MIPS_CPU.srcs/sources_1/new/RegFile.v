`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/23 00:17:58
// Design Name: 
// Module Name: RegFile
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


module RegFile(clk,We,ReadReg1in,ReadReg2in,WriteReg,Din,R1,R2,rega0,regv0);
input  wire clk,We;
input  wire [4:0] ReadReg1in,ReadReg2in,WriteReg;
input  wire [31:0] Din;
output wire [31:0] R1,R2;
output wire [31:0] rega0,regv0;
reg   [31:0]regfile[0:31];
integer i;

initial
begin
    for(i=0;i<32;i=i+1)
    regfile[i]<=0;
end

assign R1=regfile[ReadReg1in];
assign R2=regfile[ReadReg2in];
assign rega0=regfile[4];
assign regv0=regfile[2];

always@(negedge clk)
begin
    if(We)
    begin
    regfile[WriteReg]<=Din;
    end
end

endmodule
