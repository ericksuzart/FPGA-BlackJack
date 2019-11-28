module ClockSync

    reg clk, clk2khz;

    always #5 clk = !clk;

    always #125000 clk2khz = !clk2khz;

    initial
    begin
        clk2khz = 0;
        clk = 0;
    end
    
endmodule
