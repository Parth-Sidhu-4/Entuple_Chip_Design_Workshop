`timescale 1ns / 1ps

// SR FLIP FLOP TEST BENCH

module sr_flop_tb;
reg clk, rst, s, r;
wire q;

// SR Flop Instance

sr_flop sr_inst(clk, rst, s, r, sr_ff);
initial
clk = 1'b1;
always #5 clk <= ~clk;

initial begin
#10 rst = 1'b1; s = 1'b1; r = 1'b0;
#10 rst = 1'b1; s = 1'b0; r = 1'b1;
#10 rst = 1'b0; s = 1'b0; r = 1'b0;
#10 rst = 1'b0; s = 1'b0; r = 1'b1;
#10 rst = 1'b0; s = 1'b1; r = 1'b0;
#10 rst = 1'b0; s = 1'b1; r = 1'b0;
#10 rst = 1'b0; s = 1'b1; r = 1'b1;
end
initial
$monitor("rst = %b, s = %b, r = %b, output = %b", rst, s, r, sr_ff);
initial
#100 $finish;
endmodule
