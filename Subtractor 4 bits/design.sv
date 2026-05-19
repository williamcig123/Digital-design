//Listando as entradas e saídas
module Full_adder (
  input A,
  input B,
  input Cin,
  output Sum,
  output Cout
);
  //Descrevendo o comportamento das portas lógicas
  assign Sum = A ^ B ^ Cin;
  assign Cout = (A & B) | (A & Cin) | (B & Cin);
endmodule
module subtrator_4bits (
  input [3:0] A, //Indica que possue 4 bits(do MSB ao LSB)
  input [3:0] B, //Indica que possue 4 bits(do MSB ao LSB)
  input sub, //É o sinal de controle que utiliza 1 para subtrair e 0 para somar
  output [3:0] Sum, //É o total em 4 bits
  output Cout //É o estouro
);
  wire C1,C2,C3; //Fios para conectar os carry out aos somadores
  wire [3:0] B_xor; //Fios para guardar os valores de B após passar pelo xor de controle
  //Conectando cada valor de B na porta xor com o valor de sub
  assign B_xor[0] = B[0] ^ sub;
  assign B_xor[1] = B[1] ^ sub;
  assign B_xor[2] = B[2] ^ sub;
  assign B_xor[3] = B[3] ^ sub;
  
  //Criando uma instância e conexão dos 4 somadores
Full_adder fa0 (.A(A[0]), .B(B_xor[0]), .Cin(sub), .Sum(Sum[0]), 	.Cout(C1));                                                Full_adder fa1 (.A(A[1]), .B(B_xor[1]), .Cin(C1), .Sum(Sum[1]), 		.Cout(C2));                                                Full_adder fa2 (.A(A[2]), .B(B_xor[2]), .Cin(C2), .Sum(Sum[2]), 		.Cout(C3));
Full_adder fa3 (.A(A[3]), .B(B_xor[3]), .Cin(C3), .Sum(Sum[3]), 	.Cout(Cout));
endmodule
    
