onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Inputs
add wave -noupdate -radix binary /Counter_TB/DUV/clk_2K
add wave -noupdate -radix binary /Counter_TB/DUV/i_RstCounter
add wave -noupdate -radix binary /Counter_TB/DUV/i_ActCounter
add wave -noupdate -radix binary /Counter_TB/DUV/i_Reset
add wave -noupdate /Counter_TB/DUV/ne_Reset
add wave -noupdate -divider Outputs
add wave -noupdate -radix unsigned /Counter_TB/DUV/o_Count
add wave -noupdate /Counter_TB/DUV/o_TwoSec
add wave -noupdate -divider {Test variables}
add wave -noupdate -radix unsigned -childformat {{{/Counter_TB/r_Contador[11]} -radix unsigned} {{/Counter_TB/r_Contador[10]} -radix unsigned} {{/Counter_TB/r_Contador[9]} -radix unsigned} {{/Counter_TB/r_Contador[8]} -radix unsigned} {{/Counter_TB/r_Contador[7]} -radix unsigned} {{/Counter_TB/r_Contador[6]} -radix unsigned} {{/Counter_TB/r_Contador[5]} -radix unsigned} {{/Counter_TB/r_Contador[4]} -radix unsigned} {{/Counter_TB/r_Contador[3]} -radix unsigned} {{/Counter_TB/r_Contador[2]} -radix unsigned} {{/Counter_TB/r_Contador[1]} -radix unsigned} {{/Counter_TB/r_Contador[0]} -radix unsigned}} -subitemconfig {{/Counter_TB/r_Contador[11]} {-height 16 -radix unsigned} {/Counter_TB/r_Contador[10]} {-height 16 -radix unsigned} {/Counter_TB/r_Contador[9]} {-height 16 -radix unsigned} {/Counter_TB/r_Contador[8]} {-height 16 -radix unsigned} {/Counter_TB/r_Contador[7]} {-height 16 -radix unsigned} {/Counter_TB/r_Contador[6]} {-height 16 -radix unsigned} {/Counter_TB/r_Contador[5]} {-height 16 -radix unsigned} {/Counter_TB/r_Contador[4]} {-height 16 -radix unsigned} {/Counter_TB/r_Contador[3]} {-height 16 -radix unsigned} {/Counter_TB/r_Contador[2]} {-height 16 -radix unsigned} {/Counter_TB/r_Contador[1]} {-height 16 -radix unsigned} {/Counter_TB/r_Contador[0]} {-height 16 -radix unsigned}} /Counter_TB/r_Contador
add wave -noupdate /Counter_TB/DUV/r_Count
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {34 ns} 0}
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
