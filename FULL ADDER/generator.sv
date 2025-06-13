class generator extends uvm_sequence #(transaction) ;
  
  `uvm_object_utils(generator)
  
  transaction trans ;
  
  function new(string name = "generator");
    super.new(name);    
  endfunction
  
  task body();
    
   //  trans = transaction::type_id::create("trans");
    `uvm_info( get_type_name() , "INSIDE THE GENERATOR " ,UVM_LOW ) 
    `uvm_do(trans)
    
//     transaction trans;
//     trans = transaction::type_id::create("trans");
//     assert(trans.randomize());
//     start_item(trans);
//     finish_item(trans);
  endtask
  
  
  
endclass
