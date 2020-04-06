`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/23 09:28:11
// Design Name: 
// Module Name: EX
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
module EX(select2EX,J_jalEX,ShiftEX,BeqEX,AluopEX,BneEX,JrEX,BgezEX,RedrectR1MEM,RedrectR1WB,RedrectR2MEM,RedrectR2WB,R1EX,R2EX,IMMEX,ShamtEX,IREX,PCPlus4EX,DinWB,ALUoutMEM,PCPlus4IF,PC_next,R_R2EX,BJEX,ALUoutEX,EretEX);
input wire select2EX,J_jalEX,ShiftEX,BeqEX,BneEX,JrEX,BgezEX,RedrectR1MEM,RedrectR1WB,RedrectR2MEM,RedrectR2WB,EretEX;
input wire [31:0] R1EX,R2EX,IMMEX,ShamtEX,IREX,PCPlus4EX,DinWB,ALUoutMEM,PCPlus4IF;
input wire [3:0]AluopEX;
output wire [31:0] PC_next,R_R2EX;
output wire BJEX;
wire BranchorJump;
output wire [31:0]  ALUoutEX;
wire [31:0] R_R1EX,ALUsrcx,ALUsrcy,BJ_Address,J_jalAddress,BranchAddress,BranchSuccessEX;
wire geEX,ZeroEX;

assign ALUsrcx=RedrectR1MEM?(ALUoutMEM):(RedrectR1WB?(DinWB):R1EX);
assign R_R1EX=ALUsrcx;
assign R_R2EX=RedrectR2MEM?(ALUoutMEM):(RedrectR2WB?(DinWB):R2EX);
assign ALUsrcy=BgezEX?0:(ShiftEX?ShamtEX:(select2EX?IMMEX:R_R2EX));
assign BJEX=BranchorJump|EretEX;
assign J_jalAddress={(PCPlus4EX[31:28]),((IREX[27:0])<<2)};
assign BranchAddress=PCPlus4EX+(IMMEX<<2);
assign BJ_Address=JrEX?R_R1EX:(J_jalEX?J_jalAddress:(BranchSuccessEX?BranchAddress:PCPlus4EX));
assign BranchSuccessEX=((BeqEX&ZeroEX)|((~ZeroEX)&BneEX))|(geEX&BgezEX);
assign BranchorJump=JrEX|J_jalEX|BranchSuccessEX;
assign PC_next=BranchorJump?BJ_Address:PCPlus4IF;
assign geEX=ALUoutEX[0];

ALU alu(ALUsrcx,ALUsrcy,AluopEX,ZeroEX,ALUoutEX);

endmodule



















