`include "uvm_macros.svh"
import uvm_pkg::*;

class seq_item extends uvm_sequence_item;
  
  rand bit a , b , c ;
  
  `uvm_object_utils_begin(seq_item)
  `uvm_field_int( a ,UVM_ALL_ON )
  `uvm_field_int( b ,UVM_ALL_ON )
  `uvm_field_int( c ,UVM_ALL_ON )
  `uvm_object_utils_end
  
  function new ( string name = "seq_item" );
    
    super.new(name);
    
  endfunction
  
endclass


module test;
  
  seq_item s1 ,s2 , s3;
  
  initial begin
    
    s1 = seq_item::type_id::create("s1");
    s2 = seq_item::type_id::create("s2");
    
    void'(s1.randomize());
    s1.print();
    s2.print();
    
    s2.copy(s1);
    s2.print();
    
    s3 = seq_item'(s1.clone());
    
    s3.print();
    
  end
  
  
endmodule
