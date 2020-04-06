`timescale 1ns / 1ps

module ALU( ALUsrcx,ALUsrcy,Aluop,Zero,ALUout);
input wire [31:0]ALUsrcx,ALUsrcy;
input wire [3:0]Aluop;
output wire Zero;
output reg  [31:0] ALUout;
reg  [31:0] result2;
//reg  cf,of;

initial 
begin
    ALUout<=0;
end

always@(*)
begin 
    case(Aluop)
    0:  ALUout<=(ALUsrcx<<(ALUsrcy[4:0]));
    1:  ALUout<=($signed(ALUsrcx)>>>(ALUsrcy[4:0]));
    2:  ALUout<=(ALUsrcx>>(ALUsrcy[4:0]));
    3:  {result2,ALUout}<=ALUsrcx*ALUsrcy;
    4:  ALUout<=({32'b0,ALUsrcx}/ALUsrcy);    
    5:  begin
        ALUout=ALUsrcx+ALUsrcy;
        //cf=($signed(ALUout)<$signed(ALUsrcx));
        end
    6:  begin
        ALUout=ALUsrcx-ALUsrcy;    
        //cf=($signed(ALUsrcx)<$signed(ALUsrcy));
        end
    7:  ALUout<=ALUsrcx&ALUsrcy;
    8: ALUout<=ALUsrcx|ALUsrcy;  
    9:  ALUout<=ALUsrcx^ALUsrcy;  
    10: ALUout<=~(ALUsrcx|ALUsrcy);  
    11: ALUout<=($signed(ALUsrcx)<$signed(ALUsrcy));
    12: ALUout<=(ALUsrcx<ALUsrcy);   
    default:  ;
    endcase
end

assign Zero=(ALUsrcx==ALUsrcy);
    
endmodule
