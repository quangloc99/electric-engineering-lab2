`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2021 05:18:39 PM
// Design Name: 
// Module Name: my_func
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

// a block for calculating floor(sqrt(a*a + b*b))
module my_func(
    input clk_i,
    input rst_i, 
    
    input [7:0] a_i,
    input [7:0] b_i,
    input start_i,
    
    output busy_o,
    output [8:0] y_o
);
    localparam IDLE = 3'h0;
    localparam CAL_SQUARE = 3'h1;
    localparam CAL_SQRT_START = 3'h2;
    localparam CAL_SQRT_LOOP = 3'h3;
    localparam CAL_SQRT_CHECK_AND_UPDATE_RESULT = 3'h4;
    
    reg [2:0] state;
    
    wire [15:0] a_square, b_square;
    wire a_square_busy, b_square_busy;
    mult a_square_block(clk_i, rst_i, a_i, a_i, start_i, 
                        a_square_busy, a_square);
    mult b_square_block(clk_i, rst_i, b_i, b_i, start_i,
                        b_square_busy, b_square);
                        
                        
    localparam SUM_MODE_ADD = 1'b0;
    localparam SUM_MODE_SUB = 1'b1;  // subtraction
    reg[16:0] sum_in_a, sum_in_b;
    reg sum_mode;
    wire [17:0] sum_out;
    sum sum_block(sum_in_a, sum_in_b, sum_mode, sum_out);
    
    // the following are described in the algorithm
    localparam N = 18;
    reg [16:0] m, x, y;
    assign y_o = y[8:0];
    
    // predifined states
    wire done_cal_squares, done_sqrt_loop, need_update;
    assign done_cal_squares = !a_square_busy & !b_square_busy;
    assign done_sqrt_loop = m == 0;
    assign need_update = ~sum_out[17];    // this is when we are comparing x >= b and then if so we assign x = x - b.
                                          // By using the summator with the minus mode, we can check x >= b
                                          // by doing the subtraction and check for overflow.
                                          // And this also give us the result right away.
                                          
                                          
    assign busy_o = state != IDLE;
    
    
    always @(posedge clk_i) 
    if (rst_i) begin
        state <= IDLE;
    end else case(state)
        IDLE: if (start_i) begin
            state <= CAL_SQUARE;
        end
        CAL_SQUARE: begin
            if (done_cal_squares) begin
                state <= CAL_SQRT_START;
                
                sum_in_a <= a_square;
                sum_in_b <= b_square;
                sum_mode <= SUM_MODE_ADD;
            end
        end
        CAL_SQRT_START: begin
            state <= CAL_SQRT_LOOP;
            x <= sum_out;
            sum_mode <= SUM_MODE_SUB;
            m <= 1 << (N - 2);  // constant
            y <= 0;
        end
        CAL_SQRT_LOOP: begin
            if (done_sqrt_loop) begin
                state <= IDLE;
            end else begin
                state <= CAL_SQRT_CHECK_AND_UPDATE_RESULT;
                
                // setup for doing subtraction (x - (y | m))
                sum_in_a <= x;
                sum_in_b <= y | m;
                y <= y >> 1;  // this is done parallelly
            end
        end
        CAL_SQRT_CHECK_AND_UPDATE_RESULT: begin
            state <= CAL_SQRT_LOOP;
            if (need_update) begin
                x <= sum_out;
                y <= y | m;
            end
            m = m >> 2; // again, parallelly
        end
    endcase
endmodule
