class base_seq extends uvm_sequence #(sequence_item) ;
  
  `uvm_object_utils(base_seq)
  
  sequence_item seq ;
  
  function new( string name ="base_seq");
    super.new(name);
  endfunction
  
  task body();
    
    `uvm_info( get_type_name(), "INSIDE BODY BASE SEQ" , UVM_LOW );
    `uvm_do( seq )
  endtask
  
endclass