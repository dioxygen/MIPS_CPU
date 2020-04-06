`timescale 1ns / 1ps

module MIPS_CPU(clk_sys,anodes,cnodes,ExpSrc1,ExpSrc2,ExpSrc3);
input wire clk_sys;
//input wire [4:0] sel_show;
input wire ExpSrc1,ExpSrc2,ExpSrc3;//ExpSrc1,ExpSrc2,ExpSrc3
wire clk_src,clk;
//wire clk;
wire [31:0]rega0;
output wire  [7:0] anodes,cnodes;
wire  [31:0] PCin;
wire  [31:0] clk_group;
wire enable3;
wire [31:0] IRIF,PCPlus4IF;
wire clr1,clr2;
wire [31:0] IRID,PCPlus4ID;
wire SyscallID,WeID,JalID,LwID,SwID,ShID,select2ID,J_jalID,ShiftID,BeqID,BneID,JrID,BgezID;
wire [3:0]AluopID;
wire [4:0]ReadReg1out,ReadReg2out,WriteRegID;
wire [31:0]R1ID,R2ID,IMMID,ShamtID,regv0,ALUoutMEMsel;
wire RedrectR1MEMin,RedrectR1WBin,RedrectR2MEMin,RedrectR2WBin;
wire SyscallEX,WeEX,JalEX,LwEX,SwEX,ShEX,select2EX,J_jalEX,ShiftEX,BeqEX;
wire [3:0]AluopEX;
wire BneEX,JrEX,BgezEX,RedrectR1MEMout,RedrectR1WBout,RedrectR2MEMout,RedrectR2WBout;
wire [31:0] R1EX,R2EX,IMMEX,ShamtEX,IREX,PCPlus4EX;
wire [31:0] DinWB,ALUoutMEM,MemoutMEM,PC_next,R_R2EX,ALUoutEX;
wire BranchorJump;
wire SyscallMEM,WeMEM,JalMEM,LwMEM,SwMEM,ShMEM;
wire [4:0]WriteRegMEM,WriteRegEX;
wire [31:0]R_R2MEM,IRMEM,PCPlus4MEM;
wire SyscallWB,WeWB,JalWB,LwWB;
wire [4:0]WriteRegWB;
wire [31:0]ALUoutWB,MemoutWB,IRWB,PCPlus4WB;
wire HaltWB;
wire loaduse,BJEEX;
wire HasExp,EretID,Mtc0ID,Mfc0ID,EretEX,Mtc0EX,Mfc0EX,Mfc0MEM,Mfc0WB;
wire [31:0] DoutID,DoutEX,DoutMEM,DoutWB;
wire [1:0] cp0regID,cp0regwriteEX;
//reg  [31:0] data_show;

assign clr=0;
assign enable=1;
//assign data_show=(sel_show==0)?rega0:[]ram;

assign clk_src=clk_group[15];//15
assign clk=HaltWB?1:clk_group[22];//19
//assign clk=HaltWB?1:clk_group;
//assign clk=HaltWB?1:clk_sys;
IF     If(clk,enable3,PC_next,IRIF,PCPlus4IF,EretEX,HasExp,DoutEX,PCin);
IF_ID  If_id(clk,enable3,clr1,IRIF,PCPlus4IF,IRID,PCPlus4ID);
ID     Id(clk,WeWB,IRID,DinWB,WriteRegWB,SyscallID,WeID,JalID,LwID,SwID,ShID,select2ID,J_jalID,ShiftID,BeqID,AluopID,BneID,JrID,BgezID,ReadReg1out,ReadReg2out,WriteRegID,R1ID,R2ID,IMMID,ShamtID,rega0,regv0,R_R2EX,PCin,cp0regwriteEX,ExpSrc1,ExpSrc2,ExpSrc3,Mtc0EX,HasExp,DoutID,EretID,Mtc0ID,Mfc0ID,cp0regID);
ID_EX  Id_ex(clk,SyscallID,WeID,JalID,LwID,SwID,ShID,select2ID,J_jalID,ShiftID,BeqID,AluopID,BneID,JrID,BgezID,RedrectR1MEMin,RedrectR1WBin,RedrectR2MEMin,RedrectR2WBin,R1ID,R2ID,WriteRegID,IMMID,ShamtID,IRID,PCPlus4ID,enable3,clr2, SyscallEX,WeEX,JalEX,LwEX,SwEX,ShEX,select2EX,J_jalEX,ShiftEX,BeqEX,AluopEX,BneEX,JrEX,BgezEX,RedrectR1MEMout,RedrectR1WBout,RedrectR2MEMout,RedrectR2WBout,R1EX,R2EX,WriteRegEX,IMMEX,ShamtEX,IREX,PCPlus4EX,DoutID,EretID,Mtc0ID,Mfc0ID,cp0regID,DoutEX,EretEX,Mtc0EX,Mfc0EX,cp0regwriteEX);
EX     Ex(select2EX,J_jalEX,ShiftEX,BeqEX,AluopEX,BneEX,JrEX,BgezEX,RedrectR1MEMout,RedrectR1WBout,RedrectR2MEMout,RedrectR2WBout,R1EX,R2EX,IMMEX,ShamtEX,IREX,PCPlus4EX,DinWB,ALUoutMEMsel,PCPlus4IF,PC_next,R_R2EX,BJEEX,ALUoutEX,EretEX);
EX_MEM Ex_mem(clk,enable,clr,SyscallEX,WeEX,JalEX,LwEX,SwEX,ShEX,WriteRegEX,ALUoutEX,R_R2EX,IREX,PCPlus4EX,SyscallMEM,WeMEM,JalMEM,LwMEM,SwMEM,ShMEM,WriteRegMEM,ALUoutMEM,R_R2MEM,IRMEM,PCPlus4MEM,DoutEX,Mfc0EX,DoutMEM,Mfc0MEM );
MEM    Mem(clk,LwMEM,SwMEM,ShMEM,ALUoutMEM,R_R2MEM,MemoutMEM,Mfc0MEM,DoutMEM,ALUoutMEMsel);
MEM_WB Mem_wb(clk,enable,clr,SyscallMEM,WeMEM,JalMEM,LwMEM,WriteRegMEM,ALUoutMEM,MemoutMEM,IRMEM,PCPlus4MEM, SyscallWB,WeWB,JalWB,LwWB,WriteRegWB,ALUoutWB,MemoutWB,IRWB,PCPlus4WB,DoutMEM,Mfc0MEM,DoutWB,Mfc0WB);
WB     Wb(clk,SyscallWB,WeWB,JalWB,LwWB,ALUoutWB,MemoutWB,PCPlus4WB,regv0,HaltWB,DinWB,Mfc0WB,DoutWB);
HazardUnit  Hazardunit(clk,WriteRegEX,WriteRegMEM,ReadReg1out,ReadReg2out,LwEX,BJEEX,RedrectR1MEMin,RedrectR2MEMin,RedrectR1WBin,RedrectR2WBin,enable3,loaduse,clr1,clr2 );
led_unit led (clk_src,rega0,anodes,cnodes);
tick_divider clk_divider(clk_sys,clk_group);

endmodule
