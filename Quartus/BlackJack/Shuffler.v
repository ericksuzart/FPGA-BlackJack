// Made by: Erick

module Shuffler
(
    // ----- Inputs -----
    input [3:0] i_MemData,
    input i_ActShuffler,
    input [5:0] i_Addr_J,
    input clk,
    // ----- Outputs ----
    output reg o_Shuffled,
    output reg [3:0] o_Data,
    output reg [5:0] o_Address,
    output reg o_MemClk,
    output reg o_Write,
    // --- Var output ---
    output reg [5:0] vo_Addr_I
);

// Data register
reg [3:0] vc_Data_I, vc_Data_J;



// State register
reg [3:0] A_State, F_State;


parameter   Start           = 4'b 0000,
            InitOutputs     = 4'b 0001,
            I_ReadMemOut    = 4'b 0010,
            I_StoreMemOut   = 4'b 0011,
            GetNxtAddr      = 4'b 0100,
            J_ReadMemOut    = 4'b 0101,
            J_StoreMemOut   = 4'b 0110,
            J_WriteMemAddr  = 4'b 0111,
            ChangeAddr      = 4'b 1000,
            I_WriteMemAddr  = 4'b 1001,
            IfState         = 4'b 1010,
            IncreaseAddr    = 4'b 1011,
            Shuffled        = 4'b 1100;

// Clocked block
always @(posedge clk)
begin
    if(!i_ActShuffler)
    begin
        A_State <= Start;
        vo_Addr_I <= 0;
    end
    else
    begin
        A_State <= F_State;

        if (F_State == IncreaseAddr)
            vo_Addr_I <= vo_Addr_I + 1;
        if(F_State == I_StoreMemOut)
            vc_Data_I <= i_MemData;
        if(F_State == J_StoreMemOut)
            vc_Data_J = i_MemData;
    end
end

// Next state decoder
always @(*)
begin
    case (A_State)
        Start           :   F_State = InitOutputs;

        InitOutputs     :   F_State = I_ReadMemOut;

        I_ReadMemOut    :   F_State = I_StoreMemOut;

        I_StoreMemOut   :   F_State = GetNxtAddr;

        GetNxtAddr      :   F_State = J_ReadMemOut;

        J_ReadMemOut    :   F_State = J_StoreMemOut;

        J_StoreMemOut   :   F_State = J_WriteMemAddr;

        J_WriteMemAddr  :   F_State = ChangeAddr;

        ChangeAddr      :   F_State = I_WriteMemAddr;

        I_WriteMemAddr  :   F_State = IfState;

        IfState         :   if (vo_Addr_I < 51)
                                F_State = IncreaseAddr;
                            else
                                F_State = Shuffled;

        IncreaseAddr    :   F_State = InitOutputs;

        Shuffled        :   F_State = Shuffled;

        default         :   F_State = Start;
    endcase
end

// Output decoder
always @(*)
begin
    // Default output values
    o_Shuffled = 0;
    o_MemClk = 0;
    o_Write = 0;
    case (A_State)
        InitOutputs     :   o_Address = vo_Addr_I;

        I_ReadMemOut    :   begin
                                o_MemClk = 1;
                                o_Address = vo_Addr_I;
                            end

        I_StoreMemOut   :   o_Address = vo_Addr_I;
                            // vc_Data_I = i_MemData; Clocked

        GetNxtAddr      :   o_Address = i_Addr_J;

        J_ReadMemOut    :   begin
                                o_MemClk = 1;
                                o_Address = i_Addr_J;
                            end

        J_StoreMemOut   :   begin
                                o_Data = vc_Data_I;
                                o_MemClk = 0;
                                o_Write = 1;
                                o_Address = i_Addr_J;
                                // vc_Data_J = i_MemData; Clocked
                            end

        J_WriteMemAddr  :   begin
                                o_Data = vc_Data_I;
                                o_MemClk = 1;
                                o_Write = 1;
                                o_Address = i_Addr_J;
                            end

        ChangeAddr      :   begin
                                o_Data = vc_Data_J;
                                o_MemClk = 0;
                                o_Write = 1;
                                o_Address = vo_Addr_I;
                            end

        I_WriteMemAddr  :   begin
                                o_Data = vc_Data_J;
                                o_MemClk = 1;
                                o_Write = 1;
                                o_Address = vo_Addr_I;
                            end

        Shuffled        :   o_Shuffled = 1;
    endcase
end

endmodule // Shuffler