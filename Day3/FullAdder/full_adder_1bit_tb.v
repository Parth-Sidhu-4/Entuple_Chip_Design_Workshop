`timescale 1ns / 1ps

module full_adder_1bit_tb();

reg A, B, Cin;
wire Sum, Cout;

// DUT
full_adder_1bit fadd_inst (A, B, Cin, Cout, Sum);

initial
begin
    A = 1'b0; B = 1'b0; Cin = 1'b0;
    #5 A = 1'b0; B = 1'b0; Cin = 1'b1;
    #5 A = 1'b0; B = 1'b1; Cin = 1'b0;
    #5 A = 1'b0; B = 1'b1; Cin = 1'b1;
    #5 A = 1'b1; B = 1'b0; Cin = 1'b0;
    #5 A = 1'b1; B = 1'b0; Cin = 1'b1;
    #5 A = 1'b1; B = 1'b1; Cin = 1'b0;
    #5 A = 1'b1; B = 1'b1; Cin = 1'b1;
end

initial #50 $finish;

endmodule
