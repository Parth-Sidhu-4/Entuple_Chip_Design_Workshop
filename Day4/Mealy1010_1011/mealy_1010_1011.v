`timescale 1ns/1ps

module seq_det_1010_1001_mealy(
    input clk, reset, din,
    output reg dout
);

parameter S0=0, S1=1, S2=2, S3=3, S4=4;
reg [2:0] state, next_state;

// State Transition
always @(posedge clk or posedge reset)
begin
    if (reset)
        state <= S0;
    else
        state <= next_state;
end

// State Machine Logic (Mealy)
always @(state or din)
begin
    case(state)

        // No match
        S0: begin
            dout = 0;
            if (din)
                next_state = S1;
            else
                next_state = S0;
        end

        // Seen '1'
        S1: begin
            dout = 0;
            if (~din)
                next_state = S2; // "10"
            else
                next_state = S1; // stay at "1"
        end

        // Seen "10"
        S2: begin
            dout = 0;
            if (din)
                next_state = S3; // "101"
            else
                next_state = S4; // "100"
        end

        // Seen "101"
        S3: begin
            if (~din) begin
                dout = 1;          // "1010" detected
                next_state = S2;   // overlap → "10"
            end else begin
                dout = 0;
                next_state = S1;   // "1"
            end
        end

        // Seen "100"
        S4: begin
            if (din) begin
                dout = 1;          // "1001" detected
                next_state = S1;   // overlap → "1"
            end else begin
                dout = 0;
                next_state = S0;
            end
        end

        default: begin
            dout = 0;
            next_state = S0;
        end

    endcase
end

endmodule
