
`ifndef TB_FIFO_PKG_SV
	`define TB_FIFO_PKG_SV
	
package tb_fifo_pkg;
	
	localparam W_ADDR	=	3;
	localparam W_DEPTH	=	2**W_ADDR;
	
	typedef logic [W_DEPTH-1:0] dato_type;
	typedef logic cola [W_DEPTH-1:0];
	
	typedef enum logic {
       NO_POP = 0,
       POP = 1
    }pop_e_t;
	
	typedef enum logic {
       NO_PUSH = 0,
       PUSH = 1
	} push_e_t;
	
	
endpackage:tb_fifo_pkg
	
`endif