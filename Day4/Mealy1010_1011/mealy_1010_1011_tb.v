`timescale 1ns/1ps
// `include "seq_det_1010_1001_mealy.v"

module seq_det_1010_1001_tb;

reg clk, reset, din;
wire dout;
integer i;

// Instantiate DUT
seq_det_1010_1001_mealy DUT (
    .clk(clk),
    .reset(reset),
    .din(din),
    .dout(dout)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Stimulus
reg [15:0] test_seq = 16'b1010010010101001;

initial begin
    reset = 1'b1;
    din = 0;

    #10;
    reset = 1'b0;

    // Apply sequence bit by bit (MSB first)
    for (i = 15; i >= 0; i = i - 1) begin
        @(negedge clk);
        din = test_seq[i];

        // Display activity
        $display("Time=%0t | din=%b | dout=%b", $time, din, dout);

        if (dout)
            $display(">>> Sequence detected at time %0t", $time);
    end

    #20;
    $finish;
end

// Dump waveform
initial begin
    $dumpfile("seq_detect_combined.vcd");
    $dumpvars(0, seq_det_1010_1001_tb);
end

endmodule
