`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/24 14:42:52
// Design Name: 
// Module Name: ROM
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


module ROM(address,data);
input  wire [31:0]address;
output wire [31:0]data;
reg  [31:0]rom1[0:511];
reg  [31:0]rom2[0:511];

initial
begin
    $readmemh("D:\\bench.hex",rom1,0,511);
end

initial
begin
    $readmemh("D:\\zhongduan.hex",rom2,0,511);
end

assign data=address[11]?rom2[(address[10:2])]:rom1[(address[10:2])];

endmodule
