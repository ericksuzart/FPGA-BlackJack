// Quartus Prime Verilog Template
// Binary counter

module Counter
#(parameter unsigned WIDTH = 12)
    (
        input clk_50, clk_2, i_TwoSec, i_Reset, i_Zero,
        output reg unsigned [WIDTH-1:0] count
    );

    // Reset if needed, or increment if counting is enabled
    always @ (posedge clk or posedge reset)
    begin
        if (i_Reset)
            count <= 0;
        else if (enable == 1'b1)
            count <= count + 1;
    end

endmodule
