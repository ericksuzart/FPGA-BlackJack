onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /TB_Debouncer/ResetButton/i_Clk
add wave -noupdate -divider Debouncer
add wave -noupdate -divider Inputs
add wave -noupdate /TB_Debouncer/ResetButton/i_Button
add wave -noupdate -divider Outputs
add wave -noupdate /TB_Debouncer/ResetButton/o_ButtonDeb
add wave -noupdate /TB_Debouncer/ResetButton/o_ButtonDown
add wave -noupdate /TB_Debouncer/ResetButton/o_ButtonUp
add wave -noupdate -divider Internal
add wave -noupdate /TB_Debouncer/ResetButton/r_ButtonSync
add wave -noupdate /TB_Debouncer/ResetButton/r_Intermediario
add wave -noupdate -divider Counter
add wave -noupdate -divider Inputs
add wave -noupdate /TB_Debouncer/DUV/i_ActCounter
add wave -noupdate /TB_Debouncer/DUV/i_RstCounter
add wave -noupdate /TB_Debouncer/DUV/i_ResetNeg
add wave -noupdate /TB_Debouncer/DUV/i_ResetDeb
add wave -noupdate -divider Outputs
add wave -noupdate -radix unsigned /TB_Debouncer/DUV/o_Count
add wave -noupdate /TB_Debouncer/DUV/o_TwoSec
add wave -noupdate /TB_Debouncer/DUV/o_RstOK
add wave -noupdate -divider Testbench
add wave -noupdate -radix unsigned /TB_Debouncer/r_Contador
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {0 ns} {384 ns}
