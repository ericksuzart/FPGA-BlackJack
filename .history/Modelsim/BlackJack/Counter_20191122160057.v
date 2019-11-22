// Made by: Erick

module Counter
#(parameter WIDTH=12)
(
    input clk_50M,              // 50 MHz clock
    input clk_2K,               // 2 kHz clock
    input i_RstCounter,         // Input para zerar o contador
    // -----------------------------------------------
    input i_ActCounter,         // Input para ativar o contador no clk de 2 kHz
    input i_Reset,              // Input do debouncer do botão de reset
    // -----------------------------------------------
    output [WIDTH-1:0] o_Count, // Saida do contador
    output reg o_TwoSec         // Output que indica se passaram 2 segundos
);

    // Registrador para armazenar o numero do contador
    reg [WIDTH-1:0] r_Count;

    // Incrementa o contador a partir do clock de 50 MHz se o reset estiver ativo
    // Zera o contador na subida de i_RstCounter 
    always @ (posedge clk_50M or posedge i_RstCounter)
    begin
        if (i_RstCounter)
            r_Count <= 0;
            o_TwoSec <= 0;
        else if (i_Reset)
            r_Count <= r_Count + 1;
    end

    // Incrementa o contador a partir do clock de 2 kHz se i_ActCounter
    always @ (posedge clk_2K)
    begin
        if (i_ActCounter && r_Count < 2**(WIDTH) - 1)
            r_Count <= r_Count + 1;
        else if (r_Count == 2**(WIDTH) - 1)
            o_TwoSec <= 1;
    end

    assign o_Count = r_Count;
endmodule
