module testbench;
  //Fios para conectar as entradas do subtrator
  reg [3:0] A;
  reg [3:0] B;
  reg sub;
  
  //Conectando as saídas do subtrator
  wire [3:0] Sum;
  wire Cout;
  
  //Instanciando o circuito de teste
  subtrator_4bits dut(
    .A(A),
    .B(B),
    .sub(sub),
    .Sum(Sum),
    .Cout(Cout)
  );
  
  //Exibe os valores e as mudanças de acordo com o tempo 
  initial begin 
    $monitor("Tempo=%0d | A=%b (%d) | B=%b (%d) | sub=%b | Resultado Sum=%b | Cout=%b",
    	$time, A,A,B,B,sub,Sum,Cout);
	//% = especificadores de formato
	//%0d(conectado a time) = exibe o tempo de simulação convertendo de binário para decimal sem espaços em branco a esquerda por causa do zero.
	//%b = Binário que faz com que o valor do vetor em bits seja impresso em 0's e 1's.
    
    //Aplicando a subtração de 5 e 7
    A = 4'b0101;
    B = 4'b0111;
    sub = 1;
    #10;
    $finish;
  end
endmodule
    
    
