`timescale 1ns/1ns

module TB_BlackJack;
    // Clock
    reg clk;

    // Botões
    reg	ResetBtn, StayBtn, HitBtn;

    // Fios de saída de fim de jogo
    wire o_Win, o_Lose, o_Tie;

    // Fios de saída dos leds de Hit e Stay
    wire o_Hit_P, o_Hit_D, o_Stay_P, o_Stay_D;

    // Fios de saída para o display
    wire [0:6] DealerHndDisplayD, DealerHndDisplayU;
    wire [0:6] PlayerHndDisplayD, PlayerHndDisplayU;

    // Estados dos botões
    wire o_ResetState, o_StayState, o_HitState;

    // Borda de descida do botão de Stay e de hit
    wire o_StayDown, o_HitDown;


    BlackJack DUV
    (
        .inclk0(clk) ,	// input  inclk0_sig
        .i_Reset(ResetBtn) ,	// input  i_Reset_sig
        .i_Stay(StayBtn) ,	// input  i_Stay_sig
        .i_Hit(HitBtn) ,	// input  i_Hit_sig
        .o_Win(o_Win) ,	// output  o_Win_sig
        .o_Lose(o_Lose) ,	// output  o_Lose_sig
        .o_Tie(o_Tie) ,	// output  o_Tie_sig
        .o_Hit_P(o_Hit_P) ,	// output  o_Hit_P_sig
        .o_Hit_D(o_Hit_D) ,	// output  o_Hit_D_sig
        .o_Stay_P(o_Stay_P) ,	// output  o_Stay_P_sig
        .o_Stay_D(o_Stay_D) ,	// output  o_Stay_D_sig
        .DealerHndDisplayU(DealerHndDisplayU) ,	// output [0:6] DealerHndDisplayU_sig
        .DealerHndDisplayD(DealerHndDisplayD) ,	// output [0:6] DealerHndDisplayD_sig
        .PlayerHndDisplayU(PlayerHndDisplayU) ,	// output [0:6] PlayerHndDisplayU_sig
        .PlayerHndDisplayD(PlayerHndDisplayD) ,	// output [0:6] PlayerHndDisplayD_sig
        .o_ResetState(o_ResetState) ,	// output  o_ResetState_sig
        .o_StayState(o_StayState) ,	// output  o_StayState_sig
        .o_StayDown(o_StayDown) ,	// output  o_StayDown_sig
        .o_HitState(o_HitState) ,	// output  o_HitState_sig
        .o_HitDown(o_HitDown) 	// output  o_HitDown_sig
    );

    always #5 clk = !clk;

    initial
    begin
        clk = 0;
        HitBtn = 1;
        StayBtn = 1;
        ResetBtn = 0;

        #10 ResetBtn = 1;
        #2000 ResetBtn = 0;
    end

endmodule // TB_BlackJack