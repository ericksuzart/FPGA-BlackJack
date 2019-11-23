onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Inputs
add wave -noupdate -radix binary /Counter_TB/DUV/clk_2K
add wave -noupdate -radix binary /Counter_TB/DUV/i_RstCounter
add wave -noupdate -radix binary /Counter_TB/DUV/i_ActCounter
add wave -noupdate -radix binary /Counter_TB/DUV/i_Reset
add wave -noupdate -divider Outputs
add wave -noupdate -radix unsigned /Counter_TB/DUV/o_Count
add wave -noupdate /Counter_TB/DUV/o_TwoSec
add wave -noupdate -divider {Test variables}
add wave -noupdate -radix unsigned /Counter_TB/r_Contador
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {77787 ns} 0}
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
WaveRestoreZoom {0 ns} {128 ns}
