`include "uvm_macros.svh"
import uvm_pkg::*;

class seq_item extends uvm_sequence_item;
  
  rand bit [7:0]data;
  rand bit [3:0]addr;
  
  `uvm_object_utils_begin(seq_item)
  `uvm_field_int(data,UVM_ALL_ON)
  `uvm_field_int(addr,UVM_ALL_ON)
  `uvm_object_utils_end
  
  function new(string name = "seq_item" );
    
    super.new(name);
    
  endfunction
  
  function void display();
    
    `uvm_info("MEMORY" , $sformatf( "DATA = %d , ADDR = %d " , data , addr ) , UVM_LOW)
    
  endfunction
  
endclass


module test ;
  
  byte unsigned byte_packed[];
  
  seq_item s1 , s2 ;
  
  initial begin
    
    s1 = seq_item::type_id::create("s1");
    s2 = seq_item::type_id::create("s2");
    
    void'(s1.randomize());
    
    s1.display();
    s2.display();
    
    compare();
    
    s1.pack_bytes(byte_packed);
    
    foreach( byte_packed[i] ) begin
      
      `uvm_info( "PACKED" , $sformatf( "byte_packed[%0d] = %d ",i,byte_packed[i] ) ,UVM_LOW)
      
    end
    
    s2.unpack_bytes(byte_packed);
    s1.display();
    s2.display();
    
    compare();
    
  end  
  
  function compare();
    
    if(s1.compare(s2))
       `uvm_info("COMPARE","s1 and s2 are same ",UVM_LOW)
    else
      `uvm_info("COMPARE","s1 and s2 are not same ",UVM_LOW)
    
  endfunction
  
endmodule
