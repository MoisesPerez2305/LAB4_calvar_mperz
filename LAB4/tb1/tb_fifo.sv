`include "fifo_class.svh";

module tb_fifo();
import	tb_fifo_pkg::*;
	
	bit clk;
	
	fifo_class fifo_obj;
	
	tb_fifo_if interf(.tb_clk(clk));
	
	fifo_wrapper DUV(	.wrclk(clk),
						.rdclk(clk),
						.wr_rst(interf.rst),
						.rd_rst(interf.rst),
						.push(interf.push),
						.full(interf.fifo_full),
						.data_in(interf.tb_data_in),
						.pop(interf.pop),
						.empty(interf.fifo_empty),
						.data_out(interf.tb_data_out)
		);
	
	initial begin
		forever #1 clk = ~clk;
	end
	
	initial begin
	fifo_obj = new(interf);
	
	fifo_obj.wke_up();
	//oVERFLOW TASK
	repeat(33)begin
		#1	fifo_obj.push_action();
		end
	end
endmodule:tb_fifo

