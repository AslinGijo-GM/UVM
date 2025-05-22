`include "uvm_macros.svh"
import uvm_pkg::*;


class seq_item extends uvm_sequence_item;
  
  rand bit a , b , c ;
  
  `uvm_object_utils_begin(seq_item)
  `uvm_field_int(a,UVM_ALL_ON)
  `uvm_field_int(b,UVM_ALL_ON)
  `uvm_field_int(c,UVM_ALL_ON)
  `uvm_object_utils_end
  
  function new ( string name = "seq_item" );
    super.new(name);
  endfunction
  
  function void display();
    `uvm_info("FULL_ADDER" , $sformatf( "a = %b , b = %b , c = %b ", a ,b ,c ), UVM_LOW )
  endfunction
     
  
endclass

module test ;
  
  seq_item s1 , s2 ;
  
  initial begin
    
    s1 = seq_item::type_id::create("s1");
    s2 = seq_item::type_id::create("s2");
    
    void'(s1.randomize());
    s1.display();
    s2.display();
    
    compare_item();
    
    s2.copy(s1);
    s2.display();
    
    compare_item(); 
        
        
  end
  
  
  function void compare_item();
    
    if(s1.compare(s2))
      `uvm_info( "COMPARE", "st1 and st2 are same " , UVM_NONE )
    else
      `uvm_info( "COMPARE", "st1 and st2 are not same " , UVM_NONE )
    
  endfunction 
  
endmodule
