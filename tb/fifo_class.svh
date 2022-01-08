import tb_fifo_pkg::*;

class fifo_class;

///////////////declaracion de variables\\\\\\\\\\\\\

virtual fifo_if vinterf;	//variable virtual para virtualizar interfaz
dato_type q[$];

push_e_t push_casting = push_e_t'(0);	//variable paracasteo de push (pkg ytb_pkg)
pop_e_t pop_casting = pop_e_t'(0);
dato_type data_pop = '0;


///////////creando interfaz virtual\\\\\\\\\\\\\\\\
function new(virtual fifo_if.dvr t);
	vinterf = t;
endfunction

////////////////tareas\\\\\\\\\\\\\\\\\\\\\\\\\\\\

task push_action();
    //assuring POP is unactive
    pop_casting = NO_POP; 
	vinterf.pop = {pop_casting};
    ///Generando push y valores random en dato de in
    push_casting             = PUSH;                //casteo
    // Mandando datos y push a interfaz
    vinterf.push             = {push_casting};    //casteo
    vinterf.data_in            = dato_type'( $random() );

        $display("------------PUSH INIT------------------------");
        $display("Queue size before push event: %0d", q.size());
    if((push_casting) && (!vinterf.full) && (q.size()<=15)) begin
        $display("PUSH requested...");
        $display("Full flag is: %0d ...", vinterf.full);
        $display("Reference queue is <17 ...");
        $display("######PUSH EVENT######");
        q.push_front(vinterf.data_in);
        $display("Queue size after push: %0d", q.size());
	    $display("data pushed: %0b", vinterf.data_in);
	    $display("------------PUSH FINISH----------------------");
        end
    else begin
	    $display("------------OVERFLOW INIT------------------------");
        $display("Full flag: %0d", vinterf.full);
        $display("Push is not allowed, OVERFLOW EVENT");
	    $display("data missed: %0b", vinterf.data_in);
	    $display("------------OVERFLOW FINISH----------------------");
        end
endtask:push_action

task pop_action();
	//asuring PUSH is unactive
	push_casting             = NO_PUSH;                //casteo
    // Mandando datos y push a interfaz
    vinterf.push             = {push_casting};    //casteo
    
	pop_casting = POP; 
	vinterf.pop = {pop_casting};
	if (q.size()<=0) begin
		$display("------------UNDERFLOW INIT------------------------");
		$display("Queue has a size of: %0d", q.size());
		$display("Empty flag: %0d", vinterf.empty);
		$display("------------UNDERFLOW FINISH----------------------");
	end
	else begin
		if(pop_casting == POP) begin 
			$display("------------POP INIT-------------------");
			$display("Queue size before pop event: %0d", q.size());
			data_pop = q.pop_back();
			$display("Queue size after pop event: %0d", q.size());
			$display("data poped: %0b", vinterf.data_in);
			$display("------------POP FINISH-----------------");
		end
	end
endtask:pop_action

endclass:fifo_class