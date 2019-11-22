// Made by: Erick

module Counter
#(parameter unsigned WIDTH = 12)
    (
        input clk_50M;  // 50 MHz clock
        input clk_2K;   // 2 kHz clock
        input i_TwoSec; // Input from FSM
        input i_Reset;  // 
        input i_Zero;
        output [WIDTH-1:0] o_Count;
    );

    reg unsigned [WIDTH-1:0] r_Count;

    // Reset (i_Zero) if needed, or increment if i_Reset is enabled in high
    always @ (posedge clk_50M or i_Reset or posedge i_Zero)
    begin
        if (i_Zero)
            r_Count <= 0;
        else if (i_Reset == 1'b1)
            r_Count <= r_Count + 1;
    end

    // Reset (i_Zero) if needed, or increment if i_Reset is enabled in high
    always @ (posedge clk_2k or i_Reset or posedge i_Zero)
    begin
        if (i_Zero)
            r_Count <= 0;
        else if (i_Reset == 1'b1)
            r_Count <= r_Count + 1;
    end

    assign o_Count = r_Count;
endmodule
