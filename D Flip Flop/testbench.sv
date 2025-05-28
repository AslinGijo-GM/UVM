`include "uvm_macros.svh"
import uvm_pkg::*;

`include "interface.sv"
`include "test.sv"

module tb_top;
  
  bit clk;
  bit reset;
  always #2 clk = ~clk;
  
  initial begin
    reset = 1;
    #5;
    reset = 0;    
  end
  
  intf vif(clk , reset);
  
  dflipflop uut (
    .clk(vif.clk),
    .reset(vif.reset),
    .d(vif.d),
    .q(vif.q)
  );
  
  initial begin
    uvm_config_db #(virtual intf)::set(uvm_root::get(),"*","vif",vif);    
  end 
  
  initial begin
    run_test("test");
  end
  
endmodule