import tb_fifo_pkg::*;

class fifo_class;

///////////////declaracion de variables\\\\\\\\\\\\\
virtual fifo_if vinterf;	//variable virtual para virtualizar interfaz
dato_type 	q[$];

logic 		full_tb;
logic 		empty_tb;
	
push_e_t 	push_casting;	//variable temp paracasteo de push (pkg ytb_pkg)
pop_e_t		pop_casting;	//variable temp paracasteo de pop (pkg ytb_pkg)
///////////creando interfaz virtual\\\\\\\\\\\\\\\\
function new(virtual fifo_if.dvr t);
	vinterf = t;
endfunction
//////////////////////////TAREAS\\\\\\\\\\\\\\\\\\\\\\\\\\\\
/*task wke_up();
	   //vinterf.push = PUSH;
endtask:wke_up*/

task push_action();
	///Generando push y valores random en dato de in
	push_casting 			= PUSH;				//casteo
	// Mandando datos y push a interfaz
	vinterf.push 			= {push_casting};	//casteo
	vinterf.data_in			= dato_type'( $random() );
		
		$display("--------------------------------------------------");
		$display("Queue size before push event: %0d", q.size());
	if((push_casting) && (!vinterf.full) && (q.size()<17)) begin
		$display("PUSH required...");
		$display("Full flag is: %0d ...", vinterf.full);
		$display("Reference queue is <17 ...");
		$display("######PUSH EVENT######");
		q.push_front(vinterf.data_in);
		$display("Queue has a size of: %0d", q.size());
		end
	else begin
		$display("Full flag: %0d", vinterf.full);
		$display("Push is not allowed, OVERFLOW EVENT");
		end
endtask:push_action

task pop_action();
	//empty task
endtask:pop_action

endclass:fifo_class
