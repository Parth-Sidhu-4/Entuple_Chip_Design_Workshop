// mealy circuit for 1010 sequence- RTL
`timescale 1ns/1ps
module seq_det_1010_mealy(
   input clk, reset, din,
   output reg dout); 

  parameter S0=0, S1=1, S2=2, S3=3; 
  reg [2:0] state, next_state;
  // state transistion
  always @(posedge clk or posedge reset)
   begin 
     if (reset) 
      state<=S0;
    else 
     state<=next_state;
   end
   
  // state machine coding
  always @(state or din) 
    begin
      case(state)
        S0: begin
          dout <=1'b0;
          if(din)
            next_state <= S1;
          else 
             next_state <= S0;
        end

//continued
       S1: begin
          dout <= 1'b0;
          if(~din)
             next_state <= S2;
          else 
             next_state <= S1;
        end
        S2: begin
          dout <= 1'b0;
          if(din)
             next_state <= S3;
          else
             next_state <= S0;
        end
        S3: begin
          if(~din) begin
             //S0, Non Overlapping, S2 for Overlapping
             next_state <= S0;  
             dout  <= 1'b1; 
          end else begin 
             next_state <= S2;
            dout  <= 1'b0;
          end
        end
        default: begin 
           dout <= 0; 
        end
      endcase
    end
endmodule
