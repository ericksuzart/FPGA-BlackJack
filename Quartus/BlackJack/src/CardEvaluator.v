// Made by: Erick

module CardEvaluator
(
    input wire [3:0] i_Card,
    output reg [3:0] o_Value
);
    always @(*)
    begin
        case (i_Card)
            4'b 0000    : o_Value = 1;  // A
            4'b 0001    : o_Value = 2;  // 2
            4'b 0010    : o_Value = 3;  // 3
            4'b 0011    : o_Value = 4;  // 4
            4'b 0100    : o_Value = 5;  // 5
            4'b 0101    : o_Value = 6;  // 6
            4'b 0110    : o_Value = 7;  // 7
            4'b 0111    : o_Value = 8;  // 8
            4'b 1000    : o_Value = 9;  // 9
            4'b 1001    : o_Value = 10; // 10
            4'b 1010    : o_Value = 10; // J
            4'b 1011    : o_Value = 10; // Q
            4'b 1100    : o_Value = 10; // K
        endcase
    end

endmodule // CardEvaluator
