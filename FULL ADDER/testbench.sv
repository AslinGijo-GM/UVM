`include "uvm_macros.svh"
import uvm_pkg::*;

`include "interface.sv"
`include "test.sv"

module testbench;
  
  intf intff(); 

  
  fulladder uut(
    intff
  );
  
  initial begin
    uvm_config_db #(virtual intf)::set(uvm_root::get(),"*","vif",intff);    
  end 
  
  initial begin
    run_test("test");
  end
  
endmodule
