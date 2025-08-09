`timescale 1ns/1ns
`include "uvm_macros.svh"
import uvm_pkg::*;

`include "interface.sv"
`include "test.sv"



module tb_top;
  
  bit clk;
  bit reset;
  
  always #2 clk = ~ clk;
  
  initial begin
    reset = 0;    
  end
  
  intf intff(clk);
  
  ALU uut (
    .clk(intff.clk),
    .reset(reset),
    .A(intff.A),
    .B(intff.B),
    .Result(intff.Result),
    .sel(intff.sel)
  );
  
  
  
  initial begin
    
    uvm_config_db #(virtual intf)::set(null,"","intff",intff);
    
  end
  
  initial begin
    
    run_test("test");
    #5000;
    $finish;
        
  end
  
endmodule
