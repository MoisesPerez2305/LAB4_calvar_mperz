interface fifo_if(
);
import fifo_pkg::*;

// write process
push_e_t    push; 	//typedef variable "enum NO_PUSH=0, PUSH=1"
logic 	   full;
data_t      data_in;	//typedef variable "7:0 logic"
// Read process
pop_e_t 	   pop; //typedef variable "enum NO_POP=0 POP=1"
logic 	   empty;
data_t      data_out;   //typedef variable "7:0 logic"

modport fifo (
	input  push,
	output full,
	input  data_in,
	input  pop,
	output empty,
	output data_out
);

modport dvr (
	output   push,
	input    full,
	output   data_in,
	output   pop,
	input    empty,
	input    data_out
);

endinterface
