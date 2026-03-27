// testbench for sequence 1010 detector in moore
`timescale 1ns/1ps
// `include "seq_detect_moore_1010.v"
module  seq_detect_1010_moore_tb ; 
  reg clk, reset, in;
  wire out;   integer i;
  // instantiate state machine 
  seq_det_1010_moore DUT (clk,  reset,  in,  out);
  initial 
    forever #5 clk = ~clk; 
  
   initial begin 
    reset = 1'b1; clk = 1'b0; in = 0; 
    #5;
    reset = 1'b0; 
    for (i=0; i< 100; i=i+1) begin 
       @(posedge clk);  #1;
         in = ~in;
         if (out == 1'b1)
           $display ("PASS : Sequence 1010 detected \n");
         end  
          #50;
         $finish;
  end 
  // dump
  initial begin
     $dumpfile("dump.vcd");
     $dumpvars;
  end
endmodule // end testbench
