`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/23 00:17:01
// Design Name: 
// Module Name: CP0
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


module CP0(clk,R_R2EX,PCin,cp0regID,cp0regwriteEX,ExpSrc1,ExpSrc2,ExpSrc3,EretID,Mtc0EX,DoutID,HasExp );
input  wire clk;
input  wire [31:0]R_R2EX,PCin;
input  wire [1:0]cp0regID,cp0regwriteEX;
input  wire ExpSrc1,ExpSrc2,ExpSrc3,EretID,Mtc0EX;
output wire [31:0]DoutID;
output wire HasExp;
reg  reg1,reg2,reg3,IR1,IR2,IR3,clr_reg;
reg  [1:0]pri_reg;
reg  [31:0] status,cause,EPC;
wire [31:0] exp_cause;
reg  IE;
wire [1:0]pri;
wire [3:1] clear;
wire [1:0] shield;


initial
begin 
    reg1<=0;
    reg2<=0;
    reg3<=0;
    IR1<=0;
    IR2<=0;
    IR3<=0;     
    status<=0;
    cause<=0;
    EPC<=0;
    IE<=0;
end

always@(negedge clk)
begin
if((cp0regwriteEX==0)&Mtc0EX)
    begin
     status<=HasExp?PCin:R_R2EX;
    end
if(((cp0regwriteEX==1)&Mtc0EX)|HasExp)
    begin
    cause<=HasExp?exp_cause:R_R2EX;
    end
if(((cp0regwriteEX==2)&Mtc0EX)|HasExp)
    begin
    EPC<=HasExp?PCin:R_R2EX;
    end
end


always@(negedge clk)
begin
    IE<=~(status[0]);
end

always@(posedge ExpSrc1 or posedge clear[1])
begin
    if(clear[1]>0)
    begin
        reg1<=0;
    end
    else if(ExpSrc1>0)
    begin
        reg1<=1;
    end   
end

always@(posedge ExpSrc2 or posedge clear[2])
begin
    if(clear[2]>0)
    begin
        reg2<=0;
    end
    else if(ExpSrc2>0)
    begin
        reg2<=1;
    end   
end

always@(posedge ExpSrc3 or posedge clear[3])
begin
    if(clear[3]>0)
    begin
        reg3<=0;
    end
    else if(ExpSrc3>0)
    begin
        reg3<=1;
    end   
end


always@(posedge clk)
begin
    if(clear[1])
    begin
    IR1<=0;
    end
    else 
    begin
    IR1<=reg1;
    end
end

always@(posedge clk)
begin
    if(clear[2])
    begin
        IR2<=0;
    end
    else 
    begin
    IR2<=reg2;
    end
end

always@(posedge clk)
begin
    if(clear[3])
    begin
    IR3<=0;
    end
    else 
    begin
    IR3<=reg3;
    end
end

assign DoutID=EretID?EPC:(cp0regID[1]?EPC:(cp0regID[0]?cause:status));
assign shield=cause[1:0];
assign pri=(IE&IR3)?3:((IE&IR2)?2:((IE&IR1)?1:0));
assign exp_cause={30'b0,pri};
assign HasExp=(pri>shield);
assign clear[3]=(pri_reg[1]&pri_reg[0])&clr_reg;
assign clear[2]=(pri_reg[1]&(~pri_reg[0]))&clr_reg;
assign clear[1]=((~pri_reg[1])&pri_reg[0])&clr_reg;

always@(negedge clk)
begin
    pri_reg<=pri;
    clr_reg<=HasExp;
end

endmodule
