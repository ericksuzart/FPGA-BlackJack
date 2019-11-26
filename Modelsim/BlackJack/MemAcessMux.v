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

    always @(*)
    begin
        case (ActShuffler)
            1 :
                begin
                    o_Address = i_ShufflerAddr;
                    o_MemClk = i_ShufflerClk;
                end
            0 :
                begin
                    o_Address = i_AdderAddress;
                    o_MemClk = i_AdderClk;
                end
        endcase
    end

endmodule // MemAcessMux