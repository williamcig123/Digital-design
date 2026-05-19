module tb;
  logic [3:0] A, B;
  logic cin;
  wire [3:0] S;
  wire cout;
  
  adder_4bit dut(A, B, cin, S, cout);
  initial begin
  $dumpfile("dump.vcd");
  $dumpvars(1);
  
  A = 4'b0010; B = 4'b0011; cin = 0; #10;
  A = 4'b0010; B = 4'b0001; cin = 1; #10;
  A = 4'b1111; B = 4'b0001; cin = 0; #10;
  
  $finish;
  end
endmodule
