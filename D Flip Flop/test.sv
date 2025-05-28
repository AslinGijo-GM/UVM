`include "sequence_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "agent.sv"
`include "environment.sv"

class test extends uvm_test;
  
  `uvm_component_utils(test)
  
  env env_o;
  base_seq bseq;
  
  function new(string name ="test", uvm_component parent = null);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env_o = env::type_id::create("env_o",this);
  endfunction
  
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    bseq = base_seq::type_id::create("bseq");
    repeat(10) begin
      
      #5; bseq.start(env_o.agt.seqr);
      
    end
    phase.drop_objection(this);
    `uvm_info(get_type_name(),"End of the testcase",UVM_LOW);    
    
  endtask
  
endclass