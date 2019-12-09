// Quartus Prime Verilog Template
// Single port RAM with single read/write address and initial contents 
// specified with an initial block

module SPRWI
#(parameter DATA_WIDTH = 4, parameter ADDR_WIDTH = 6)
    (
        input [(DATA_WIDTH - 1):0] i_Data,
        input [(ADDR_WIDTH - 1):0] i_Addr, // Memory address
        input i_WriteEnable, i_Clock,
        output [(DATA_WIDTH - 1):0] o_Data
    );


    // Declare the RAM variable
    reg [(DATA_WIDTH - 1):0] r_Ram [(2**ADDR_WIDTH - 1):0];

    // Variable to hold the registered read address
    reg [(ADDR_WIDTH - 1):0] r_Addr;

    // Specify the initial contents.  You can also use the $readmemb
    // system task to initialize the RAM variable from a text file.
    // See the $readmemb template page for details.
    initial 
    begin : INIT
        reg[(ADDR_WIDTH - 1):0] i;

        for(i = 0; i < 52; i = i + 1)
        begin
            if (i <= 12)
                r_Ram[i] = i[3:0];
            else if ( i > 12 && i <= 25)
                r_Ram[i] = i[3:0] + 3;
            else if ( i > 25 && i <= 38)
                r_Ram[i] = i[3:0] + 6;
            else
                r_Ram[i] = i[3:0] + 9;
        end

    end 

    always @ (posedge i_Clock)
    begin
        // Write
        if (i_WriteEnable)
            r_Ram[i_Addr] <= i_Data;

        r_Addr <= i_Addr;
    end
    // Continuous assignment implies read returns NEW data.
    // This is the natural behavior of the TriMatrix memory
    // blocks in Single Port mode.  
    assign o_Data = r_Ram[r_Addr];

endmodule