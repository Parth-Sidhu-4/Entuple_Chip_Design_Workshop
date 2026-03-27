// Verilog Design for Mux and a Latch
 // ===================

`timescale 1ns / 1ps
module mux_ff_ex(i0, i1, i2, i3, clk, resetn, sel, q);

    input clk, resetn;
    input i0, i1, i2, i3;
    input [1:0] sel;
    output q;

    reg q_out;
    wire mux_out;

    // concurrent assignments
    assign q = q_out;
    assign mux_out = (sel[1] ? (sel[0] ? i3 : i2) : (sel[0] ? i1 : i0));

    // procedural
    always @(posedge clk or negedge resetn)
    begin
        if (!resetn)
            q_out <= 1'b0;
        else
            q_out <= mux_out;
    end

endmodule
