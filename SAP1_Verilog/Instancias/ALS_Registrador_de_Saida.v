// registrador_8bits - registrador 8 bits usando 2 ci74173
module ALS_Registrador_de_Saida (
  input [7:0] d,
  input clk,
  input n_write,
  output [7:0] s
);
  
  ALS_CI74173 ALS_CI74173_inst1 (
    .d(d[3:0]),
    .clk(clk),
    .rst(1'b0),
    .n_IE(n_write),
    .e_saida(1'b1),
    .q(s[3:0])
  );

  ALS_CI74173 ALS_CI74173_inst2 (
    .d(d[7:4]),
    .clk(clk),
    .rst(1'b0),
    .n_IE(n_write),
    .e_saida(1'b1),
    .q(s[7:4])
  );
endmodule 
