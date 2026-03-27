`timescale 1ns / 1ps

module full_adder (A, B, Cin, Sum, Carry);

input A, B, Cin;
output Sum, Carry;
wire Sum1, Carry1, Carry2;
half_adder HA1 (A, B, Sum1, Carry1);
half_adder HA2 (Sum1, Cin, Sum, Carry2);
assign Carry = Carry1 | Carry2;

endmodule
