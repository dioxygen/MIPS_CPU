`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/22 21:45:13
// Design Name: 
// Module Name: ControlUnit
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


module ControlUnit( op,funct,bit_23,ReadReg1in,ReadReg2in,WriteRegin, Aluop,select1,Jal,Shift,We,select2,Beq,Bne,J_jal,Jr,Sw,Lw,select3,Syscall,Sh,Bgez,Eret,Mtc0,Mfc0,ReadReg1out,ReadReg2out,WriteRegID);
input  wire bit_23;
input  wire [5:0] op,funct;
input  wire [4:0]ReadReg1in,ReadReg2in,WriteRegin;
output wire [4:0] ReadReg1out,ReadReg2out,WriteRegID;
output wire [3:0]Aluop;
output wire select1,Jal,Shift,We,select2,Beq,Bne,J_jal,Jr,Sw,Lw,select3,Syscall,Sh,Bgez,Eret,Mtc0,Mfc0;
wire add,addi,addiu,addu,i_and,andi,sll,sra,srl,sub,i_or,ori,i_nor,lw,sw,beq,bne,slt,slti,sltu,j,jal,jr,syscall,xori,sltiu,sh,bgez,cp0,sel1,sel2;

assign add=({funct,op}==12'b100000000000)? 1:0;
assign addi=(op==6'b001000)? 1:0;
assign addiu=(op==6'b001001)? 1:0;
assign addu=({funct,op}==12'b100001000000)? 1:0;
assign i_and=({funct,op}==12'b100100000000)? 1:0;
assign andi=(op==6'b001100)? 1:0;
assign sll=({funct,op}==12'b000000000000)? 1:0;
assign sra=({funct,op}==12'b000011000000)? 1:0;
assign srl=({funct,op}==12'b000010000000)? 1:0;
assign sub=({funct,op}==12'b100010000000)? 1:0;
assign i_or=({funct,op}==12'b100101000000)? 1:0;
assign ori=(op==6'b001101)? 1:0;
assign i_nor=({funct,op}==12'b100111000000)? 1:0;
assign lw=(op==6'b100011)? 1:0;
assign sw=(op==6'b101011)? 1:0;
assign beq=(op==6'b000100)? 1:0;
assign bne=(op==6'b000101)? 1:0;
assign slt=({funct,op}==12'b101010000000)? 1:0;
assign slti=(op==6'b001010)? 1:0;
assign sltu=({funct,op}==12'b101011000000)? 1:0;
assign j=(op==6'b000010)? 1:0;
assign jal=(op==6'b000011)? 1:0;
assign jr=({funct,op}==12'b001000000000)? 1:0;
assign syscall=({funct,op}==12'b001100000000)? 1:0;
assign xori=(op==6'b001110)? 1:0;
assign sltiu=(op==6'b001011)? 1:0;
assign sh=(op==6'b101001)? 1:0;
assign bgez=(op==6'b000001)? 1:0;
assign cp0=(op==6'b010000)? 1:0;

assign Aluop[0]=add|addi|addiu|addu|i_and|andi|sra|lw|sw|slt|slti|xori|sh|bgez;
assign Aluop[1]=i_and|andi|srl|sub|i_nor|slt|slti|bgez;
assign Aluop[2]=add|addi|addiu|addu|i_and|andi|sub|lw|sw|sltu|sltiu|sh;
assign Aluop[3]=i_or|ori|i_nor|slt|slti|sltu|xori|sltiu|bgez;
assign select1=add|addu|i_and|sll|sra|srl|sub|i_or|i_nor|slt|sltu;
assign Jal=jal;
assign Shift=sll|sra|srl;
assign We=~(sw|beq|bne|j|jr|syscall|sh|bgez|Eret|Mtc0);
assign select2=addi|addiu|andi|ori|lw|sw|slti|xori|sltiu|sh;
assign Beq=beq;
assign Bne=bne;
assign J_jal=j|jal;
assign Jr=jr;
assign Sw=sw|sh;
assign Lw=lw|sh;
assign select3=andi|ori|xori;
assign Syscall=syscall;
assign Sh=sh;
assign Bgez=bgez;
assign Eret=cp0&funct[4];
assign Mtc0=cp0&bit_23;
assign Mfc0=cp0&(~bit_23)&(~funct[4]);

assign sel1=add|addu|i_and|sub|i_or|i_nor|sw|beq|bne|slt|sltu|sh|addi|addiu|andi|sll|sra|srl|ori|lw|slti|jr|xori|sltiu|bgez;
assign sel2=add|addu|i_and|sub|i_or|i_nor|sw|beq|bne|slt|sltu|sh|Mtc0;
assign ReadReg1out=sel1?ReadReg1in:5'b0;
assign ReadReg2out=sel2?ReadReg2in:5'b0;
assign WriteRegID=We?WriteRegin:5'b0;

endmodule
