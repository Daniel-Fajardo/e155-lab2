// Daniel Fajardo
// dfajardo@g.hmc.edu
// 09/17/2024
//
// testbench for top level module
`timescale 1ns/1ns
`default_nettype none
`define N_TV 8
module lab2_df_tb();
    logic clk;
    logic [3:0] s1, s2;
    logic reset;
    logic [6:0] seg;
    logic anode1, anode2;
    logic [4:0] led;

    top dut(.s1(s1),.s2(s2),.clk(clk),.reset(reset),.seg(seg),.anode1(anode1),.anode2(anode2),.led(led));

    initial begin
        reset = 0; #5;
        reset = 1; #5;
        end
    always begin
        clk = 1; #5;
        clk = 0; #5;
        end
    initial begin
        s1 = 4'b0000; #15;
        s2 = 4'b0000; #15;
        s1 = 4'b0100; #15;
        s2 = 4'b0001; #15;
        s1 = 4'b0000; #15;
        s2 = 4'b0110; #15;
    end

endmodule