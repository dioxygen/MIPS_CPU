`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/23 00:15:55
// Design Name: 
// Module Name: EX_MEM
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


module EX_MEM(clk,enable,clr,SyscallEX,WeEX,JalEX,LwEX,SwEX,ShEX,WriteRegEX,ALUoutEX,R_R2EX,IREX,PCPlus4EX,SyscallMEM,WeMEM,JalMEM,LwMEM,SwMEM,ShMEM,WriteRegMEM,ALUoutMEM,R_R2MEM,IRMEM,PCPlus4MEM,DoutEX,Mfc0EX,DoutMEM,Mfc0MEM );
input wire clk,enable,clr,SyscallEX,WeEX,JalEX,LwEX,SwEX,ShEX,Mfc0EX;
input wire [4:0]WriteRegEX;
input wire [31:0] ALUoutEX,R_R2EX,IREX,PCPlus4EX,DoutEX;
output reg  SyscallMEM,WeMEM,JalMEM,LwMEM,SwMEM,ShMEM,Mfc0MEM;
output reg  [4:0]WriteRegMEM;
output reg  [31:0] ALUoutMEM,R_R2MEM,IRMEM,PCPlus4MEM,DoutMEM;

initial
begin
        SyscallMEM<=0;
        WeMEM<=0;
        JalMEM<=0;
        LwMEM<=0;
        SwMEM<=0;
        ShMEM<=0;
        WriteRegMEM<=0;
        ALUoutMEM<=0;
        R_R2MEM<=0;
        IRMEM<=0;
        PCPlus4MEM<=0;
        DoutMEM<=0;
        Mfc0MEM<=0;
end
     
always@(posedge clk)
begin
    if(clr)
    begin
        SyscallMEM<=0;
        WeMEM<=0;
        JalMEM<=0;
        LwMEM<=0;
        SwMEM<=0;
        ShMEM<=0;
        WriteRegMEM<=0;
        ALUoutMEM<=0;
        R_R2MEM<=0;
        IRMEM<=0;
        PCPlus4MEM<=0;
        DoutMEM<=0;
        Mfc0MEM<=0;
     end
     else if(enable) 
     begin
        SyscallMEM<=SyscallEX;
        WeMEM<=WeEX;
        JalMEM<=JalEX;
        LwMEM<=LwEX;
        SwMEM<=SwEX;
        ShMEM<=ShEX;
        WriteRegMEM<=WriteRegEX;
        ALUoutMEM<=ALUoutEX;
        R_R2MEM<=R_R2EX;
        IRMEM<=IREX;
        PCPlus4MEM<=PCPlus4EX;
        DoutMEM<=DoutEX;
        Mfc0MEM<=Mfc0EX;
     end
end




endmodule
