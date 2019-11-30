// Made by: Erick

module Debouncer
(
    input i_Clk,       // Clock de 2kHz para diminuir o tamanho do r_Counter
    input i_Button,         // Sinal cru do botão
    output o_ButtonDeb,     // Estado do botão (1 ou 0)
    output o_ButtonDown,    // Detecta borda de descida do sinal
    output o_ButtonUp       // Detecta borda de subida do sinal
);

    /* Sincronizo o estado do botão com 1 pulso de clock para evitar a
    metaestabilidade r_ButtonSync é o sinal do botão  sincronizado com o clock,
    ele quem eu vou utilizar para fazer o debouncing */

    reg r_ButtonSync, r_Intermediario;

    // initial	r_Intermediario = 1'b 1;
    // initial	r_ButtonSync = 1'b 1;

    always @(posedge i_Clk)
    begin
        r_Intermediario <= i_Button;
        r_ButtonSync <= r_Intermediario;
    end

    assign o_ButtonDeb = r_ButtonSync;

    // Edges detectors
    EdgeDetector #(.Type(1)) PosEdge
    (
        .sig(r_ButtonSync),
        .clk(i_Clk),
        .detect(o_ButtonUp)
    );

    EdgeDetector #(.Type(0)) NegEdge
    (
        .sig(r_ButtonSync),
        .clk(i_Clk),
        .detect(o_ButtonDown)
    );

endmodule