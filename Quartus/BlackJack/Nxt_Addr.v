module Nxt_Addr
(
    input wire [5:0] Addr_i,
    input wire [11:0] Count,
    output reg [5:0] Addr_j
);
    always @(*)
    begin
        case (Addr_i)
            0 :  Addr_j = {Count[11], Count[10], Count[9], Count[8], Count[7], Count[6]} % 52;
            1 :  Addr_j = {Count[10], Count[9], Count[5], Count[4], Count[3], Count[2]} % 52;
            2 :  Addr_j = {Count[11], Count[8], Count[7], Count[6], Count[5], Count[1]} % 52;
            3 :  Addr_j = {Count[10], Count[9], Count[8], Count[7], Count[4], Count[3]} % 52;
            4 :  Addr_j = {Count[11], Count[8], Count[6], Count[5], Count[2], Count[1]} % 52;
            5 :  Addr_j = {Count[10], Count[9], Count[8], Count[7], Count[6], Count[4]} % 52;
            6 :  Addr_j = {Count[11], Count[8], Count[5], Count[3], Count[2], Count[1]} % 52;
            7 :  Addr_j = {Count[10], Count[9], Count[8], Count[7], Count[6], Count[5]} % 52;
            8 :  Addr_j = {Count[11], Count[8], Count[4], Count[3], Count[2], Count[1]} % 52;
            9 :  Addr_j = {Count[10], Count[9], Count[8], Count[7], Count[6], Count[0]} % 52;
            10 : Addr_j = {Count[11], Count[8], Count[5], Count[4], Count[3], Count[2]} % 52;
            11 : Addr_j = {Count[10], Count[9], Count[8], Count[7], Count[6], Count[1]} % 52;
            12 : Addr_j = {Count[11], Count[8], Count[5], Count[4], Count[3], Count[0]} % 52;
            13 : Addr_j = {Count[10], Count[9], Count[8], Count[7], Count[6], Count[2]} % 52;
            14 : Addr_j = {Count[11], Count[8], Count[5], Count[4], Count[3], Count[1]} % 52;
            15 : Addr_j = {Count[10], Count[9], Count[8], Count[7], Count[5], Count[2]} % 52;
            16 : Addr_j = {Count[11], Count[8], Count[6], Count[4], Count[3], Count[1]} % 52;
            17 : Addr_j = {Count[10], Count[9], Count[8], Count[7], Count[5], Count[0]} % 52;
            18 : Addr_j = {Count[11], Count[8], Count[6], Count[4], Count[3], Count[2]} % 52;
            19 : Addr_j = {Count[10], Count[9], Count[8], Count[7], Count[5], Count[1]} % 52;
            20 : Addr_j = {Count[11], Count[8], Count[6], Count[4], Count[3], Count[0]} % 52;
            21 : Addr_j = {Count[10], Count[9], Count[8], Count[7], Count[2], Count[1]} % 52;
            22 : Addr_j = {Count[11], Count[8], Count[6], Count[5], Count[4], Count[3]} % 52;
            23 : Addr_j = {Count[10], Count[9], Count[8], Count[7], Count[2], Count[0]} % 52;
            24 : Addr_j = {Count[11], Count[8], Count[6], Count[5], Count[4], Count[1]} % 52;
            25 : Addr_j = {Count[10], Count[9], Count[8], Count[7], Count[6], Count[3]} % 52;
            26 : Addr_j = {Count[11], Count[8], Count[5], Count[4], Count[2], Count[1]} % 52;
            27 : Addr_j = {Count[10], Count[9], Count[8], Count[7], Count[5], Count[3]} % 52;
            28 : Addr_j = {Count[11], Count[8], Count[6], Count[4], Count[2], Count[1]} % 52;
            29 : Addr_j = {Count[10], Count[9], Count[8], Count[7], Count[3], Count[0]} % 52;
            30 : Addr_j = {Count[11], Count[8], Count[6], Count[5], Count[4], Count[2]} % 52;
            31 : Addr_j = {Count[10], Count[9], Count[8], Count[7], Count[3], Count[1]} % 52;
            32 : Addr_j = {Count[11], Count[8], Count[6], Count[5], Count[4], Count[0]} % 52;
            33 : Addr_j = {Count[10], Count[9], Count[8], Count[7], Count[3], Count[2]} % 52;
            34 : Addr_j = {Count[11], Count[8], Count[6], Count[5], Count[1], Count[0]} % 52;
            35 : Addr_j = {Count[10], Count[9], Count[8], Count[7], Count[4], Count[2]} % 52;
            36 : Addr_j = {Count[11], Count[8], Count[6], Count[5], Count[3], Count[1]} % 52;
            37 : Addr_j = {Count[10], Count[9], Count[8], Count[7], Count[4], Count[0]} % 52;
            38 : Addr_j = {Count[11], Count[8], Count[6], Count[5], Count[3], Count[2]} % 52;
            39 : Addr_j = {Count[10], Count[9], Count[8], Count[7], Count[4], Count[1]} % 52;
            40 : Addr_j = {Count[11], Count[8], Count[6], Count[5], Count[3], Count[0]} % 52;
            41 : Addr_j = {Count[10], Count[9], Count[8], Count[6], Count[4], Count[2]} % 52;
            42 : Addr_j = {Count[11], Count[8], Count[7], Count[5], Count[3], Count[1]} % 52;
            43 : Addr_j = {Count[10], Count[9], Count[8], Count[6], Count[4], Count[0]} % 52;
            44 : Addr_j = {Count[11], Count[8], Count[7], Count[5], Count[3], Count[2]} % 52;
            45 : Addr_j = {Count[10], Count[9], Count[8], Count[7], Count[1], Count[0]} % 52;
            46 : Addr_j = {Count[11], Count[6], Count[5], Count[4], Count[3], Count[2]} % 52;
            47 : Addr_j = {Count[10], Count[9], Count[8], Count[7], Count[5], Count[4]} % 52;
            48 : Addr_j = {Count[11], Count[8], Count[6], Count[3], Count[2], Count[1]} % 52;
            49 : Addr_j = {Count[10], Count[9], Count[8], Count[6], Count[5], Count[4]} % 52;
            50 : Addr_j = {Count[11], Count[8], Count[7], Count[3], Count[2], Count[1]} % 52;
            51 : Addr_j = {Count[10], Count[9], Count[8], Count[6], Count[5], Count[0]} % 52;
        endcase
    end

endmodule // Nxt_Addr
