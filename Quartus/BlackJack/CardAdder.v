// Made by: Erick

module CardAdder
(
    // ----- Inputs -----
    input [3:0] i_Card,
    input [3:0] i_Value,
    input i_Card2P,
    input i_Card2D,
    input i_Reset,
    input i_Clock,
    // ----- Outputs ----
    output [5:0] o_Address,
    output reg o_MemClk,
    output o_DealerHnd,
    output o_PlayerHnd,
    output reg o_CardOK
);

// Hand holder
reg [5:0] vc_HndD, vc_HndP;

// Ace holders
reg vc_Ace_D, vc_Ace_P;

// Jack, Queen and King holder
reg vc_Face_D, vc_Face_P;

// State register
reg [3:0] A_State, F_State;

// Address holder
reg [5:0] r_Addr;

// Reset Posedge detector
wire pe_Reset;

EdgeDetector #(.Type(1)) PosEdgeDetector
(
    .sig(i_Reset),
    .clk(i_Clock),
    .detect(pe_Reset)
);


parameter   Start           = 4'b 0000,
            Wait_FSM        = 4'b 0001,
            ReadMem         = 4'b 0010,
            Value2Dealer    = 4'b 0011,
            Value2Player    = 4'b 0100,
            DealerWithAce   = 4'b 0101,
            DealerWithFace  = 4'b 0110,
            PlayerWithAce   = 4'b 0111,
            PlayerWithFace  = 4'b 1000,
            PlusTenDealer   = 4'b 1001,
            PlusTenPlayer   = 4'b 1010,
            CardOK          = 4'b 1011;


// Clocked block
always @(posedge i_Clock)
begin
    if(pe_Reset)
    begin
        A_State <= Start;
        r_Addr <= 0;
        vc_HndD <= 0;
        vc_HndP <= 0;

        // Precisamos usar essas variáveis como FF pois elas devem manter o
        // estado atual até que este seja alterado

        vc_Ace_D <= 0;
        vc_Ace_P <= 0;
        vc_Face_D <= 0;
        vc_Face_P <= 0;
    end
    else
    begin
        A_State <= F_State;

        case (F_State)
            Value2Dealer :
                begin
                    r_Addr <= r_Addr + 1;
                    vc_HndD <= vc_HndD + i_Value;
                end
            
            Value2Player :
                begin
                    r_Addr <= r_Addr + 1;
                    vc_HndP <= vc_HndP + i_Value;
                end

            PlusTenDealer :
                vc_HndD <= vc_HndD + 10;

            PlusTenPlayer :
                vc_HndP <= vc_HndP + 10;

            DealerWithAce :
                vc_Ace_D <= 1;

            DealerWithFace :
                vc_Face_D <= 1;

            PlayerWithAce :
                vc_Ace_P <= 1;

            PlayerWithFace :
                vc_Face_P <= 1;
        endcase
    end
end

// Next state decoder DONE
always @(*)
begin
    case (A_State)
        Start:
            F_State = Wait_FSM;

        Wait_FSM :
            if (i_Card2D || i_Card2P)
                F_State = ReadMem;
            else
                F_State = Wait_FSM;

        ReadMem :
            if (r_Addr < 51)
                F_State = Start;
            
            else if (i_Card2D)
                F_State = Value2Dealer;

            else if (i_Card2P)
                F_State = Value2Player;

        Value2Dealer :
            if (i_Card == 4'b 0000)
                F_State = DealerWithAce;
            else if (i_Card == 4'b 1010 || i_Card == 4'b 1011 || i_Card == 4'b 1100)
                F_State = DealerWithFace;
            else
                F_State = CardOK;

        Value2Player :
            if (i_Card == 4'b 0000)
                F_State = PlayerWithAce;
            else if (i_Card == 4'b 1010 || i_Card == 4'b 1011 || i_Card == 4'b 1100)
                F_State = PlayerWithFace;
            else
                F_State = CardOK;

        DealerWithAce :
            if (vc_Face_D)
                F_State = PlusTenDealer;
            else
                F_State = CardOK;

        DealerWithFace :
            if (vc_Ace_D)
                F_State = PlusTenDealer;
            else
                F_State = CardOK;

        PlayerWithAce :
            if (vc_Face_P)
                F_State = PlusTenPlayer;
            else
                F_State = CardOK;


        PlayerWithFace :
            if (vc_Ace_P)
                F_State = PlusTenPlayer;
            else
                F_State = CardOK;

        PlusTenDealer :
            F_State = CardOK;

        PlusTenPlayer :
            F_State = CardOK;

        CardOK :
            if (i_Card2D || i_Card2P)
                F_State = CardOK;
            else
                F_State = Wait_FSM;

        default :
            F_State = Start;
    endcase
end

// Output decoder
always @(*)
begin
    // Default output values
    o_CardOK = 0;
    o_MemClk = 0;

    // State outputs
    case (A_State)        
        ReadMem:
            o_MemClk = 1;

        CardOK :
            o_CardOK = 1;
    endcase
end

assign o_Address = r_Addr;
assign o_DealerHnd = vc_HndD;
assign o_PlayerHnd = vc_HndP;

endmodule // CardAdder