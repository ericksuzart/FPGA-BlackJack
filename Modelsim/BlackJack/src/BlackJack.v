// Copyright (C) 2018  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"
// CREATED		"Thu Dec  5 13:08:35 2019"

module BlackJack(
	inclk0,
	i_Reset,
	i_Stay,
	i_Hit,
	o_Win,
	o_Lose,
	o_Tie,
	o_Hit_P,
	o_Hit_D,
	o_Stay_P,
	o_Stay_D,
	o_HitDeb,
	o_HitNE,
	o_StayDeb,
	o_StayNE,
	DealerHndDisplayD,
	DealerHndDisplayU,
	PlayerHndDisplayD,
	PlayerHndDisplayU
);


input wire	inclk0;
input wire	i_Reset;
input wire	i_Stay;
input wire	i_Hit;
output wire	o_Win;
output wire	o_Lose;
output wire	o_Tie;
output wire	o_Hit_P;
output wire	o_Hit_D;
output wire	o_Stay_P;
output wire	o_Stay_D;
output wire	o_HitDeb;
output wire	o_HitNE;
output wire	o_StayDeb;
output wire	o_StayNE;
output wire	[0:6] DealerHndDisplayD;
output wire	[0:6] DealerHndDisplayU;
output wire	[0:6] PlayerHndDisplayD;
output wire	[0:6] PlayerHndDisplayU;

wire	clk;
wire	clk_PLL;
wire	[5:0] w_A_Addr;
wire	w_A_MemClk;
wire	w_ActCounter;
wire	w_ActShuffler;
wire	w_Card2Dealer;
wire	w_Card2Player;
wire	w_CardOK;
wire	[3:0] w_CardValue;
wire	[11:0] w_Count;
wire	w_CountRstOK;
wire	[5:0] w_DealerHnd;
wire	w_HitPE;
wire	[5:0] w_MemAddr;
wire	w_MemClk;
wire	[3:0] w_MemData;
wire	[5:0] w_PlayerHnd;
wire	w_ResetDeb;
wire	w_ResetNE;
wire	w_ResetPE;
wire	w_RstCounter;
wire	[5:0] w_S_Addr;
wire	[5:0] w_S_Addr_I;
wire	[5:0] w_S_Addr_J;
wire	[3:0] w_S_Data;
wire	w_S_MemClk;
wire	w_ShowHndD;
wire	w_ShowHndP;
wire	w_Shuffled;
wire	w_StayPE;
wire	w_TwoSec;
wire	w_WriteEnable;

// variáveis para verificação da memória
wire	w_MuxTestEnable;
wire	[5:0] w_TestAddr;
wire 	w_TestClk;



CardEvaluator	b2v_CardEvaluatorDecoder(
	.i_Card(w_MemData),
	.o_Value(w_CardValue));


Counter	b2v_Contador(
	.clk_2K(clk_PLL),
	.i_ActCounter(w_ActCounter),
	.i_RstCounter(w_RstCounter),
	.i_ResetNeg(w_ResetNE),
	.i_ResetDeb(w_ResetDeb),
	.o_TwoSec(w_TwoSec),
	.o_RstOK(w_CountRstOK),
	.o_Count(w_Count));
	defparam	b2v_Contador.WIDTH = 12;


displaydecoder	b2v_DealerHand(
	.enable(w_ShowHndD),
	.hand(w_DealerHnd),
	.displayd(DealerHndDisplayD),
	.displayu(DealerHndDisplayU));


CardAdder	b2v_FSM_CardAdder(
	.i_Card2P(w_Card2Player),
	.i_Card2D(w_Card2Dealer),
	.i_Reset(w_ResetPE),
	.i_Clock(clk),
	.i_Card(w_MemData),
	.i_Value(w_CardValue),
	.o_MemClk(w_A_MemClk),
	.o_CardOK(w_CardOK),
	.o_Address(w_A_Addr),
	.o_DealerHnd(w_DealerHnd),
	.o_PlayerHnd(w_PlayerHnd));
	defparam	b2v_FSM_CardAdder.CardOK = 4'b1011;
	defparam	b2v_FSM_CardAdder.DealerWithAce = 4'b0101;
	defparam	b2v_FSM_CardAdder.DealerWithFace = 4'b0110;
	defparam	b2v_FSM_CardAdder.PlayerWithAce = 4'b0111;
	defparam	b2v_FSM_CardAdder.PlayerWithFace = 4'b1000;
	defparam	b2v_FSM_CardAdder.PlusTenDealer = 4'b1001;
	defparam	b2v_FSM_CardAdder.PlusTenPlayer = 4'b1010;
	defparam	b2v_FSM_CardAdder.ReadMem = 4'b0010;
	defparam	b2v_FSM_CardAdder.Start = 4'b0000;
	defparam	b2v_FSM_CardAdder.Value2Dealer = 4'b0011;
	defparam	b2v_FSM_CardAdder.Value2Player = 4'b0100;
	defparam	b2v_FSM_CardAdder.Wait_FSM = 4'b0001;


Shuffler	b2v_FSM_Embaralhador(
	.i_ActShuffler(w_ActShuffler),
	.clk(clk),
	.i_Addr_J(w_S_Addr_J),
	.i_MemData(w_MemData),
	.o_Shuffled(w_Shuffled),
	.o_MemClk(w_S_MemClk),
	.o_Write(w_WriteEnable),
	.o_Address(w_S_Addr),
	.o_Data(w_S_Data),
	.vo_Addr_I(w_S_Addr_I));
	defparam	b2v_FSM_Embaralhador.ChangeAddr = 4'b1000;
	defparam	b2v_FSM_Embaralhador.GetNxtAddr = 4'b0100;
	defparam	b2v_FSM_Embaralhador.I_ReadMemOut = 4'b0010;
	defparam	b2v_FSM_Embaralhador.I_StoreMemOut = 4'b0011;
	defparam	b2v_FSM_Embaralhador.I_WriteMemAddr = 4'b1001;
	defparam	b2v_FSM_Embaralhador.IfState = 4'b1010;
	defparam	b2v_FSM_Embaralhador.IncreaseAddr = 4'b1011;
	defparam	b2v_FSM_Embaralhador.InitOutputs = 4'b0001;
	defparam	b2v_FSM_Embaralhador.J_ReadMemOut = 4'b0101;
	defparam	b2v_FSM_Embaralhador.J_StoreMemOut = 4'b0110;
	defparam	b2v_FSM_Embaralhador.J_WriteMemAddr = 4'b0111;
	defparam	b2v_FSM_Embaralhador.Shuffled = 4'b1100;
	defparam	b2v_FSM_Embaralhador.Start = 4'b0000;


BlackJackController	b2v_FSM_Global(
	.i_Clk(clk),
	.i_Reset(w_ResetPE),
	.i_Stay(w_HiNE),
	.i_Hit(w_StayNE),
	.vi_TwoSec(w_TwoSec),
	.vi_RstOK(w_CountRstOK),
	.vi_Shuffled(w_Shuffled),
	.vi_CardOK(w_CardOK),
	.vi_HandD(w_DealerHnd),
	.vi_HandP(w_PlayerHnd),
	.o_Win(o_Win),
	.o_Lose(o_Lose),
	.o_Tie(o_Tie),
	.o_Hit_P(o_Hit_P),
	.o_Hit_D(o_Hit_D),
	.o_Stay_P(o_Stay_P),
	.o_Stay_D(o_Stay_D),
	.o_ShwHnd_P(w_ShowHndP),
	.o_ShwHnd_D(w_ShowHndD),
	.vo_ActCounter(w_ActCounter),
	.vo_RstCounter(w_RstCounter),
	.vo_ActShuffler(w_ActShuffler),
	.vo_Card2Player(w_Card2Player),
	.vo_Card2Dealer(w_Card2Dealer));
	defparam	b2v_FSM_Global.CardToDealer = 5'b10000;
	defparam	b2v_FSM_Global.CardToPlayer = 5'b01111;
	defparam	b2v_FSM_Global.D1_RstCardFSM = 5'b00011;
	defparam	b2v_FSM_Global.D2_RstCardFSM = 5'b00111;
	defparam	b2v_FSM_Global.DealerBlackJack = 5'b10101;
	defparam	b2v_FSM_Global.DealerHit = 5'b01100;
	defparam	b2v_FSM_Global.DealerStay = 5'b01110;
	defparam	b2v_FSM_Global.DealerTurn = 5'b01010;
	defparam	b2v_FSM_Global.DealerWith1Card = 5'b00100;
	defparam	b2v_FSM_Global.DealerWith2Card = 5'b01000;
	defparam	b2v_FSM_Global.LoseState = 5'b10011;
	defparam	b2v_FSM_Global.Measurement = 5'b10100;
	defparam	b2v_FSM_Global.P_RstCardFSM = 5'b00101;
	defparam	b2v_FSM_Global.PlayerHit = 5'b01011;
	defparam	b2v_FSM_Global.PlayerStay = 5'b01101;
	defparam	b2v_FSM_Global.PlayerTurn = 5'b01001;
	defparam	b2v_FSM_Global.PlayerWith1Card = 5'b00010;
	defparam	b2v_FSM_Global.PlayerWith2Card = 5'b00110;
	defparam	b2v_FSM_Global.ShuffleDeck = 5'b00001;
	defparam	b2v_FSM_Global.Start = 5'b00000;
	defparam	b2v_FSM_Global.TieState = 5'b10010;
	defparam	b2v_FSM_Global.WinState = 5'b10001;


Debouncer	b2v_HitButtonDebouncer(
	.i_Clk(clk),
	.i_Button(i_Hit),
	.o_ButtonDeb(o_HitDeb),
	.o_ButtonDown(o_HitNE),
	.o_ButtonUp(w_HitPE));


// PLL	b2v_inst(
// 	.inclk0(clk),
// 	.c0(clk_PLL));


MemAcessMux	b2v_MemAcessMux(
	.ActShuffler(w_ActShuffler),
	.i_ShufflerClk(w_S_MemClk),
	.i_AdderClk(w_A_MemClk),
	.i_AdderAddress(w_A_Addr),
	.i_ShufflerAddr(w_S_Addr),
	.o_MemClk(w_MemClk),
	.o_Address(w_MemAddr));


Nxt_Addr	b2v_NxtAddr_Decoder(
	.Addr_i(w_S_Addr_I),
	.Count(w_Count),
	.Addr_j(w_S_Addr_J));


displaydecoder	b2v_PlayerHand(
	.enable(w_ShowHndP),
	.hand(w_PlayerHnd),
	.displayd(PlayerHndDisplayD),
	.displayu(PlayerHndDisplayU));


RAM	b2v_RAM(
	.wren(w_WriteEnable),
	.clock(w_MemClk),
	.address(w_MemAddr),
	.data(w_S_Data),
	.q(w_MemData));

// SPRWI RAM(
// 	    .i_Data(w_S_Data),
//         .i_Addr(w_MemAddr), // Memory address
//         .i_WriteEnable(w_WriteEnable),
// 		.i_Clock(w_MemClk),
//         .o_Data(w_MemData)
// 	);


Debouncer	b2v_ResetButtonDebouncer(
	.i_Clk(clk),
	.i_Button(i_Reset),
	.o_ButtonDeb(w_ResetDeb),
	.o_ButtonDown(w_ResetNE),
	.o_ButtonUp(w_ResetPE));


Debouncer	b2v_StayButtonDebouncer(
	.i_Clk(clk),
	.i_Button(i_Stay),
	.o_ButtonDeb(o_StayDeb),
	.o_ButtonDown(o_StayNE),
	.o_ButtonUp(w_StayPE));

assign	clk = inclk0;

endmodule
