// Quartus Prime Verilog Template
// Binary counter

module Counter
#(parameter unsigned WIDTH = 12)
    (
        input clk_50M, clk_2K, i_TwoSec, i_Reset, i_Zero,
        output reg unsigned [WIDTH-1:0] count
    );

    // Reset if needed, or increment if i_Reset is enabled in high
    always @ (posedge clk_50M or i_Reset or posedge i_Zero)
    begin
        if (i_Zero)
            count <= 0;
        else if (i_Reset == 1'b1)
            count <= count + 1;
    end

    // Reset if needed, or increment if i_Reset is enabled in high

endmodule
