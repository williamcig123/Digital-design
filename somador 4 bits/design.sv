module full_adder(
  input logic a, b, cin,
  output logic sum, cout
);
  assign sum = a ^ b ^ cin;
  assign cout = (a & b ) | (cin & (a ^ b));
endmodule

module adder_4bit (
  input [3:0] A, B,
  input logic cin,
  output logic [3:0] S,
  output logic cout
);
  wire c1, c2, c3;
  
  full_adder fa0 (A[0], B[0], cin, S[0], c1);
  full_adder fa1 (A[1], B[1], c1, S[1], c2);
  full_adder fa2 (A[2], B[2], c2, S[2], c3);
  full_adder fa3 (A[3], B[3], c3, S[3], cout);
endmodule
  
  
