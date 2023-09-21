// acumulador - registrador 8 bits usando 2 ci74173 com saida com tri-state
module ALS_Acumulador (
  input [7:0] d,
  input clk,
  input ea,
  input n_write,
  output [15:0] s
);
  wire [7:0] result;
  ALS_CI74173 ALS_CI74173_inst1 (
    .d(d[3:0]),
    .clk(clk),
    .rst(1'b0),
    .n_IE(n_write),
    .e_saida(1'b1),
    .q(result[3:0])
  );

  ALS_CI74173 ALS_CI74173_inst2 (
    .d(d[7:4]),
    .clk(clk),
    .rst(1'b0),
    .n_IE(n_write),
    .e_saida(1'b1),
    .q(result[7:4])
  );

  assign s = {ea ? result : 8'bZ, result};
endmodule 
