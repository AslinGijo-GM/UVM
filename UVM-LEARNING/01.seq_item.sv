`include "uvm_macros.svh"
import uvm_pkg::*;

class seq_item extends uvm_sequence_item;
  
 // `uvm_object_utils( seq_item )
  
  randc [3:0]db;
  
  bit [1:0]data;
  bit [1:0]addr;
  
  function post_randomize();
    
    data = db[1:0];
    addr = db[3:2];
    
  endfunction
  
  function new( string name = "seq_item");
    
    super.new(name);
    `uvm_info("Sequence","Created the Object",UVM_LOW)
    
  endfunction
  
  function void display();
    
    `uvm_info( "Randomized" , $sformatf( "Addr = %d | Data = %d" , addr , data  ) , UVM_LOW )
    
  endfunction
  
endclass

module test;
  
  seq_item st;
  
  initial begin
    
    st = new();
    
    repeat (16) begin
      
      void'(st.randomize());
      st.display();
      #5;
      
    end
    
  end
  
endmodule

