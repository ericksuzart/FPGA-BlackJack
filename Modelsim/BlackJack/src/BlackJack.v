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
// CREATED		"Thu Nov 28 02:33:24 2019"

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
	o_ResetState,
	o_StayState,
	o_StayDown,
	o_HitState,
	o_HitDown,
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
output wire	o_ResetState;
output wire	o_StayState;
output wire	o_StayDown;
output wire	o_HitState;
output wire	o_HitDown;
output wire	[0:6] DealerHndDisplayD;
output wire	[0:6] DealerHndDisplayU;
output wire	[0:6] PlayerHndDisplayD;
output wire	[0:6] PlayerHndDisplayU;

wire	[3:0] SYNTHESIZED_WIRE_40;
wire	SYNTHESIZED_WIRE_41;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	[5:0] SYNTHESIZED_WIRE_42;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_43;
wire	[3:0] SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_44;
wire	[5:0] SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_21;
wire	[5:0] SYNTHESIZED_WIRE_45;
wire	SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_27;
wire	[5:0] SYNTHESIZED_WIRE_28;
wire	[5:0] SYNTHESIZED_WIRE_29;
wire	[5:0] SYNTHESIZED_WIRE_30;
wire	[11:0] SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_35;
wire	[5:0] SYNTHESIZED_WIRE_36;
wire	[3:0] SYNTHESIZED_WIRE_37;





CardEvaluator	b2v_CardEvaluatorDecoder(
	.i_Card(SYNTHESIZED_WIRE_40),
	.o_Value(SYNTHESIZED_WIRE_11));


Counter	b2v_Contador(
	.clk_2K(SYNTHESIZED_WIRE_41),
	.i_ActCounter(SYNTHESIZED_WIRE_2),
	.i_RstCounter(SYNTHESIZED_WIRE_3),
	.i_Reset(SYNTHESIZED_WIRE_4),
	.o_TwoSec(SYNTHESIZED_WIRE_18),
	.o_RstOK(SYNTHESIZED_WIRE_19),
	.o_Count(SYNTHESIZED_WIRE_31));
	defparam	b2v_Contador.WIDTH = 12;


displaydecoder	b2v_DealerHand(
	.enable(SYNTHESIZED_WIRE_5),
	.hand(SYNTHESIZED_WIRE_42),
	.displayd(DealerHndDisplayD),
	.displayu(DealerHndDisplayU));


CardAdder	b2v_FSM_CardAdder(
	.i_Card2P(SYNTHESIZED_WIRE_7),
	.i_Card2D(SYNTHESIZED_WIRE_8),
	.i_Reset(SYNTHESIZED_WIRE_43),
	.i_Clock(inclk0),
	.i_Card(SYNTHESIZED_WIRE_40),
	.i_Value(SYNTHESIZED_WIRE_11),
	.o_MemClk(SYNTHESIZED_WIRE_27),
	.o_CardOK(SYNTHESIZED_WIRE_21),
	.o_Address(SYNTHESIZED_WIRE_28),
	.o_DealerHnd(SYNTHESIZED_WIRE_42),
	.o_PlayerHnd(SYNTHESIZED_WIRE_45));
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
	.i_ActShuffler(SYNTHESIZED_WIRE_44),
	.clk(inclk0),
	.i_Addr_J(SYNTHESIZED_WIRE_13),
	.i_MemData(SYNTHESIZED_WIRE_40),
	.o_Shuffled(SYNTHESIZED_WIRE_20),
	.o_MemClk(SYNTHESIZED_WIRE_26),
	.o_Write(SYNTHESIZED_WIRE_34),
	.o_Address(SYNTHESIZED_WIRE_29),
	.o_Data(SYNTHESIZED_WIRE_37),
	.vo_Addr_I(SYNTHESIZED_WIRE_30));
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
	.i_Clk(inclk0),
	.i_Reset(SYNTHESIZED_WIRE_43),
	.i_Stay(SYNTHESIZED_WIRE_16),
	.i_Hit(SYNTHESIZED_WIRE_17),
	.vi_TwoSec(SYNTHESIZED_WIRE_18),
	.vi_RstOK(SYNTHESIZED_WIRE_19),
	.vi_Shuffled(SYNTHESIZED_WIRE_20),
	.vi_CardOK(SYNTHESIZED_WIRE_21),
	.vi_HandD(SYNTHESIZED_WIRE_42),
	.vi_HandP(SYNTHESIZED_WIRE_45),
	.o_Win(o_Win),
	.o_Lose(o_Lose),
	.o_Tie(o_Tie),
	.o_Hit_P(o_Hit_P),
	.o_Hit_D(o_Hit_D),
	.o_Stay_P(o_Stay_P),
	.o_Stay_D(o_Stay_D),
	.o_ShwHnd_P(SYNTHESIZED_WIRE_32),
	.o_ShwHnd_D(SYNTHESIZED_WIRE_5),
	.vo_ActCounter(SYNTHESIZED_WIRE_3),
	.vo_RstCounter(SYNTHESIZED_WIRE_2),
	.vo_ActShuffler(SYNTHESIZED_WIRE_44),
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
	.i_Clk_2kHz(SYNTHESIZED_WIRE_41),
	.i_Button(i_Stay),
	.o_State(o_StayState),
	.o_ButtonDown(o_StayDown),
	.o_ButtonUp(SYNTHESIZED_WIRE_16));


PLL	b2v_inst(
	.inclk0(inclk0),
	.c0(SYNTHESIZED_WIRE_41));


MemAcessMux	b2v_MemAcessMux(
	.ActShuffler(SYNTHESIZED_WIRE_44),
	.i_ShufflerClk(SYNTHESIZED_WIRE_26),
	.i_AdderClk(SYNTHESIZED_WIRE_27),
	.i_AdderAddress(SYNTHESIZED_WIRE_28),
	.i_ShufflerAddr(SYNTHESIZED_WIRE_29),
	.o_MemClk(SYNTHESIZED_WIRE_35),
	.o_Address(SYNTHESIZED_WIRE_36));


Nxt_Addr	b2v_NxtAddr_Decoder(
	.Addr_i(SYNTHESIZED_WIRE_30),
	.Count(SYNTHESIZED_WIRE_31),
	.Addr_j(SYNTHESIZED_WIRE_13));


displaydecoder	b2v_PlayerHand(
	.enable(SYNTHESIZED_WIRE_32),
	.hand(SYNTHESIZED_WIRE_45),
	.displayd(PlayerHndDisplayD),
	.displayu(PlayerHndDisplayU));


RAM	b2v_RAM(
	.wren(SYNTHESIZED_WIRE_34),
	.clock(SYNTHESIZED_WIRE_35),
	.address(SYNTHESIZED_WIRE_36),
	.data(SYNTHESIZED_WIRE_37),
	.q(SYNTHESIZED_WIRE_40));


Debouncer	b2v_ResetButtonDebouncer(
	.i_Clk_2kHz(SYNTHESIZED_WIRE_41),
	.i_Button(i_Reset),
	.o_State(o_ResetState),
	.o_ButtonDown(SYNTHESIZED_WIRE_4),
	.o_ButtonUp(SYNTHESIZED_WIRE_43));


Debouncer	b2v_StayButtonDebouncer(
	.i_Clk_2kHz(SYNTHESIZED_WIRE_41),
	.i_Button(i_Hit),
	.o_State(o_HitState),
	.o_ButtonDown(o_HitDown),
	.o_ButtonUp(SYNTHESIZED_WIRE_17));


endmodule
