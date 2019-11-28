// Made by: Erick

module Nxt_Addr
(
    input wire [5:0] Addr_i,
    input wire [11:0] Count, // Counter output
    output reg [5:0] Addr_j
);
    always @(*)
    begin
        case (Addr_i)                                                                       // 6'b 110100 = 52 em binário
            6'b 000000 : Addr_j = (Addr_i + {Count[0], Count[1], Count[2], Count[3], Count[4], Count[5]})   % 6'b 110100; // 0  
            6'b 000001 : Addr_j = (Addr_i + {Count[1], Count[2], Count[6], Count[7], Count[8], Count[9]})   % 6'b 110100; // 1  
            6'b 000010 : Addr_j = (Addr_i + {Count[0], Count[3], Count[4], Count[5], Count[6], Count[10]})  % 6'b 110100; // 2  
            6'b 000011 : Addr_j = (Addr_i + {Count[1], Count[2], Count[3], Count[4], Count[7], Count[8]})   % 6'b 110100; // 3  
            6'b 000100 : Addr_j = (Addr_i + {Count[0], Count[3], Count[5], Count[6], Count[9], Count[10]})  % 6'b 110100; // 4  
            6'b 000101 : Addr_j = (Addr_i + {Count[1], Count[2], Count[3], Count[4], Count[5], Count[7]})   % 6'b 110100; // 5  
            6'b 000110 : Addr_j = (Addr_i + {Count[0], Count[3], Count[6], Count[8], Count[9], Count[10]})  % 6'b 110100; // 6  
            6'b 000111 : Addr_j = (Addr_i + {Count[1], Count[2], Count[3], Count[4], Count[5], Count[6]})   % 6'b 110100; // 7  
            6'b 001000 : Addr_j = (Addr_i + {Count[0], Count[3], Count[7], Count[8], Count[9], Count[10]})  % 6'b 110100; // 8  
            6'b 001001 : Addr_j = (Addr_i + {Count[1], Count[2], Count[3], Count[4], Count[5], Count[11]})  % 6'b 110100; // 9  
            6'b 001010 : Addr_j = (Addr_i + {Count[0], Count[3], Count[6], Count[7], Count[8], Count[9]})   % 6'b 110100; // 10 
            6'b 001011 : Addr_j = (Addr_i + {Count[1], Count[2], Count[3], Count[4], Count[5], Count[10]})  % 6'b 110100; // 11 
            6'b 001100 : Addr_j = (Addr_i + {Count[0], Count[3], Count[6], Count[7], Count[8], Count[11]})  % 6'b 110100; // 12 
            6'b 001101 : Addr_j = (Addr_i + {Count[1], Count[2], Count[3], Count[4], Count[5], Count[9]})   % 6'b 110100; // 13 
            6'b 001110 : Addr_j = (Addr_i + {Count[0], Count[3], Count[6], Count[7], Count[8], Count[10]})  % 6'b 110100; // 14 
            6'b 001111 : Addr_j = (Addr_i + {Count[1], Count[2], Count[3], Count[4], Count[6], Count[9]})   % 6'b 110100; // 15 
            6'b 010000 : Addr_j = (Addr_i + {Count[0], Count[3], Count[5], Count[7], Count[8], Count[10]})  % 6'b 110100; // 16 
            6'b 010001 : Addr_j = (Addr_i + {Count[1], Count[2], Count[3], Count[4], Count[6], Count[11]})  % 6'b 110100; // 17 
            6'b 010010 : Addr_j = (Addr_i + {Count[0], Count[3], Count[5], Count[7], Count[8], Count[9]})   % 6'b 110100; // 18 
            6'b 010011 : Addr_j = (Addr_i + {Count[1], Count[2], Count[3], Count[4], Count[6], Count[10]})  % 6'b 110100; // 19 
            6'b 010100 : Addr_j = (Addr_i + {Count[0], Count[3], Count[5], Count[7], Count[8], Count[11]})  % 6'b 110100; // 20 
            6'b 010101 : Addr_j = (Addr_i + {Count[1], Count[2], Count[3], Count[4], Count[9], Count[10]})  % 6'b 110100; // 21 
            6'b 010110 : Addr_j = (Addr_i + {Count[0], Count[3], Count[5], Count[6], Count[7], Count[8]})   % 6'b 110100; // 22 
            6'b 010111 : Addr_j = (Addr_i + {Count[1], Count[2], Count[3], Count[4], Count[9], Count[11]})  % 6'b 110100; // 23 
            6'b 011000 : Addr_j = (Addr_i + {Count[0], Count[3], Count[5], Count[6], Count[7], Count[10]})  % 6'b 110100; // 24 
            6'b 011001 : Addr_j = (Addr_i + {Count[1], Count[2], Count[3], Count[4], Count[5], Count[8]})   % 6'b 110100; // 25 
            6'b 011010 : Addr_j = (Addr_i + {Count[0], Count[3], Count[6], Count[7], Count[9], Count[10]})  % 6'b 110100; // 26 
            6'b 011011 : Addr_j = (Addr_i + {Count[1], Count[2], Count[3], Count[4], Count[6], Count[8]})   % 6'b 110100; // 27 
            6'b 011100 : Addr_j = (Addr_i + {Count[0], Count[3], Count[5], Count[7], Count[9], Count[10]})  % 6'b 110100; // 28 
            6'b 011101 : Addr_j = (Addr_i + {Count[1], Count[2], Count[3], Count[4], Count[8], Count[11]})  % 6'b 110100; // 29 
            6'b 011110 : Addr_j = (Addr_i + {Count[0], Count[3], Count[5], Count[6], Count[7], Count[9]})   % 6'b 110100; // 30 
            6'b 011111 : Addr_j = (Addr_i + {Count[1], Count[2], Count[3], Count[4], Count[8], Count[10]})  % 6'b 110100; // 31 
            6'b 100000 : Addr_j = (Addr_i + {Count[0], Count[3], Count[5], Count[6], Count[7], Count[11]})  % 6'b 110100; // 32 
            6'b 100001 : Addr_j = (Addr_i + {Count[1], Count[2], Count[3], Count[4], Count[8], Count[9]})   % 6'b 110100; // 33 
            6'b 100010 : Addr_j = (Addr_i + {Count[0], Count[3], Count[5], Count[6], Count[10], Count[11]}) % 6'b 110100; // 34 
            6'b 100011 : Addr_j = (Addr_i + {Count[1], Count[2], Count[3], Count[4], Count[7], Count[9]})   % 6'b 110100; // 35 
            6'b 100100 : Addr_j = (Addr_i + {Count[0], Count[3], Count[5], Count[6], Count[8], Count[10]})  % 6'b 110100; // 36 
            6'b 100101 : Addr_j = (Addr_i + {Count[1], Count[2], Count[3], Count[4], Count[7], Count[11]})  % 6'b 110100; // 37 
            6'b 100110 : Addr_j = (Addr_i + {Count[0], Count[3], Count[5], Count[6], Count[8], Count[9]})   % 6'b 110100; // 38 
            6'b 100111 : Addr_j = (Addr_i + {Count[1], Count[2], Count[3], Count[4], Count[7], Count[10]})  % 6'b 110100; // 39 
            6'b 101000 : Addr_j = (Addr_i + {Count[0], Count[3], Count[5], Count[6], Count[8], Count[11]})  % 6'b 110100; // 40 
            6'b 101001 : Addr_j = (Addr_i + {Count[1], Count[2], Count[3], Count[5], Count[7], Count[9]})   % 6'b 110100; // 41 
            6'b 101010 : Addr_j = (Addr_i + {Count[0], Count[3], Count[4], Count[6], Count[8], Count[10]})  % 6'b 110100; // 42 
            6'b 101011 : Addr_j = (Addr_i + {Count[1], Count[2], Count[3], Count[5], Count[7], Count[11]})  % 6'b 110100; // 43 
            6'b 101100 : Addr_j = (Addr_i + {Count[0], Count[3], Count[4], Count[6], Count[8], Count[9]})   % 6'b 110100; // 44 
            6'b 101101 : Addr_j = (Addr_i + {Count[1], Count[2], Count[3], Count[4], Count[10], Count[11]}) % 6'b 110100; // 45 
            6'b 101110 : Addr_j = (Addr_i + {Count[0], Count[5], Count[6], Count[7], Count[8], Count[9]})   % 6'b 110100; // 46 
            6'b 101111 : Addr_j = (Addr_i + {Count[1], Count[2], Count[3], Count[4], Count[6], Count[7]})   % 6'b 110100; // 47 
            6'b 110000 : Addr_j = (Addr_i + {Count[0], Count[3], Count[5], Count[8], Count[9], Count[10]})  % 6'b 110100; // 48 
            6'b 110001 : Addr_j = (Addr_i + {Count[1], Count[2], Count[3], Count[5], Count[6], Count[7]})   % 6'b 110100; // 49 
            6'b 110010 : Addr_j = (Addr_i + {Count[0], Count[3], Count[4], Count[8], Count[9], Count[10]})  % 6'b 110100; // 50 
            6'b 110011 : Addr_j = (Addr_i + {Count[1], Count[2], Count[3], Count[5], Count[6], Count[11]})  % 6'b 110100; // 51 
            default: 6'b 0 // para não inferir latchs
        endcase
    end

endmodule // Nxt_Addr
