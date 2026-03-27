`timescale 1ns/1ps
`include "seq_detect_mealy_11.v"

module seq_det_11_mealy_tb;

reg clk, reset, in;
wire out;
integer i;

// Instantiate DUT (named mapping - recommended)
seq_det_11_mealy DUT (
    .clk(clk),
    .reset(reset),
    .din(in),
    .dout(out)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Stimulus
initial begin
    reset = 1'b1;
    in = 0;

    #5;
    reset = 1'b0;

    for (i = 0; i < 100; i = i + 1) begin
        @(negedge clk);
        in = $random % 2;   // limit to 0 or 1

        if (out == 1'b1)
            $display("Pass: Sequence 11 detected at time %0t", $time);
    end

    #50;
    $finish;
end

// Dump for waveform
initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, seq_det_11_mealy_tb);
end

endmodule
