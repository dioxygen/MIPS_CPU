`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/23 09:27:41
// Design Name: 
// Module Name: ID
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
module ID(clk,WeWB,IRID,DinWB,WriteRegWB,SyscallID,WeID,JalID,LwID,SwID,ShID,select2ID,J_jalID,ShiftID,BeqID,AluopID,BneID,JrID,BgezID,ReadReg1out,ReadReg2out,WriteRegID,R1ID,R2ID,IMMID,ShamtID,rega0,regv0,R_R2EX,PCin,cp0regwriteEX,ExpSrc1,ExpSrc2,ExpSrc3,Mtc0EX,HasExp,DoutID,EretID,Mtc0ID,Mfc0ID,cp0regID);
input  wire clk;
input  wire WeWB,ExpSrc1,ExpSrc2,ExpSrc3,Mtc0EX;
input  wire [4:0] WriteRegWB;
input  wire [1:0] cp0regwriteEX;
input  wire [31:0] IRID,DinWB,R_R2EX,PCin;
output wire [31:0]R1ID,R2ID,IMMID,ShamtID,rega0,regv0,DoutID;
output wire [4:0] ReadReg1out,ReadReg2out,WriteRegID;
output wire [1:0]cp0regID;
wire  [4:0] ReadReg1in,ReadReg2in,WriteRegin;
output wire [3:0] AluopID;
wire  [5:0]op,funct;
wire  bit_23;
output wire SyscallID,WeID,JalID,LwID,SwID,ShID,select2ID,J_jalID,ShiftID,BeqID,BneID,JrID,BgezID,HasExp,EretID,Mtc0ID,Mfc0ID;
wire  select1ID,select3ID;

assign cp0regID=IRID[12:11];
assign op=IRID[31:26];
assign funct=IRID[5:0];
assign bit_23=IRID[23];
assign ReadReg1in=ShiftID?(IRID[20:16]):(IRID[25:21]);
assign ReadReg2in=IRID[20:16];
assign WriteRegin=JalID?31:(select1ID?(IRID[15:11]):IRID[20:16]);
assign IMMID=select3ID?({{16{1'b0}},IRID[15:0]}):({{16{IRID[15]}},IRID[15:0]});
assign ShamtID=({{27{IRID[10]}},IRID[10:6]});
                                                                                           
ControlUnit  ControlUnit_1(op,funct,bit_23,ReadReg1in,ReadReg2in,WriteRegin,AluopID,select1ID,JalID,ShiftID,WeID,select2ID,BeqID,BneID,J_jalID,JrID,SwID,LwID,select3ID,SyscallID,ShID,BgezID,EretID,Mtc0ID,Mfc0ID,ReadReg1out,ReadReg2out,WriteRegID);
RegFile     Regfile(clk,WeWB,ReadReg1in,ReadReg2in,WriteRegWB,DinWB,R1ID,R2ID,rega0,regv0);
CP0         cp0(clk,R_R2EX,PCin,cp0regID,cp0regwriteEX,ExpSrc1,ExpSrc2,ExpSrc3,EretID,Mtc0EX,DoutID,HasExp );



endmodule
