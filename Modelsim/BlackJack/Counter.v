// Made by: Erick

module Counter
#(parameter WIDTH=12)
(
    input clk_2K,               // 2 kHz clock
    // -----------------------------------------------
    input i_ActCounter,         // Input para ativar o contador no clk de 2 kHz
    input i_RstCounter,           // Input para zerar o contador em 1
    input i_Reset,              // Input do debouncer do botão de reset, ativa em zero
    // -----------------------------------------------
    output [WIDTH-1:0] o_Count, // Saida do contador
    output wire o_TwoSec        // Output que indica se passaram 2 segundos
);
    wire ne_Reset; // Detecta uma borda de descida do reset

    EdgeDetector #(.Type(0)) NegEdgeDetector
    (
        .sig(i_Reset),
        .clk(clk_2K),
        .detect(ne_Reset)
    );

    // Registrador para armazenar o numero do contador
    reg [WIDTH-1:0] r_Count;

    // Incrementa o contador a partir do clock de 2 kHz se i_ActCounter
    always @ (posedge clk_2K)
    begin
        if (ne_Reset)
            r_Count <= 0;
        else if (!i_Reset)
            r_Count <= r_Count + 1;
        else if (i_Reset && i_RstCounter)
            r_Count <= 0;
        else if (i_Reset && !i_RstCounter && i_ActCounter && r_Count < 2**(WIDTH) - 1)
            r_Count <= r_Count + 1;
    end

    // Atribuição ternária da saída o_TwoSec
    assign o_TwoSec = (i_ActCounter && i_Reset && !i_RstCounter && r_Count == 2**(WIDTH) - 1)? 1: 0;

    // Atribuição da saída como a saída do registrador
    assign o_Count = r_Count;
endmodule
