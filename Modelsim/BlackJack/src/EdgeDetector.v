module EdgeDetector
#(parameter Type = 1)
(
    input sig,  // Input signal for which edge has to be detected
    input clk,  // Input signal for clock
    output reg detect // Output signal that gives a pulse when edge occurs
);           
    reg sig_dly; // Internal signal to store the delayed version of signal
 
    // This always block ensures that sig_dly is exactly 1 clock behind sig
    always @ (posedge clk)
    begin
        sig_dly <= sig;
    end
/*
    Combinational logic where sig is AND with delayed, inverted version of
    sig Assign statement assigns the evaluated expression in the RHS to the
    internal net pe
*/

    always @(*) 
    begin
        case (Type) 
            1 : detect = sig & ~sig_dly; // 1 = Rising edge 
            0 : detect = ~sig & sig_dly; // 0 = Faling edge
        endcase
    end


endmodule // EdgeDetector