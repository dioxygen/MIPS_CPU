`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/22 19:20:41
// Design Name: 
// Module Name: HazardUnit
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


module HazardUnit( clk,WriteRegEX,WriteRegMEM,R1_EX,R2_EX,LwMEM,BranchorJump, RedrectR1MEM,RedrectR2MEM,RedrectR1WB,RedrectR2WB,enable3,loaduse,clr1,clr2 );
input wire clk;
input wire [4:0] WriteRegEX,WriteRegMEM,R1_EX,R2_EX;
input wire LwMEM,BranchorJump;
output wire RedrectR1MEM,RedrectR2MEM,RedrectR1WB,RedrectR2WB,enable3,loaduse,clr1,clr2;
wire signal1,signal2,signal3,signal4;
reg  reg1,reg2;
assign signal1=(WriteRegEX==R1_EX)&(R1_EX!=0);
assign signal2=(WriteRegEX==R2_EX)&(R2_EX!=0);
assign RedrectR1MEM=signal1&(!LwMEM);
assign RedrectR2MEM=signal2&(!LwMEM);
assign RedrectR1WB=(WriteRegMEM==R1_EX)&(R1_EX!=0);
assign RedrectR2WB=(WriteRegMEM==R2_EX)&(R2_EX!=0);
assign loaduse=LwMEM&(signal1|signal2);
assign enable3=~loaduse;

always @(negedge clk)
begin 
reg1<=loaduse;
reg2<=BranchorJump&enable3;
end

assign clr1=clk&reg2;
assign clr2=clk&reg1|clr1;

endmodule
