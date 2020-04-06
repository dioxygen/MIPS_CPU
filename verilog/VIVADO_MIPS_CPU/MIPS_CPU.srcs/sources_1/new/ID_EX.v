`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/23 00:15:34
// Design Name: 
// Module Name: ID_EX
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


module ID_EX(clk,SyscallID,WeID,JalID,LwID,SwID,ShID,select2ID,J_jalID,ShiftID,BeqID,AluopID,BneID,JrID,BgezID,RedrectR1MEMin,RedrectR1WBin,RedrectR2MEMin,RedrectR2WBin,R1ID,R2ID,WriteRegID,IMMID,ShamtID,IRID,PCPlus4ID,enable,clr,SyscallEX,WeEX,JalEX,LwEX,SwEX,ShEX,select2EX,J_jalEX,ShiftEX,BeqEX,AluopEX,BneEX,JrEX,BgezEX,RedrectR1MEMout,RedrectR1WBout,RedrectR2MEMout,RedrectR2WBout,R1EX,R2EX,WriteRegEX,IMMEX,ShamtEX,IREX,PCPlus4EX,DoutID,EretID,Mtc0ID,Mfc0ID,cp0regID,DoutEX,EretEX,Mtc0EX,Mfc0EX,cp0regwriteEX);
input wire clk,enable,clr;
input wire SyscallID,WeID,JalID,LwID,SwID,ShID,select2ID,J_jalID,ShiftID,BeqID,BneID,JrID,BgezID,RedrectR1MEMin,RedrectR1WBin,RedrectR2MEMin,RedrectR2WBin,EretID,Mtc0ID,Mfc0ID;
input wire [3:0] AluopID;
input wire [1:0] cp0regID;
input wire [4:0] WriteRegID;
input wire [31:0] R1ID,R2ID,IMMID,ShamtID,IRID,PCPlus4ID,DoutID;
output reg  [1:0] cp0regwriteEX;
output reg  SyscallEX,WeEX,JalEX,LwEX,SwEX,ShEX,select2EX,J_jalEX,ShiftEX,BeqEX,BneEX,JrEX,BgezEX,RedrectR1MEMout,RedrectR1WBout,RedrectR2MEMout,RedrectR2WBout,EretEX,Mtc0EX,Mfc0EX;
output reg  [3:0] AluopEX;
output reg  [4:0] WriteRegEX;
output reg  [31:0] R1EX,R2EX,IMMEX,ShamtEX,IREX,PCPlus4EX,DoutEX;

initial
begin
    SyscallEX<=0;
    WeEX<=0;
    JalEX<=0;
    LwEX<=0;
    SwEX<=0;
    ShEX<=0;
    select2EX<=0;
    J_jalEX<=0;
    ShiftEX<=0;
    BeqEX<=0;
    BneEX<=0;
    JrEX<=0;
    BgezEX<=0;
    RedrectR1MEMout<=0;
    RedrectR1WBout<=0;
    RedrectR2MEMout<=0;
    RedrectR2WBout<=0;
    AluopEX<=0;
    WriteRegEX<=0;
    R1EX<=0;
    R2EX<=0;
    IMMEX<=0;
    ShamtEX<=0;
    IREX<=0;
    PCPlus4EX<=0;
    DoutEX<=0;
    EretEX<=0;
    Mtc0EX<=0;
    Mfc0EX<=0;
    cp0regwriteEX<=0;
end

always@(posedge clk)
begin
    if(clr)
    begin
    SyscallEX<=0;
    WeEX<=0;
    JalEX<=0;
    LwEX<=0;
    SwEX<=0;
    ShEX<=0;
    select2EX<=0;
    J_jalEX<=0;
    ShiftEX<=0;
    BeqEX<=0;
    BneEX<=0;
    JrEX<=0;
    BgezEX<=0;
    RedrectR1MEMout<=0;
    RedrectR1WBout<=0;
    RedrectR2MEMout<=0;
    RedrectR2WBout<=0;
    AluopEX<=0;
    WriteRegEX<=0;
    R1EX<=0;
    R2EX<=0;
    IMMEX<=0;
    ShamtEX<=0;
    IREX<=0;
    PCPlus4EX<=0;
    DoutEX<=0;
    EretEX<=0;
    Mtc0EX<=0;
    Mfc0EX<=0;
    cp0regwriteEX<=0;
    end
    else if(enable) 
    begin
    SyscallEX<=SyscallID;
    WeEX<=WeID;
    JalEX<=JalID;
    LwEX<=LwID;
    SwEX<=SwID;
    ShEX<=ShID;
    select2EX<=select2ID;
    J_jalEX<=J_jalID;
    ShiftEX<=ShiftID;
    BeqEX<=BeqID;
    BneEX<=BneID;
    JrEX<=JrID;
    BgezEX<=BgezID;
    RedrectR1MEMout<=RedrectR1MEMin;
    RedrectR1WBout<=RedrectR1WBin;
    RedrectR2MEMout<=RedrectR2MEMin;
    RedrectR2WBout<=RedrectR2WBin;
    AluopEX<=AluopID;
    WriteRegEX<=WriteRegID;
    R1EX<=R1ID;
    R2EX<=R2ID;
    IMMEX<=IMMID;
    ShamtEX<=ShamtID;
    IREX<=IRID;
    PCPlus4EX<=PCPlus4ID;
    DoutEX<=DoutID;
    EretEX<=EretID;
    Mtc0EX<=Mtc0ID;
    Mfc0EX<=Mfc0ID;
    cp0regwriteEX<=cp0regID;
    end
end

endmodule
