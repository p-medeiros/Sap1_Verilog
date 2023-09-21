module testbench;

  // Defina os sinais de entrada
  reg [7:0] A;
  reg [7:0] B;
  reg Cin;
  reg Subtrair;

  // Defina os sinais de saída
  wire [8:0] S;
  wire Cout;

  // Instancie o seu módulo (somador-subtrator de 8 bits)
  SomadorSubtrator uut (
    .A(A),
    .B(B),
    .Cin(Cin),
    .Subtrair(Subtrair),
    .S(S),
    .Cout(Cout)
  );

  // Simule o comportamento
  initial begin
    // Inicialize os sinais de entrada
    A = 8'b00101100;
    B = 8'b11010110;
    Cin = 0;
    Subtrair = 0;

    // Aplique os estímulos
    #10 A = 8'b10101101;
    #10 B = 8'b01101011;
    #10 Cin = 1;
    #10 Subtrair = 1;

    // Verifique os resultados
    #10 if (S !== 8'b01100011 || Cout !== 0) $display("Teste falhou!");

  end

endmodule
