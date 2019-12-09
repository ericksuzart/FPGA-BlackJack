module Tester
(
    input [4:0] StateFSM,   // Estado do circuito sendo testado
    input [5:0] TesterHand, // mão do player
    input ResetTester,      // Resetar o tester
    input clk,              // clock input
    output reg o_TesterHit,     // Hit
    output reg o_TesterStay     // Stay
);

reg [7:0] timer;
reg [2:0] A_State, F_State;

parameter   Start           = 3'b 000,
            WaitFirstTurn   = 3'b 001,
            FirstHitState   = 3'b 010,
            FirstStayState  = 3'b 011,
            WaitSecTurn     = 3'b 100,
            SecHitState     = 3'b 101,
            SecStayState    = 3'b 110,
            WaitReset       = 3'b 111,
            // FSM state
            PlayerTurn      = 5'b 01001;

// clocked block
always @(posedge clk)
begin
    if(ResetTester)
        A_State <= Start;
    else
    begin
        A_State <= F_State;

        if(F_State == FirstHitState)
            timer <= timer - 1;
        else if (F_State == FirstStayState)
            timer <= timer - 1;
        else if (F_State == SecHitState)
            timer <= timer - 1;
        else if (F_State == SecStayState)
            timer <= timer - 1;
        else
            timer <= 8'b 11111111;
    end
end

// dec de proximo estado

always @(*)
begin
    case (A_State)
        Start :
            if (ResetTester)
                F_State = Start;
            else
                F_State = WaitFirstTurn;

        WaitFirstTurn :
            if (StateFSM != PlayerTurn)
                F_State = WaitFirstTurn;
            else if (TesterHand <= 5)
                F_State = FirstHitState;
            else
                F_State = FirstStayState;

        FirstHitState :
            if (timer > 0)
                F_State = FirstHitState;
            else
                F_State = WaitFirstTurn;

        FirstStayState :
            if (timer > 0)
                F_State = FirstStayState;
            else
                F_State = WaitSecTurn;

        WaitSecTurn :
            if (StateFSM != PlayerTurn)
                F_State = WaitSecTurn;
            else if (TesterHand < 15)
                F_State = SecHitState;
            else
                F_State = SecStayState;

        SecHitState :
            if (timer > 0)
                F_State = SecHitState;
            else
                F_State = WaitSecTurn;

        SecStayState :
            if (timer > 0)
                F_State = SecStayState;
            else
                F_State = WaitReset;

        WaitReset :
            F_State = WaitReset;
    endcase
end

// dec de saída
always @(*)
begin
    // default outputs

    o_TesterHit = 1;
    o_TesterStay = 1;

    case (A_State)
        // Start : Default

        // WaitFirstTurn : Default

        FirstHitState :
            o_TesterHit = 0;

        FirstStayState :
            o_TesterStay = 0;

        // WaitSecTurn : Default

        SecHitState :
            o_TesterHit = 0;

        SecStayState :
            o_TesterStay = 0;

        // WaitReset : Default
    endcase
end

endmodule // Tester