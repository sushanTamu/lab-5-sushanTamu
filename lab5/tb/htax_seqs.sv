///////////////////////////////////////////////////////////////////////////
// Texas A&M University
// CSCE 616 Hardware Design Verification
// Created by  : Prof. Quinn and Saumil Gogri
///////////////////////////////////////////////////////////////////////////

//Base sequence 
class htax_base_seq extends uvm_sequence #(htax_packet_c); //HTAX packet class is passed as parameter

  parameter PORTS = `PORTS;
  parameter VC    = `VC;
  parameter WIDTH = `WIDTH;

	//Factory Registration
	`uvm_object_utils(htax_base_seq)

	//Constructor
	function new ( string name = "htax_base_seq");
		super.new(name);
	endfunction : new

endclass : htax_base_seq

//Sequence 1
//Fix Destination Port Sequence extends from base sequence
class fix_dest_port_seq extends htax_base_seq;

	//Factory Registration
	`uvm_object_utils(fix_dest_port_seq)

	//Constructor
	function new ( string name = "fix_dest_port_seq");
    super.new(name);
  endfunction : new

	//Body task -- 
	virtual task body();
		int i;
		i=$urandom_range(0,3);
		`uvm_info(get_type_name(),"Executing fix destination port sequence with 5 transactions", UVM_NONE)
		//Generate a sequence with 5 packets
		repeat(5) begin
			`uvm_do_with (req, {req.dest_port==i;}) //fix dest_port 
		end
	endtask

endclass : fix_dest_port_seq


//TO DO - Sequence 2
//Short Packet Sequence extends from base sequence
class short_packet_seq extends htax_base_seq;

	//Factory Registration
	`uvm_object_utils(short_packet_seq)

	//Constructor
	function new ( string name = "short_packet_seq");
    super.new(name);
  endfunction : new

	//Body task -- 
	virtual task body();
		int i;
		i=$urandom_range(3,10);
		`uvm_info(get_type_name(),"Executing length of 3 - 10 sequence with 5 transactions", UVM_NONE)
		//Generate a sequence with 5 packets
		repeat(5) begin
			`uvm_do_with (req, {req.length==i;}) //fix length
		end
	endtask

endclass : short_packet_seq


//TO DO - Sequence 3
//Long Packet Short Delay Sequence extends from base sequence
class long_packet_short_delay_seq extends htax_base_seq;

	//Factory Registration
	`uvm_object_utils(long_packet_short_delay_seq)

	//Constructor
	function new ( string name = "long_packet_short_delay_seq");
    super.new(name);
  endfunction : new

	//Body task -- 
	virtual task body();
		int i;
		int j;
		i=$urandom_range(40,50);
		j=$urandom_range(0,4);
		`uvm_info(get_type_name(),"Executing fix length and delay sequence with 5 transactions", UVM_NONE)
		//Generate a sequence with 5 packets
		repeat(5) begin
			`uvm_do_with (req, {req.length==i; req.delay==j;}) //fix length and delay 
		end
	endtask

endclass : long_packet_short_delay_seq


//TO DO - Sequence 4
//Medium Packet fix VC Sequence extends from base sequence
class med_packet_fix_vc_seq extends htax_base_seq;

	//Factory Registration
	`uvm_object_utils(med_packet_fix_vc_seq)

	//Constructor
	function new ( string name = "med_packet_fix_vc_seq");
    super.new(name);
  endfunction : new

	//Body task -- 
	virtual task body();
		int i;
		int j;
		i=$urandom_range(10,40);
		j=$urandom_range(0,1);
		`uvm_info(get_type_name(),"Executing length and VC sequence with 5 transactions", UVM_NONE)
		//Generate a sequence with 5 packets
		repeat(5) begin
			`uvm_do_with (req, {req.length==i; req.vc==j;}) //fix length and vc 
		end
	endtask

endclass : med_packet_fix_vc_seq


//TO DO - Sequence 5
//True Random VC Sequence extends from base sequence
class random_seq extends htax_base_seq;

	//Factory Registration
	`uvm_object_utils(random_seq)

	//Constructor
	function new ( string name = "random_seq");
    super.new(name);
  endfunction : new

	//Body task -- 
	virtual task body();
		`uvm_info(get_type_name(),"Executing default constraints sequence with 5 transactions", UVM_NONE)
		//Generate a sequence with 5 packets
		repeat(5) begin
			`uvm_do (req)  
		end
	endtask

endclass : random_seq

