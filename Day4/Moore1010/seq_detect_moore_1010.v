// moore circuit for sequence 1010
`timescale 1ns/1ps
module seq_det_1010_moore(
  input clk, reset, din, 
  output reg dout); 
  parameter S0=0, S1=1, S2=2, S3=3, S4=4; 
  reg [2:0] state;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      dout <= 1'b0;
      state <= S0;
    end
    else begin
      case(state)
        S0: begin
          dout <=1'b0;
          if(din)
            state <= S1;
          else 
            state <= S0;
        end
        S1: begin
          dout <= 1'b0;
          if(~din)
            state <= S2;
          else 
            state <= S1;
        end   

//continued
       S2: begin
          dout <= 1'b0;
          if(din)
            state <= S3;
          else
            state <= S0;
        end
        S3: begin
         if(~din) begin
            state <= S4; dout <= 1'b1;
          end else begin 
            state <= S1; dout <= 1'b0;
          end
        end
    S4: begin
         if(din) begin
     // S1-Non overlapping, S3-Overlapping
            state <= S3; dout <= 1'b1;
          end else begin 
            state <= S0; dout <= 1'b0;
          end
        end
        default: begin 
           dout <= 0; 
        end
      endcase
    end
  end


endmodule
