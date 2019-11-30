onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Nxt_Addr
add wave -noupdate -radix unsigned /Nxt_Addr_TB/NA_DUV/a_i
add wave -noupdate -radix unsigned /Nxt_Addr_TB/NA_DUV/a_j
add wave -noupdate -radix unsigned /Nxt_Addr_TB/NA_DUV/cnt
add wave -noupdate -divider Inputs
add wave -noupdate -radix binary /Nxt_Addr_TB/C_DUV/clk_2K
add wave -noupdate -radix binary /Nxt_Addr_TB/C_DUV/i_RstCounter
add wave -noupdate -radix binary /Nxt_Addr_TB/C_DUV/i_ActCounter
add wave -noupdate -radix binary /Nxt_Addr_TB/C_DUV/i_Reset
add wave -noupdate -divider Counter
add wave -noupdate -radix unsigned /Nxt_Addr_TB/C_DUV/o_Count
add wave -noupdate -radix binary /Nxt_Addr_TB/C_DUV/o_TwoSec
add wave -noupdate -radix unsigned /Nxt_Addr_TB/C_DUV/r_Count
add wave -noupdate -divider Test
add wave -noupdate -radix unsigned /Nxt_Addr_TB/First_Addr_j
add wave -noupdate -radix unsigned /Nxt_Addr_TB/Second_Addr_j
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {70795 ns} 0}
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
WaveRestoreZoom {0 ns} {126 ns}
