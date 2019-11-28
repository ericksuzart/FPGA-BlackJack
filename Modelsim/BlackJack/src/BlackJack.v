`timescale 1ns/1ns
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
// CREATED		"Thu Nov 28 16:24:11 2019"

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
	w_ResetDeb,
	w_HitDeb,
	w_HitNE,
	w_StayDeb,
	w_StayNE,
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
output wire	w_ResetDeb;
output wire	w_HitDeb;
output wire	w_HitNE;
output wire	w_StayDeb;
output wire	w_StayNE;
output wire	[0:6] DealerHndDisplayD;
output wire	[0:6] DealerHndDisplayU;
output wire	[0:6] PlayerHndDisplayD;
output wire	[0:6] PlayerHndDisplayU;

wire	clk;
wire	clk_PLL;
wire	w_HitPE;
wire	w_ResetPE;
wire	w_StayPE;
wire	[3:0] SYNTHESIZED_WIRE_33;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	[5:0] SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	[3:0] SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_35;
wire	[5:0] SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	[5:0] SYNTHESIZED_WIRE_36;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_22;
wire	[5:0] SYNTHESIZED_WIRE_23;
wire	[5:0] SYNTHESIZED_WIRE_24;
wire	[5:0] SYNTHESIZED_WIRE_25;
wire	[11:0] SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_30;
wire	[5:0] SYNTHESIZED_WIRE_31;
wire	[3:0] SYNTHESIZED_WIRE_32;

assign	w_ResetDeb = SYNTHESIZED_WIRE_4;


CardEvaluator	b2v_CardEvaluatorDecoder(
	.i_Card(SYNTHESIZED_WIRE_33),
	.o_Value(SYNTHESIZED_WIRE_10));


Counter	b2v_Contador(
	.clk_2K(clk_PLL),
	.i_ActCounter(SYNTHESIZED_WIRE_1),
	.i_RstCounter(SYNTHESIZED_WIRE_2),
	.i_ResetNeg(SYNTHESIZED_WIRE_3),
	.i_ResetDeb(SYNTHESIZED_WIRE_4),
	.o_TwoSec(SYNTHESIZED_WIRE_14),
	.o_RstOK(SYNTHESIZED_WIRE_15),
	.o_Count(SYNTHESIZED_WIRE_26));
	defparam	b2v_Contador.WIDTH = 12;


displaydecoder	b2v_DealerHand(
	.enable(SYNTHESIZED_WIRE_5),
	.hand(SYNTHESIZED_WIRE_34),
	.displayd(DealerHndDisplayD),
	.displayu(DealerHndDisplayU));


CardAdder	b2v_FSM_CardAdder(
	.i_Card2P(SYNTHESIZED_WIRE_7),
	.i_Card2D(SYNTHESIZED_WIRE_8),
	.i_Reset(w_ResetPE),
	.i_Clock(clk),
	.i_Card(SYNTHESIZED_WIRE_33),
	.i_Value(SYNTHESIZED_WIRE_10),
	.o_MemClk(SYNTHESIZED_WIRE_22),
	.o_CardOK(SYNTHESIZED_WIRE_17),
	.o_Address(SYNTHESIZED_WIRE_23),
	.o_DealerHnd(SYNTHESIZED_WIRE_34),
	.o_PlayerHnd(SYNTHESIZED_WIRE_36));
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
	.i_ActShuffler(SYNTHESIZED_WIRE_35),
	.clk(clk),
	.i_Addr_J(SYNTHESIZED_WIRE_12),
	.i_MemData(SYNTHESIZED_WIRE_33),
	.o_Shuffled(SYNTHESIZED_WIRE_16),
	.o_MemClk(SYNTHESIZED_WIRE_21),
	.o_Write(SYNTHESIZED_WIRE_29),
	.o_Address(SYNTHESIZED_WIRE_24),
	.o_Data(SYNTHESIZED_WIRE_32),
	.vo_Addr_I(SYNTHESIZED_WIRE_25));
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
	.i_Stay(w_HitPE),
	.i_Hit(w_StayPE),
	.vi_TwoSec(SYNTHESIZED_WIRE_14),
	.vi_RstOK(SYNTHESIZED_WIRE_15),
	.vi_Shuffled(SYNTHESIZED_WIRE_16),
	.vi_CardOK(SYNTHESIZED_WIRE_17),
	.vi_HandD(SYNTHESIZED_WIRE_34),
	.vi_HandP(SYNTHESIZED_WIRE_36),
	.o_Win(o_Win),
	.o_Lose(o_Lose),
	.o_Tie(o_Tie),
	.o_Hit_P(o_Hit_P),
	.o_Hit_D(o_Hit_D),
	.o_Stay_P(o_Stay_P),
	.o_Stay_D(o_Stay_D),
	.o_ShwHnd_P(SYNTHESIZED_WIRE_27),
	.o_ShwHnd_D(SYNTHESIZED_WIRE_5),
	.vo_ActCounter(SYNTHESIZED_WIRE_2),
	.vo_RstCounter(SYNTHESIZED_WIRE_1),
	.vo_ActShuffler(SYNTHESIZED_WIRE_35),
	.vo_Card2Player(SYNTHESIZED_WIRE_7),
	.vo_Card2Dealer(SYNTHESIZED_WIRE_8));
	defparam	b2v_FSM_Global.CardToDealer = 5'b01101;
	defparam	b2v_FSM_Global.CardToPlayer = 5'b01100;
	defparam	b2v_FSM_Global.DealerBlackJack = 5'b10010;
	defparam	b2v_FSM_Global.DealerHit = 5'b01001;
	defparam	b2v_FSM_Global.DealerStay = 5'b01011;
	defparam	b2v_FSM_Global.DealerTurn = 5'b00111;
	defparam	b2v_FSM_Global.DealerWith1Card = 5'b00011;
	defparam	b2v_FSM_Global.DealerWith2Card = 5'b00101;
	defparam	b2v_FSM_Global.LoseState = 5'b10000;
	defparam	b2v_FSM_Global.Measurement = 5'b10001;
	defparam	b2v_FSM_Global.PlayerHit = 5'b01000;
	defparam	b2v_FSM_Global.PlayerStay = 5'b01010;
	defparam	b2v_FSM_Global.PlayerTurn = 5'b00110;
	defparam	b2v_FSM_Global.PlayerWith1Card = 5'b00010;
	defparam	b2v_FSM_Global.PlayerWith2Card = 5'b00100;
	defparam	b2v_FSM_Global.ShuffleDeck = 5'b00001;
	defparam	b2v_FSM_Global.Start = 5'b00000;
	defparam	b2v_FSM_Global.TieState = 5'b01111;
	defparam	b2v_FSM_Global.WinState = 5'b01110;


Debouncer	b2v_HitButtonDebouncer(
	.i_Clk_2kHz(clk),
	.i_Button(i_Hit),
	.o_ButtonDeb(w_HitDeb),
	.o_ButtonDown(w_HitNE),
	.o_ButtonUp(w_HitPE));


PLL	b2v_inst(
	.inclk0(clk),
	.c0(clk));


MemAcessMux	b2v_MemAcessMux(
	.ActShuffler(SYNTHESIZED_WIRE_35),
	.i_ShufflerClk(SYNTHESIZED_WIRE_21),
	.i_AdderClk(SYNTHESIZED_WIRE_22),
	.i_AdderAddress(SYNTHESIZED_WIRE_23),
	.i_ShufflerAddr(SYNTHESIZED_WIRE_24),
	.o_MemClk(SYNTHESIZED_WIRE_30),
	.o_Address(SYNTHESIZED_WIRE_31));


Nxt_Addr	b2v_NxtAddr_Decoder(
	.Addr_i(SYNTHESIZED_WIRE_25),
	.Count(SYNTHESIZED_WIRE_26),
	.Addr_j(SYNTHESIZED_WIRE_12));


displaydecoder	b2v_PlayerHand(
	.enable(SYNTHESIZED_WIRE_27),
	.hand(SYNTHESIZED_WIRE_36),
	.displayd(PlayerHndDisplayD),
	.displayu(PlayerHndDisplayU));


RAM	b2v_RAM(
	.wren(SYNTHESIZED_WIRE_29),
	.clock(SYNTHESIZED_WIRE_30),
	.address(SYNTHESIZED_WIRE_31),
	.data(SYNTHESIZED_WIRE_32),
	.q(SYNTHESIZED_WIRE_33));


Debouncer	b2v_ResetButtonDebouncer(
	.i_Clk_2kHz(clk),
	.i_Button(i_Reset),
	.o_ButtonDeb(SYNTHESIZED_WIRE_4),
	.o_ButtonDown(SYNTHESIZED_WIRE_3),
	.o_ButtonUp(w_ResetPE));


Debouncer	b2v_StayButtonDebouncer(
	.i_Clk_2kHz(clk),
	.i_Button(i_Stay),
	.o_ButtonDeb(w_StayDeb),
	.o_ButtonDown(w_StayNE),
	.o_ButtonUp(w_StayPE));

assign	clk = inclk0;

// Simulação de um PLL
reg r_clk_PLL;

initial r_clk_PLL = 1'b0;

always #250000 r_clk_PLL <= ~r_clk_PLL;	

assign clk_PLL = r_clk_PLL;
endmodule
