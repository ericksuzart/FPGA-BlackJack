

module Counter
#(parameter unsigned WIDTH = 12)
    (
        input clk_50M;
        input clk_2K;
        input i_TwoSec;
        input i_Reset;
        input i_Zero;
        output [WIDTH-1:0] o_Count;
    );

    reg unsigned [WIDTH-1:0] r_Count;

    // Reset (i_Zero) if needed, or increment if i_Reset is enabled in high
    always @ (posedge clk_50M or i_Reset or posedge i_Zero)
    begin
        if (i_Zero)
            o_Count <= 0;
        else if (i_Reset == 1'b1)
            o_Count <= o_Count + 1;
    end

    // Reset (i_Zero) if needed, or increment if i_Reset is enabled in high
    always @ (posedge clk_2k or i_Reset or posedge i_Zero)
    begin
        if (i_Zero)
            o_Count <= 0;
        else if (i_Reset == 1'b1)
            o_Count <= o_Count + 1;
    end

    assign o_Count = r_Count;
endmodule
