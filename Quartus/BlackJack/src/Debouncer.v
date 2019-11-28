// Made by: Erick

module Debouncer
(
    input i_Clk_2kHz,       // Clock de 2kHz para diminuir o tamanho do r_Counter
    input i_Button,         // Sinal cru do botão
    output reg o_State,     // Estado do botão (1 ou 0)
    output o_ButtonDown,    // Detecta borda de descida do sinal
    output o_ButtonUp       // Detecta borda de subida do sinal
);

    // sync with clock to combat metastability
    reg r_Sync0, r_Sync1;
    always @(posedge i_Clk_2kHz) r_Sync0 <= i_Button;
    always @(posedge i_Clk_2kHz) r_Sync1 <= r_Sync0;

    /*
        2.6 ms = 0,0026 s * 2000 Hz = 5,2 ciclos <= 2**3 - 1 = 7 
    */

    reg [2:0] r_Counter; // ~2.6 ms r_Counter at 2 kHz
    wire Iddle = (o_State == r_Sync1);
    wire Max = &r_Counter; // Se todos os Bits do contador forem 1, Max = 1

    always @(posedge i_Clk_2kHz)
    begin
        if (Iddle)
            r_Counter <= 0;
        else
        begin
            r_Counter <= r_Counter + 1;
            if (Max)
                o_State <= ~o_State;
        end
    end

    assign o_ButtonDown = ~Iddle & Max & ~o_State;
    assign o_ButtonUp = ~Iddle & Max & o_State;
endmodule