`timescale 1ns / 1ps

module lfsr_tb();
reg clk_tb;
reg rst_tb;
wire[3:0] out_tb;

initial
begin
clk_tb = 0;
rst_tb = 1;
#15;
rst_tb = 0;
#200;
$finish;
end

always
begin
#5;
clk_tb = ~clk_tb;
end

lfsr lfsr_DUT(out_tb, clk_tb, rst_tb);
endmodule
