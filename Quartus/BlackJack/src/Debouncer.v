// Made by: Erick

module Debouncer
(
    input i_Clk_2kHz,       // Clock de 2kHz para diminuir o tamanho do r_Counter
    input i_Button,         // Sinal cru do botão
    output o_ButtonDeb, // Estado do botão (1 ou 0)
    output o_ButtonDown,    // Detecta borda de descida do sinal
    output o_ButtonUp       // Detecta borda de subida do sinal
);

    /* Sincronizo o estado do botão com 1 pulso de clock para evitar a
    metaestabilidade r_ButtonSync é o sinal do botão  sincronizado com o clock,
    ele quem eu vou utilizar para fazer o debouncing */

    reg r_ButtonSync, r_Intermediario;

    initial	r_Intermediario = 1'b 1;
    initial	r_ButtonSync = 1'b 1;

    always @(posedge i_Clk_2kHz)
    begin
        {r_ButtonSync, r_Intermediario} <= {r_Intermediario, i_Button};    
    end

    assign o_ButtonDeb = r_ButtonSync;

    // Edges detectors
    EdgeDetector #(.Type(1)) PosEdge
    (
        .sig(r_ButtonSync),
        .clk(i_Clk_2kHz),
        .detect(o_ButtonUp)
    );

    EdgeDetector #(.Type(0)) NegEdge
    (
        .sig(r_ButtonSync),
        .clk(i_Clk_2kHz),
        .detect(o_ButtonDown)
    );

    /* Detectar um evento de mudança no estado do botão, ela só será verdadeira
    uma vez a cada vez que i_Button passar de um para o outro.*/

    // reg r_ButtonLast, r_ButtonEvent;
    // initial	r_ButtonLast = 1'b 1;
    // initial	r_ButtonEvent = 1'b 0;

    // always @(posedge i_Clk_2kHz)
    // begin
    //     r_ButtonLast <= r_ButtonSync;
    //     r_ButtonEvent <= (r_ButtonSync)&&(!r_ButtonLast);
    // end

    // Debouncer propriamente dito
    /* tempo de "bouncing" do sinal
        Contador de 6 bits
        2.6 ms = 0,0026 s / (1/2000 Hz) = 52 ciclos <= 2**6 = 64 
        2.6 ms = 0,0026 s * 50000000 Hz = 130000 ciclos <= 2**17 = 131072
    */

    /* timer representa um temporizador (contador de 6 bits) que dado o sinal
    ele irá contar até chegar em zero, e quando isso acontecer o sinal
    o_ButtonDeb vai pra 1 (representando o sinal que passou pelo debouncer) */

    // reg timer;
    // initial timer = {(6){1'b 1}}; // contador de 6 bits com tudo em 1

    // always @(posedge i_Clk_2kHz)
    // begin
    //     if(r_ButtonEvent)
    //         timer = {(6){1'b 1}};
    //     else if (timer == 1'b 0)
    //         o_ButtonDeb <= r_ButtonSync;
    //     else
    //         timer <= timer - 1'b 1;
    // end

    /* Inicialização da saída o_ButtonDeb, se o botão ativa em zero então ele
    inicializa em 1 */

endmodule