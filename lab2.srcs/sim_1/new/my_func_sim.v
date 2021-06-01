`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2021 06:39:11 PM
// Design Name: 
// Module Name: my_func_sim
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


module my_func_sim();
    reg[7:0] a, b;
    reg rst, start;
    reg clk;
    wire busy;
    wire[8:0] y;
    
    my_func well_it_is_just_a_func_why_do_I_need_to_give_it_a_name_question_mark
        (clk, rst, a, b, start, busy, y);
        
    localparam N_TEST = 11;
    wire[N_TEST - 1:0][7:0] test_a, test_b;
    wire[N_TEST - 1:0][8:0] test_c;
    reg[8:0] expected;
    assign test_a = {8'd3, 8'd5,  8'd12, 8'd255, 8'd10, 8'd200, 8'd123, 8'd40, 8'd0, 8'd1, 8'd36};
    assign test_b = {8'd4, 8'd12, 8'd5,  8'd255, 8'd20, 8'd100, 8'd234, 8'd30, 8'd0, 8'd0, 8'd0};
    assign test_c = {9'd5, 9'd13, 9'd13, 9'd360, 9'd22, 9'd223, 9'd264, 9'd50, 9'd0, 9'd1, 9'd36};
    
    localparam PREPARE_TEST = 2'd0;
    localparam START_TEST = 2'd1;
    localparam WAIT_THEN_CHECK_TEST = 2'd2;
    
    reg[1:0] state;
    integer test_case;
    
    initial begin
        test_case <= 32'd0;
        state <= PREPARE_TEST;
        while (1) begin
            clk <= 1; #5;
            clk <= 0; #5;
        end
    end
    
    always @(posedge clk) case (state)
        PREPARE_TEST: begin
            if (test_case == N_TEST) begin
                $display("Finished test");
                $finish;
            end
            $display("Test %d", test_case);
            state = START_TEST;
            a <= test_a[test_case];
            b <= test_b[test_case];
            expected <= test_c[test_case];
            rst <= 1;
            start <= 0;
        end
        START_TEST: begin
            state <= WAIT_THEN_CHECK_TEST;
            rst <= 0;
            start <= 1;
        end
        WAIT_THEN_CHECK_TEST: begin
            if (!busy & !start) begin
                $display("a = %d, b = %d, expected = %d", a, b, expected);
                $display("Answer = %d", y);
                if (y == expected) begin
                    $display("passed");
                end else begin
                    $display("failed");
                    $finish;
                end
                state <= PREPARE_TEST;
                test_case <= test_case + 1;
            end
            
            start <= 0;
        end
    endcase
endmodule
