// half adder
module half_adder(S, C, A, B);
output S, C;
input A, B;

assign S = A ^ B;
assign C = A & B;
endmodule

// full adder
module full_adder_1bit (input A,
	input B,
	input Cin,
	output Cout,
	output Sum);

wire s_temp, c_temp, c_temp1;

half_adder hadd_inst1(.A(A), .B(B), .S(s_temp), .C(c_temp));
half_adder hadd_inst2(.A(s_temp), .B(Cin), .S(Sum), .C(c_temp1));
assign Cout = c_temp1 | c_temp;
endmodule
