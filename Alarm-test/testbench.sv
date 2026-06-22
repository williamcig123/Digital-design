module testcarro;
  reg chave, cinto;
  wire alarme;
  
  carro dut(
    .chave(chave),
    .cinto(cinto),
    .alarme(alarme)
  );
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    chave = 0; cinto = 0; #5;
    chave = 0; cinto = 1; #5;
    chave = 1; cinto = 0; #5;
    chave = 1; cinto = 1; #5;
    $finish;
  end
