interface tb_fifo_if(input tb_clk);
import tb_fifo_pkg::*;
//declaration of data

dato_type tb_data_in;
dato_type tb_data_out;

push_e_t push;
pop_e_t  pop;

bit 	fifo_empty;	//this is my empty flag
bit 	fifo_full;	//this is my full flag

bit 	rst;
/////////////////////BEGIN MODPORTS\\\\\\\\\\\\\\\\\\\
modport fifo
(
input	rst,
input 	tb_data_in,
output	tb_data_out,

input 	push,
input	pop,

output	fifo_empty,
output	fifo_full
);

modport tb
(
output rst,
output 	tb_data_in,
input	tb_data_out,

output	push,
output	pop,

input	fifo_empty,
input	fifo_full
);

endinterface:tb_fifo_if
