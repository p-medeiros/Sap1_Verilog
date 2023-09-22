// rem_and_mux - registrador de 4 bits com mux de 1 bit
module ALS_REM_e_MUX_AA (
  input [3:0] d,
  input [3:0] a,
  input n_lm,
  input clk,
  input ch_s2,
  output [3:0] s 
);
  wire [3:0] s1;
  ALS_CI74173 ALS_CI74173_inst (
    .d(d),
    .rst(1'b0),
    .clk(clk),
    .e_saida(1'b1),
    .n_IE(n_lm),
    .q(s1)
  );
ALS_CI74157 ALS_CI74157_inst (
      .d0(a),
      .d1(s1),
      .sel(ch_s2),
      .s(s)
    );
endmodule 
