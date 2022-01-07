import tb_fifo_pkg::*;
class fifo_class;

//va recibir la interfaz
/*va generar las seniales para manejar la fifo y hacer los datos
	randmizables que vas a injectar, esos se hace por medio de las
	tasks, y esas tasks se van a llamar desde el TB cuando crees tu
	objeto
	
	Andres utilizo 2 tasks
		-1 para generar los datos random que se van a meter a la fifo
		 esta task revisaba si la bandera de full de la interfaz
		 estaba en alto, si si entonces no metia nada. Aunque el profe
		 dijo que generaras overflow por lo que queda a tu criterio
		 como lo haras (ignorar bandera)
		 -2 para sacar los datos 
		  duda de andres: q la task genere la bandera de pop
		  dependiendo de la bandera de empty y aparte si es qie ;a
		  task va devolver el valor o no, ya que esta incluido en la
		  interfaz 
	
puede que tenga el golden model*/

///////////////declaracion de variables\\\\\\\\\\\\\

virtual fifo_if vinterf;	//variable virtual para virtualizar interfaz
dato_type q[$];

push_e_t push_casting;	//variable paracasteo de push (pkg ytb_pkg)

///////////creando interfaz virtual\\\\\\\\\\\\\\\\
function new(virtual fifo_if.fifo t);
	vinterf = t;
endfunction

////////////////tareas\\\\\\\\\\\\\\\\\\\\\\\\\\\\
/*task wke_up();

	   //vinterf.push = PUSH;
endtask:wke_up*/

task push_action();
	///Generando push y valores random en dato de in
	push_casting 			= PUSH;				//casteo
	vinterf.push 			= {push_casting};	//casteo
	vinterf.data_in			= dato_type'( $random() );

	//Si el random value de push fue PUSH(1) y no hay full, se injecta
		$display("Queue size before push event: %0d", q.size());
	
	if((push_casting) && (!vinterf.full)) begin
		q.push_front(vinterf.data_in);
		$display("######PUSH EVENT######");
		$display("Queue has a size of: %0d", q.size());
	end
endtask:push_action

task pop_action();
	//empty task
endtask:pop_action

endclass:fifo_class
