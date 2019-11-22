// Made by: Erick

module Counter
#(parameter unsigned WIDTH = 12)
    (
        input clk_50M;          // 50 MHz clock
        input clk_2K;           // 2 kHz clock
        input i_Zero;           // Reset the counter
        input i_ActiveCounter;  // Input of 2sec from FSM
        input i_Reset;  // 
        output [WIDTH-1:0] o_Count;
        output o_TwoSec;
    );

    reg unsigned [WIDTH-1:0] r_Count;

    // Reset (i_Zero) if needed, or increment if i_Reset is enabled in high
    always @ (posedge clk_50M or posedge i_Zero)
    begin
        if (i_Zero)
            r_Count <= 0;
        else if (i_Reset == 1'b1)
            r_Count <= r_Count + 1;
    end

    // Increment if i_ActiveCounter is enabled in high
    always @ (posedge clk_2k)
    begin
        if (i_ActiveCounter == 1'b1 && r_Count < 2**(WIDTH) - 1)
            r_Count <= r_Count + 1;
        else if ()
    end

    assign o_Count = r_Count;
endmodule
