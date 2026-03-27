`timescale 1ns / 1ps

module half_adder (A, B, Sum, Carry);
    input A, B;
    output Sum, Carry;

    assign Sum   = A ^ B;  
    assign Carry = A & B;  

endmodule
