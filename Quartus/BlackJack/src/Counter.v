// Made by: Erick

module Counter
#(parameter WIDTH=12)
(
    input clk_2K,               // 2 kHz clock
    // -----------------------------------------------
    input i_ActCounter,         // Input para ativar o contador no clk de 2 kHz
    input i_RstCounter,         // Input para zerar o contador em 1
    input i_Reset,              // Input do debouncer do botão de reset, ativa em zero
    // -----------------------------------------------
    output [WIDTH-1:0] o_Count, // Saida do contador
    output wire o_TwoSec,       // Output que indica se passaram 2 segundos
    output reg o_RstOK          // Indica se o contador foi resetado com Sucesso para a FSM global
);

    // Registrador para armazenar o numero do contador
    reg [WIDTH-1:0] r_Count;

    // Incrementa o contador a partir do clock de 2 kHz se i_ActCounter
    always @ (posedge clk_2K)
    begin
        if (!i_Reset)
            r_Count <= 0;

        else if (!i_Reset)
            r_Count <= r_Count + 1;

        else if (i_RstCounter)
        begin
            r_Count <= 0;
            o_RstOK <= 1;
        end

        // O operador ~& faz um NAND no contador, e retorna 0 caso todos os bits
        // dele forem 1
        else if (i_ActCounter && ~&r_Count)
            r_Count <= r_Count + 1;
    end

    // Atribuição ternária da saída o_TwoSec
    assign o_TwoSec = 1? (i_ActCounter && i_Reset && !i_RstCounter && &r_Count): 0;

    // Atribuição da saída como a saída do registrador
    assign o_Count = r_Count;
endmodule