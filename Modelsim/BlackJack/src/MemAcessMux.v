module MemAcessMux
(
    input ActShuffler,
    
    // Address part
    input [5:0] i_ShufflerAddr,
    input [5:0] i_AdderAddress,
    output reg [5:0] o_Address,

    // Clock part
    input i_ShufflerClk,
    input i_AdderClk,
    output reg o_MemClk
);

    /*
        Esse módulo nos indica a prioridade de acesso a memória, visto que a
        mesma não deve ser acessada simultaneamente por distintos módulos.

        As entradas de test são utilizadas apenas no testbench
    */

    always @(*)
    begin
        case (ActShuffler)
            1'b 1 :
                begin
                    o_Address = i_ShufflerAddr;
                    o_MemClk = i_ShufflerClk;
                end
            1'b 0 :
                begin
                    o_Address = i_AdderAddress;
                    o_MemClk = i_AdderClk;
                end
        endcase
    end

endmodule // MemAcessMux