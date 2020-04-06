`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/23 09:27:54
// Design Name: 
// Module Name: IF
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


module IF(clk,enable3,PC_next,IRIF,PCPlus4IF,EretEX,HasExp,DoutEX,PCin);
input  wire clk;
input  wire enable3,EretEX,HasExp;
input  wire [31:0] DoutEX,PC_next;
output wire [31:0] PCPlus4IF,IRIF;
output reg   [31:0] PCin;
wire clk1;
wire [31:0] PC_sel;

initial 
begin
    PCin=0;
end

assign clk1=(HasExp|EretEX)?(~clk):clk;
assign PC_sel=HasExp?32'h800:(EretEX?DoutEX:PC_next);
always@(posedge clk1)
begin
if(enable3)
    begin                                                                                                                                                                                                                                                         
    PCin=PC_sel;
    end
end

assign PCPlus4IF=PCin+3'b100;

ROM Rom(PCin,IRIF);

endmodule
