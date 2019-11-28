// Made by: Erick

module CardEvaluator
(
    input wire [3:0] i_Card,
    output reg [3:0] o_Value
);
    always @(*)
    begin
        case (i_Card)                           // Card (value)
            4'b 0000    : o_Value = 4'b 0001;   // A  (1)
            4'b 0001    : o_Value = 4'b 0010;   // 2  (2)
            4'b 0010    : o_Value = 4'b 0011;   // 3  (3)
            4'b 0011    : o_Value = 4'b 0100;   // 4  (4)
            4'b 0100    : o_Value = 4'b 0101;   // 5  (5)
            4'b 0101    : o_Value = 4'b 0110;   // 6  (6)
            4'b 0110    : o_Value = 4'b 0111;   // 7  (7)
            4'b 0111    : o_Value = 4'b 1000;   // 8  (8)
            4'b 1000    : o_Value = 4'b 1001;   // 9  (9)
            4'b 1001    : o_Value = 4'b 1010;   // 10 (10)
            4'b 1010    : o_Value = 4'b 1010;   // J  (10)
            4'b 1011    : o_Value = 4'b 1010;   // Q  (10)
            4'b 1100    : o_Value = 4'b 1010;   // K  (10)
        endcase
    end

endmodule // CardEvaluator
