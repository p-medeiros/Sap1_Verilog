module SomadorSubtrator (
  input [7:0] A,  // Entrada A de 4 bits
  input [7:0] B,  // Entrada B de 4 bits
  //input Cin,      // Entrada de carry de entrada
  input Subtrair, // Sinal de controle para subtrair
  input eu,
  output [8:0] S, // Saída de 4 bits
  output Cout     // Saída de carry de saída
);

  wire [7:0] B_neg;   // Valor negativo de B
  wire [7:0] B_sub;   // B ou B_neg, dependendo do sinal de controle
  wire [8:0] Sum;     // Soma de A, B_sub e Cin

  // Inversor de B para calcular B_neg
  assign B_neg = ~B + 1;

  // Seleciona B ou B_neg com base no sinal de controle Subtrair
  assign B_sub = (Subtrair) ? B_neg : B;

  // Calcula a soma de A, B_sub e Cin
  assign Sum = A + B_sub ;//+ Cin;

  // A saída S é a parte inferior de Sum (4 bits)
  assign S = eu ? Sum[7:0] : 8'bZ ;

  // A saída Cout é o bit mais significativo de Sum
  assign Cout = eu ? Sum[8] : 8'bZ;

endmodule