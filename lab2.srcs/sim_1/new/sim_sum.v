`timescale 1ms / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2021 05:09:52 PM
// Design Name: 
// Module Name: sim_sum
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


module sim_sum();
    reg [15:0] a, b;
    reg minus;
    wire [16:0] c;
    
    sum no_name(a, b, minus, c);
    
    reg clk;
    
    initial begin
        while (1) begin
            clk <= 1;
            #50
            clk <= 0;
            #50;
        end
    end
    
    initial begin
        a <= 0;
        b <= 'hffff;
        minus <= 1;
        #100
        $finish;
    end;
endmodule
