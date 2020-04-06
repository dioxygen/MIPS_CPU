`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/23 00:16:24
// Design Name: 
// Module Name: MEM_WB
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


module MEM_WB(clk,enable,clr,SyscallMEM,WeMEM,JalMEM,LwMEM,WriteRegMEM,ALUoutMEM,MemoutMEM,IRMEM,PCPlus4MEM,SyscallWB,WeWB,JalWB,LwWB,WriteRegWB,ALUoutWB,MemoutWB,IRWB,PCPlus4WB,DoutMEM,Mfc0MEM,DoutWB,Mfc0WB);
input wire clk,enable,clr,SyscallMEM,WeMEM,JalMEM,LwMEM,Mfc0MEM;
input wire [4:0] WriteRegMEM;
input wire [31:0] ALUoutMEM,MemoutMEM,IRMEM,PCPlus4MEM,DoutMEM;
output reg  SyscallWB,WeWB,JalWB,LwWB,Mfc0WB;
output reg  [4:0] WriteRegWB;
output reg  [31:0] ALUoutWB,MemoutWB,IRWB,PCPlus4WB,DoutWB;

initial
begin    
        SyscallWB<=0;
        WeWB<=0;
        JalWB<=0;
        LwWB<=0;
        WriteRegWB<=0;
        ALUoutWB<=0;
        MemoutWB<=0;
        IRWB<=0;
        PCPlus4WB<=0;
        DoutWB<=0;
        Mfc0WB<=0;
end

always@(posedge clk)
begin
    if(clr)
    begin
        SyscallWB<=0;
        WeWB<=0;
        JalWB<=0;
        LwWB<=0;
        WriteRegWB<=0;
        ALUoutWB<=0;
        MemoutWB<=0;
        IRWB<=0;
        PCPlus4WB<=0;
        DoutWB<=0;
        Mfc0WB<=0;
     end
     else if(enable) 
     begin
        SyscallWB<=SyscallMEM;
        WeWB<=WeMEM;
        JalWB<=JalMEM;
        LwWB<=LwMEM;
        WriteRegWB<=WriteRegMEM;
        ALUoutWB<=ALUoutMEM;
        MemoutWB<=MemoutMEM;
        IRWB<=IRMEM;
        PCPlus4WB<=PCPlus4MEM;
        DoutWB<=DoutMEM;
        Mfc0WB<=Mfc0MEM;
     end
end
endmodule
