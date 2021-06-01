`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2021 04:47:27 PM
// Design Name: 
// Module Name: sum
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


module sum(
    input [16:0] a,
    input [16:0] b,
    input minus,
    output [17:0] out
    );
    assign out = minus ? a - b : a + b;
endmodule
