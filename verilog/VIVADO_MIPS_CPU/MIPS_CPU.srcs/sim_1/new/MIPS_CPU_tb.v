`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/24 18:46:50
// Design Name: 
// Module Name: MIPS_CPU_tb
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

module MIPS_CPU_tb();
reg  clk;
wire [7:0] anodes,cnodes;
reg  ExpSrc1,ExpSrc2,ExpSrc3;
//wire [31:0] a0;
MIPS_CPU cpu(clk,anodes,cnodes,ExpSrc1,ExpSrc2,ExpSrc3);//,ExpSrc1,ExpSrc2,ExpSrc3

initial begin 
clk=0;
forever 
#1 clk = ~clk; end 

initial
begin 
ExpSrc1=0;
ExpSrc2=0;
ExpSrc3=0;
#20 ExpSrc1=1;
#4  ExpSrc1=0;
//#40 ExpSrc1=1;
//#4  ExpSrc1=0;
end 


endmodule
