`timescale 1ns/1ps
module multiplier(
    input a0,
    input a1,
    input b0,
    input b1,
    output c0,
    output c1,
    output c2,
    output c3
);

  wire p1, p2, p3;
  wire carry;
  
  assign c0 = a0 & b0; // LSB
  assign p1 = a0 & b1;
  assign p2 = a1 & b0;
  assign p3 = a1 & b1;

  assign c1 = p1 ^ p2; // sum of middle bits
  assign carry = p1 & p2; // carry from middle bit sum
  assign c2 = p3 ^ carry; // next bit
  assign c3 = p3 & carry; // MSB

endmodule
