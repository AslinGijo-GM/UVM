class seq_item extends uvm_sequence_item;
  
  rand bit [3:0]A;
  rand bit [3:0]B;
  randc bit [2:0]sel;
  bit [5:0]Result;
  
  `uvm_object_utils(seq_item)
  
  function new(string name ="seq_item");
    
    super.new(name);
    
  endfunction
  
 
  
endclass
