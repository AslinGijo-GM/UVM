class sequence_item extends uvm_sequence_item;
  
  `uvm_object_utils(sequence_item)
  
  rand bit d;
  bit reset ;
  bit q;
  
  function new( string name ="sequence_item");
    super.new(name);
  endfunction
  
  
  
  
endclass
