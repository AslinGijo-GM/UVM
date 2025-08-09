`include "sequence_items.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "agent.sv"
`include "environment.sv"

class test extends uvm_test;
  
  `uvm_component_utils(test)
  
   environment envv;
   alu_sequence base_seq;
  
  function new(string name = "test" , uvm_component parent = null);
    
    super.new(name, parent);
    
  endfunction
  
  function void build_phase(uvm_phase phase);
    
    super.build_phase(phase);
    envv = environment::type_id::create("envv",this);
    base_seq = alu_sequence::type_id::create("base_seq",this);
    
  endfunction
  
  task run_phase( uvm_phase phase );
    
    repeat(10) begin
      
      phase.raise_objection(this);
     
      base_seq.start(envv.agt.seqr); #4;
      phase.drop_objection(this);
       
    end
   
  endtask  
  
endclass
