`include "uvm_macros.svh"
import uvm_pkg::*;

class seq_item extends uvm_sequence_item;
  
  rand bit a , b , c;
  
  `uvm_object_utils_begin(seq_item)
  `uvm_field_int(a,UVM_ALL_ON)
  `uvm_field_int(b,UVM_ALL_ON)
  `uvm_field_int(c,UVM_ALL_ON)
  `uvm_object_utils_end
  
  function new( string name = "seq_item" );
    
    super.new( name );
    
  endfunction
  
  function void display();
    `uvm_info( "FULL_ADDER" , $sformatf( "a = %b , b = %b , c = %b " ,a ,b ,c ) ,UVM_LOW )
  endfunction
                                         
  
endclass
                                        
  seq_item st;
                                        
module test;
  
 
  
  initial begin
    
   // st = new();
    st = seq_item::type_id::create("variable");
    
    repeat( 3 ) begin
      
      void'( st.randomize() );
      st.display();
      st.print();
      
    end
    
  end 
  
endmodule
                                        
     
                                        
