
class transaction extends uvm_sequence_item ;
  
  `uvm_object_utils(transaction)
  
  randc bit [2:0] abc; 
  bit a, b, c;
  bit sum, carry;
  
 
  function void post_randomize();
    a = abc[2]; 
	b = abc[1]; 
	c = abc[0];
 
  endfunction

  function new ( string name = "transaction" );
    super.new(name);
  endfunction
  
endclass

