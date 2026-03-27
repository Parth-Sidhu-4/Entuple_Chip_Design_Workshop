`timescale 1ns/1ps

module seq_det_11_mealy(
    input clk,
    input reset,
    input din,
    output reg dout
);

parameter S0 = 0, S1 = 1;
reg state, next_state;

// State Transition
always @(posedge clk or posedge reset)
begin
    if (reset)
        state <= S0;
    else
        state <= next_state;
end

// State Machine Logic
always @(*)
begin
    case(state)
        S0: begin
            dout = 1'b0;
            if (din)
                next_state = S1;
            else
                next_state = S0;
        end

        S1: begin
            if (din) begin
                next_state = S1;
                dout = 1'b1;
            end else begin
                next_state = S0;
                dout = 1'b0;
            end
        end

        default: begin
            next_state = S0;
            dout = 1'b0;
        end
    endcase
end

endmodule
