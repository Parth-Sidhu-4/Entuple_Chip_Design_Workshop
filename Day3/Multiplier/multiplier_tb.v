`timescale 1ns/1ps

module tb_multiplier;

  reg a0, a1, b0, b1;
  wire c0, c1, c2, c3;
  reg [3:0] P;

  multiplier uut (
      .a0(a0),
      .a1(a1),
      .b0(b0),
      .b1(b1),
      .c0(c0),
      .c1(c1),
      .c2(c2),
      .c3(c3)
  );

  initial begin
    $display("A B | Product");
    $display("----------------");

    // 16 input combinations
    a1=0; a0=0; b1=0; b0=0; #10; P={c3,c2,c1,c0}; $display("00 00 | %b", P);
    a1=0; a0=0; b1=0; b0=1; #10; P={c3,c2,c1,c0}; $display("00 01 | %b", P);
    a1=0; a0=0; b1=1; b0=0; #10; P={c3,c2,c1,c0}; $display("00 10 | %b", P);
    a1=0; a0=0; b1=1; b0=1; #10; P={c3,c2,c1,c0}; $display("00 11 | %b", P);

    a1=0; a0=1; b1=0; b0=0; #10; P={c3,c2,c1,c0}; $display("01 00 | %b", P);
    a1=0; a0=1; b1=0; b0=1; #10; P={c3,c2,c1,c0}; $display("01 01 | %b", P);
    a1=0; a0=1; b1=1; b0=0; #10; P={c3,c2,c1,c0}; $display("01 10 | %b", P);
    a1=0; a0=1; b1=1; b0=1; #10; P={c3,c2,c1,c0}; $display("01 11 | %b", P);

    a1=1; a0=0; b1=0; b0=0; #10; P={c3,c2,c1,c0}; $display("10 00 | %b", P);
    a1=1; a0=0; b1=0; b0=1; #10; P={c3,c2,c1,c0}; $display("10 01 | %b", P);
    a1=1; a0=0; b1=1; b0=0; #10; P={c3,c2,c1,c0}; $display("10 10 | %b", P);
    a1=1; a0=0; b1=1; b0=1; #10; P={c3,c2,c1,c0}; $display("10 11 | %b", P);

    a1=1; a0=1; b1=0; b0=0; #10; P={c3,c2,c1,c0}; $display("11 00 | %b", P);
    a1=1; a0=1; b1=0; b0=1; #10; P={c3,c2,c1,c0}; $display("11 01 | %b", P);
    a1=1; a0=1; b1=1; b0=0; #10; P={c3,c2,c1,c0}; $display("11 10 | %b", P);
    a1=1; a0=1; b1=1; b0=1; #10; P={c3,c2,c1,c0}; $display("11 11 | %b", P);

    $finish;
  end

endmodule
