`timescale 1ns / 1ps

module half_adder_tb;

    reg A, B;
    wire Sum, Carry;

    // DUT
    half_adder dut (A, B, Sum, Carry);

    initial 
    begin
        A = 0; B = 0;
	#5 A = 0; B = 1;
	#5 A = 1; B = 0;
	#5 A = 1; B = 1;
    end

    // always #5 A = ~A;
    // always #10 B = ~B; 

    initial #30 $finish;
endmodule
