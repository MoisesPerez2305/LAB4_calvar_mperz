`include "fifo_class.svh";

module tb_fifo();
import	tb_fifo_pkg::*;
		//tb_fifo_pkg::*;
	bit wrclk_tb = 0;
	bit rdclk_tb = 0;
	
	bit wr_rst_tb;
	bit rd_rst_tb;
	
	//fifo class or driver
	fifo_class fifo_obj;
	
	//fifo interface
	fifo_if itf_tb(/*.tb_clk(clk), .rst(rst)*/);
	fifo_top DUV(	//conecting DUV to my TBenv
						.wr_clk(wrclk_tb),
						.wr_rst(wr_rst_tb),
						.rd_clk(rdclk_tb),
						.rd_rst(rd_rst_tb),
						.itf(itf_tb.fifo) 
		);
	
	initial begin
		fork
			forever #1 wrclk_tb = ~wrclk_tb;
			forever #3 rdclk_tb = ~rdclk_tb;
		join
	end
	
	initial begin
		
	fifo_obj = new(itf_tb);
	//Starting reset for wr and rd
	#0 wr_rst_tb = 1; rd_rst_tb = 1;
	#2 wr_rst_tb = 0; rd_rst_tb = 0;
	#2 wr_rst_tb = 1; rd_rst_tb = 1;
	
	//fifo_obj.wke_up();
	
	repeat(16)begin
		#2	fifo_obj.push_action();
		end
	end
endmodule:tb_fifo

