onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group TB_wkup /tb_fifo/wr_rst_tb
add wave -noupdate -expand -group TB_wkup /tb_fifo/rd_rst_tb
add wave -noupdate -expand -group TB_wkup /tb_fifo/wrclk_tb
add wave -noupdate -expand -group TB_wkup /tb_fifo/rdclk_tb
add wave -noupdate -expand -group itf /tb_fifo/itf_tb/data_in
add wave -noupdate -expand -group itf /tb_fifo/itf_tb/push
add wave -noupdate -expand -group itf /tb_fifo/itf_tb/data_out
add wave -noupdate -expand -group itf /tb_fifo/itf_tb/pop
add wave -noupdate -expand -group itf /tb_fifo/itf_tb/empty
add wave -noupdate -expand -group itf /tb_fifo/itf_tb/full
add wave -noupdate -expand -group DUV /tb_fifo/DUV/wr_rst
add wave -noupdate -expand -group DUV /tb_fifo/DUV/rd_rst
add wave -noupdate -expand -group DUV /tb_fifo/DUV/wr_clk
add wave -noupdate -expand -group DUV /tb_fifo/DUV/rd_clk
add wave -noupdate -expand -group DUV /tb_fifo/DUV/empty
add wave -noupdate -expand -group DUV /tb_fifo/DUV/full
add wave -noupdate -expand -group DUV /tb_fifo/DUV/ram_w_addr
add wave -noupdate -expand -group DUV /tb_fifo/DUV/wptr_w2r_1
add wave -noupdate -expand -group DUV /tb_fifo/DUV/wptr_w2r_2
add wave -noupdate -expand -group DUV /tb_fifo/DUV/rq2_wptr
add wave -noupdate -expand -group DUV /tb_fifo/DUV/wq2_rptr
add wave -noupdate -expand -group DUV /tb_fifo/DUV/ram_r_addr
add wave -noupdate -expand -group DUV /tb_fifo/DUV/rptr_r2w_1
add wave -noupdate -expand -group DUV /tb_fifo/DUV/rptr_r2w_2
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {6 ps} 0}
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {32 ps}
