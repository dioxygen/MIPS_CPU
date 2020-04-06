`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/23 00:14:57
// Design Name: 
// Module Name: IF_ID
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


module IF_ID(clk,enable,clr,IRIF,PCPlus4IF,IRID,PCPlus4ID);
input  wire clk,enable,clr;
input  wire [31:0] PCPlus4IF,IRIF;
output reg  [31:0] PCPlus4ID,IRID;

initial 
begin
    PCPlus4ID<=0;
    IRID<=0;
end


always@(posedge clk)
begin
    if(clr)
    begin
        PCPlus4ID<=0;
        IRID<=0;
     end
     else if(enable) 
     begin
        IRID<=IRIF;
        PCPlus4ID<=PCPlus4IF;
     end
end

endmodule
