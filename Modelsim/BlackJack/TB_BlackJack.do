onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix ascii /TB_BlackJack/StateStringGlobal
add wave -noupdate -divider Inputs
add wave -noupdate /TB_BlackJack/DUV/inclk0
add wave -noupdate /TB_BlackJack/DUV/clk_PLL
add wave -noupdate /TB_BlackJack/DUV/i_Reset
add wave -noupdate /TB_BlackJack/DUV/i_Hit
add wave -noupdate /TB_BlackJack/DUV/i_Stay
add wave -noupdate -divider Outputs
add wave -noupdate /TB_BlackJack/DUV/o_Win
add wave -noupdate /TB_BlackJack/DUV/o_Lose
add wave -noupdate /TB_BlackJack/DUV/o_Tie
add wave -noupdate -divider {Hit or Stay}
add wave -noupdate /TB_BlackJack/DUV/o_Hit_P
add wave -noupdate /TB_BlackJack/DUV/o_Hit_D
add wave -noupdate /TB_BlackJack/DUV/o_Stay_P
add wave -noupdate /TB_BlackJack/DUV/o_Stay_D
add wave -noupdate -divider Hand
add wave -noupdate -divider {Buttons output}
add wave -noupdate /TB_BlackJack/DUV/DealerHndDisplayD
add wave -noupdate /TB_BlackJack/DUV/DealerHndDisplayU
add wave -noupdate /TB_BlackJack/DUV/PlayerHndDisplayD
add wave -noupdate /TB_BlackJack/DUV/PlayerHndDisplayU
add wave -noupdate -divider {SINAIS INTERNOS}
add wave -noupdate -divider {Debouncer output}
add wave -noupdate /TB_BlackJack/DUV/w_ResetDeb
add wave -noupdate /TB_BlackJack/DUV/w_ResetPE
add wave -noupdate /TB_BlackJack/DUV/w_HitDeb
add wave -noupdate /TB_BlackJack/DUV/w_HitPE
add wave -noupdate /TB_BlackJack/DUV/w_HitNE
add wave -noupdate /TB_BlackJack/DUV/w_StayDeb
add wave -noupdate /TB_BlackJack/DUV/w_StayPE
add wave -noupdate /TB_BlackJack/DUV/w_StayNE
add wave -noupdate -divider CONTADOR
add wave -noupdate /TB_BlackJack/DUV/b2v_Contador/clk_2K
add wave -noupdate /TB_BlackJack/DUV/b2v_Contador/i_ActCounter
add wave -noupdate /TB_BlackJack/DUV/b2v_Contador/i_RstCounter
add wave -noupdate /TB_BlackJack/DUV/b2v_Contador/i_ResetNeg
add wave -noupdate /TB_BlackJack/DUV/b2v_Contador/i_ResetDeb
add wave -noupdate -radix unsigned /TB_BlackJack/DUV/b2v_Contador/o_Count
add wave -noupdate /TB_BlackJack/DUV/b2v_Contador/o_TwoSec
add wave -noupdate /TB_BlackJack/DUV/b2v_Contador/o_RstOK
add wave -noupdate -divider Embaralhador
add wave -noupdate -radix ascii /TB_BlackJack/StateStringShuffler
add wave -noupdate -divider Estados
add wave -noupdate -radix unsigned /TB_BlackJack/DUV/b2v_FSM_Embaralhador/A_State
add wave -noupdate -radix unsigned /TB_BlackJack/DUV/b2v_FSM_Embaralhador/F_State
add wave -noupdate -divider Inputs
add wave -noupdate /TB_BlackJack/DUV/b2v_FSM_Embaralhador/clk
add wave -noupdate /TB_BlackJack/DUV/b2v_FSM_Embaralhador/i_ActShuffler
add wave -noupdate -radix unsigned /TB_BlackJack/DUV/b2v_FSM_Embaralhador/i_MemData
add wave -noupdate -radix unsigned /TB_BlackJack/DUV/b2v_FSM_Embaralhador/i_Addr_J
add wave -noupdate -divider Outputs
add wave -noupdate /TB_BlackJack/DUV/b2v_FSM_Embaralhador/o_Shuffled
add wave -noupdate -radix unsigned /TB_BlackJack/DUV/b2v_FSM_Embaralhador/o_Data
add wave -noupdate -radix unsigned /TB_BlackJack/DUV/b2v_FSM_Embaralhador/o_Address
add wave -noupdate /TB_BlackJack/DUV/b2v_FSM_Embaralhador/o_MemClk
add wave -noupdate /TB_BlackJack/DUV/b2v_FSM_Embaralhador/o_Write
add wave -noupdate -radix unsigned /TB_BlackJack/DUV/b2v_FSM_Embaralhador/vo_Addr_I
add wave -noupdate -divider {Sinais internos}
add wave -noupdate -radix unsigned /TB_BlackJack/DUV/b2v_FSM_Embaralhador/vc_Data_I
add wave -noupdate -radix unsigned /TB_BlackJack/DUV/b2v_FSM_Embaralhador/vc_Data_J
add wave -noupdate -divider {Card Adder}
add wave -noupdate -radix ascii /TB_BlackJack/StateStringCardAdder
add wave -noupdate -divider Estado
add wave -noupdate -radix unsigned -childformat {{{/TB_BlackJack/DUV/b2v_FSM_CardAdder/A_State[3]} -radix unsigned} {{/TB_BlackJack/DUV/b2v_FSM_CardAdder/A_State[2]} -radix unsigned} {{/TB_BlackJack/DUV/b2v_FSM_CardAdder/A_State[1]} -radix unsigned} {{/TB_BlackJack/DUV/b2v_FSM_CardAdder/A_State[0]} -radix unsigned}} -subitemconfig {{/TB_BlackJack/DUV/b2v_FSM_CardAdder/A_State[3]} {-height 16 -radix unsigned} {/TB_BlackJack/DUV/b2v_FSM_CardAdder/A_State[2]} {-height 16 -radix unsigned} {/TB_BlackJack/DUV/b2v_FSM_CardAdder/A_State[1]} {-height 16 -radix unsigned} {/TB_BlackJack/DUV/b2v_FSM_CardAdder/A_State[0]} {-height 16 -radix unsigned}} /TB_BlackJack/DUV/b2v_FSM_CardAdder/A_State
add wave -noupdate -radix unsigned /TB_BlackJack/DUV/b2v_FSM_CardAdder/F_State
add wave -noupdate -divider Inputs
add wave -noupdate -radix binary /TB_BlackJack/DUV/b2v_FSM_CardAdder/i_Clock
add wave -noupdate -radix unsigned /TB_BlackJack/DUV/b2v_FSM_CardAdder/i_Card
add wave -noupdate -radix unsigned /TB_BlackJack/DUV/b2v_FSM_CardAdder/i_Value
add wave -noupdate -radix binary /TB_BlackJack/DUV/b2v_FSM_CardAdder/i_Card2P
add wave -noupdate -radix binary /TB_BlackJack/DUV/b2v_FSM_CardAdder/i_Card2D
add wave -noupdate -divider Memoria
add wave -noupdate -radix unsigned /TB_BlackJack/DUV/b2v_FSM_CardAdder/r_Addr
add wave -noupdate -divider Outputs
add wave -noupdate -radix binary /TB_BlackJack/DUV/b2v_FSM_CardAdder/i_Reset
add wave -noupdate -radix unsigned /TB_BlackJack/DUV/b2v_FSM_CardAdder/o_Address
add wave -noupdate /TB_BlackJack/DUV/b2v_FSM_CardAdder/o_MemClk
add wave -noupdate -radix unsigned /TB_BlackJack/DUV/b2v_FSM_CardAdder/o_DealerHnd
add wave -noupdate -radix unsigned /TB_BlackJack/DUV/b2v_FSM_CardAdder/o_PlayerHnd
add wave -noupdate /TB_BlackJack/DUV/b2v_FSM_CardAdder/o_CardOK
add wave -noupdate -divider {Variaveis internas}
add wave -noupdate -divider {Cartas na mao}
add wave -noupdate -radix unsigned /TB_BlackJack/DUV/b2v_FSM_CardAdder/vc_HndD
add wave -noupdate -radix unsigned /TB_BlackJack/DUV/b2v_FSM_CardAdder/vc_HndP
add wave -noupdate /TB_BlackJack/DUV/b2v_FSM_CardAdder/vc_Ace_D
add wave -noupdate /TB_BlackJack/DUV/b2v_FSM_CardAdder/vc_Ace_P
add wave -noupdate /TB_BlackJack/DUV/b2v_FSM_CardAdder/vc_Face_D
add wave -noupdate /TB_BlackJack/DUV/b2v_FSM_CardAdder/vc_Face_P
add wave -noupdate -divider {Black Jack Controller}
add wave -noupdate -divider Entradas
add wave -noupdate /TB_BlackJack/DUV/b2v_FSM_Global/i_Clk
add wave -noupdate /TB_BlackJack/DUV/b2v_FSM_Global/i_Reset
add wave -noupdate /TB_BlackJack/DUV/b2v_FSM_Global/i_Stay
add wave -noupdate /TB_BlackJack/DUV/b2v_FSM_Global/i_Hit
add wave -noupdate -divider Saidas
add wave -noupdate /TB_BlackJack/DUV/b2v_FSM_Global/o_Win
add wave -noupdate /TB_BlackJack/DUV/b2v_FSM_Global/o_Lose
add wave -noupdate /TB_BlackJack/DUV/b2v_FSM_Global/o_Tie
add wave -noupdate /TB_BlackJack/DUV/b2v_FSM_Global/o_Hit_P
add wave -noupdate /TB_BlackJack/DUV/b2v_FSM_Global/o_Hit_D
add wave -noupdate /TB_BlackJack/DUV/b2v_FSM_Global/o_Stay_P
add wave -noupdate /TB_BlackJack/DUV/b2v_FSM_Global/o_Stay_D
add wave -noupdate /TB_BlackJack/DUV/b2v_FSM_Global/o_ShwHnd_P
add wave -noupdate /TB_BlackJack/DUV/b2v_FSM_Global/o_ShwHnd_D
add wave -noupdate -divider {Interface com o contador}
add wave -noupdate /TB_BlackJack/DUV/b2v_FSM_Global/vi_TwoSec
add wave -noupdate /TB_BlackJack/DUV/b2v_FSM_Global/vi_RstOK
add wave -noupdate /TB_BlackJack/DUV/b2v_FSM_Global/vo_ActCounter
add wave -noupdate /TB_BlackJack/DUV/b2v_FSM_Global/vo_RstCounter
add wave -noupdate -divider {Interface com o embaralhador}
add wave -noupdate /TB_BlackJack/DUV/b2v_FSM_Global/vi_Shuffled
add wave -noupdate /TB_BlackJack/DUV/b2v_FSM_Global/vo_ActShuffler
add wave -noupdate -divider {Interface com o CardAdder}
add wave -noupdate /TB_BlackJack/DUV/b2v_FSM_Global/vi_CardOK
add wave -noupdate /TB_BlackJack/DUV/b2v_FSM_Global/vi_HandP
add wave -noupdate /TB_BlackJack/DUV/b2v_FSM_Global/vi_HandD
add wave -noupdate /TB_BlackJack/DUV/b2v_FSM_Global/vo_Card2Player
add wave -noupdate /TB_BlackJack/DUV/b2v_FSM_Global/vo_Card2Dealer
add wave -noupdate /TB_BlackJack/DUV/b2v_FSM_Global/vc_HitPlayer
add wave -noupdate /TB_BlackJack/DUV/b2v_FSM_Global/vc_FirstTurn
add wave -noupdate /TB_BlackJack/DUV/b2v_FSM_Global/A_State
add wave -noupdate /TB_BlackJack/DUV/b2v_FSM_Global/F_State
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {60428 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 247
configure wave -valuecolwidth 114
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {60426 ns} {60453 ns}
