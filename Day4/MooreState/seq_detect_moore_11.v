`timescale 1ns/1ps
// Moore State Machine - Sequence to detect 11

module seq_det_11_moore(input clk, reset, din, output reg dout);
parameter S0 = 0, S1 = 1, S2 = 2;
reg[1:0] state;
// State Transition
always @(posedge clk or posedge reset)
begin
if (reset) begin
state <= S0;
	dout <= 0;

// State Machine Coding
end else begin
case(state)
S0: begin
dout <= 1'b0;
if(din)
state <= S1;
else
state <= S0;
end
S1:begin
if(din) begin
state <= S2; dout <= 1'b1;
end else begin
state <= S0; dout <= 1'b0;
end
end
S2:begin
if (din) begin
state <= S2; dout <= 1'b1;
end else begin
state <= S0; dout <= 1'b0;
end
end
default: begin
dout <= 0; state <= S0;
end
endcase
end
end
endmodule

