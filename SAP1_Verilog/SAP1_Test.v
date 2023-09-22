module SAP1_Test;

  // Parâmetros
  parameter CLK_PERIOD = 10; // Período do clock em unidades de tempo

  // Sinais de entrada
  reg clk;
  reg n_clr;
  reg ch_s2;
  reg ch_s4;
  reg [3:0] a;
  reg [7:0] d;

  // Sinais de saída
  wire [7:0] out;
  wire [7:0] barramento_principal;
  wire [3:0] temp;
  wire [7:0] temp_mem;
  wire [3:0] temp_endereco;
  wire [7:0] temp_regB;
  wire [7:0] temp_acumulador;
  wire [5:0] temp_ring_counter;
  wire n_hlt, ep, cp, n_lm, n_ce, n_l1, n_e1, n_la, ea, su, eu, n_lb, n_l0;

  // Instanciando o módulo SAP-1
  SAP1_Verilog sap1_inst (
    .clk(clk),
    .n_clr(n_clr),
    .ch_s2(ch_s2),
    .ch_s4(ch_s4),
    .a(a),
    .d(d),
    .out(out),
    .barramento_principal(barramento_principal),
    .temp(temp),
    .temp_mem(temp_mem),
    .temp_endereco(temp_endereco),
    .temp_regB(temp_regB),
    .temp_acumulador(temp_acumulador),
    .temp_ring_counter(temp_ring_counter),
    .n_hlt(n_hlt),
    .ep(ep),
    .cp(cp),
    .n_lm(n_lm),
    .n_ce(n_ce),
    .n_l1(n_l1),
    .n_e1(n_e1),
    .n_la(n_la),
    .ea(ea),
    .su(su),
    .eu(eu),
    .n_lb(n_lb),
    .n_l0(n_l0)
  );

  // Teste de inicialização
  initial begin
    $dumpfile("sap1_test.vcd");
    $dumpvars(0, SAP1_Test);
    $display("Iniciando teste do SAP-1...");

    // Configurações iniciais
    clk = 0;
    n_clr = 0;
    ch_s2 = 0;
    ch_s4 = 0;
    a = 4'b0000;
    d = 8'b00000000;

    // Reset
    n_clr = 1;
    #2;
    n_clr = 0;

    // Ciclo de clock
    repeat(10) begin
      clk = ~clk;
      #CLK_PERIOD;
    end

    // Realize aqui os testes específicos do SAP-1, como carregar dados na memória, executar instruções, etc.
    // ...
	n_clr = 1;
    	ch_s2 = 1;
    	ch_s4 = 1;
    $display("Teste do SAP-1 concluído.");
  end

  always begin
    # (CLK_PERIOD / 2);
	 clk = ~clk; // Gere o clock
  end

endmodule
