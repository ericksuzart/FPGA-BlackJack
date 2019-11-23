// Made by: Erick

module Counter
#(parameter WIDTH=12)
(
    input clk_2K,               // 2 kHz clock
    input i_RstCounter,         // Input para zerar o contador
    // -----------------------------------------------
    input i_ActCounter,         // Input para ativar o contador no clk de 2 kHz
    input i_Reset,              // Input do debouncer do botão de reset
    // -----------------------------------------------
    output [WIDTH-1:0] o_Count, // Saida do contador
    output wire o_TwoSec        // Output que indica se passaram 2 segundos
);

    // Registrador para armazenar o numero do contador
    reg [WIDTH-1:0] r_Count;

    // Incrementa o contador a partir do clock de 2 kHz se i_ActCounter
    always @ (posedge clk_2K or posedge i_RstCounter)
    begin
        if (i_RstCounter)
        begin
            r_Count <= 0;
        end else if (~i_Reset && ~i_ActCounter)
        begin
            r_Count <= r_Count + 1;
        end else if (i_Reset && i_ActCounter && r_Count < 2**(WIDTH) - 1)
            r_Count <= r_Count + 1;
    end

    // Atribuição ternária da saída o_TwoSec
    assign o_TwoSec = 1? (i_ActCounter && i_Reset && r_Count == 2**(WIDTH) - 1): 0;

    // Atribuição da saída como a saída do registrador
    assign o_Count = r_Count;
endmodule
