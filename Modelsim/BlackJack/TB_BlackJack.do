onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Inputs
add wave -noupdate /TB_BlackJack/DUV/inclk0
add wave -noupdate /TB_BlackJack/DUV/clk_PLL
add wave -noupdate /TB_BlackJack/DUV/i_Reset
add wave -noupdate /TB_BlackJack/DUV/i_Hit
add wave -noupdate /TB_BlackJack/DUV/i_Stay
add wave -noupdate -divider {Debouncer output}
add wave -noupdate /TB_BlackJack/DUV/w_ResetDeb
add wave -noupdate /TB_BlackJack/DUV/w_HitDeb
add wave -noupdate /TB_BlackJack/DUV/w_HitNE
add wave -noupdate /TB_BlackJack/DUV/w_StayDeb
add wave -noupdate /TB_BlackJack/DUV/w_StayNE
add wave -noupdate /TB_BlackJack/DUV/w_HitPE
add wave -noupdate /TB_BlackJack/DUV/w_ResetPE
add wave -noupdate /TB_BlackJack/DUV/w_StayPE
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
add wave -noupdate -radix binary /TB_BlackJack/DUV/DealerHndDisplayD
add wave -noupdate -radix binary /TB_BlackJack/DUV/DealerHndDisplayU
add wave -noupdate -radix binary /TB_BlackJack/DUV/PlayerHndDisplayD
add wave -noupdate -radix binary /TB_BlackJack/DUV/PlayerHndDisplayU
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {13 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 247
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ns} {104 ns}
