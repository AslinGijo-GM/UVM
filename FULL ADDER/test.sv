`include "transaction.sv"
`include "generator.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "agent.sv"
`include "environment.sv"

class test extends uvm_test;
  
  `uvm_component_utils(test)
  
  env env_o;
  generator genn;
  
  function new(string name ="teat",uvm_component parent= null);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env_o = env::type_id::create("env_o",this);
  endfunction
  
  task run_phase(uvm_phase phase);
    
    phase.raise_objection(this);
    genn = generator::type_id::create("genn");
    repeat(10) begin
      genn.start(env_o.agt.seqr);
      #1;
      
    end   
    phase.drop_objection(this);
    `uvm_info(get_type_name(),"End of the testcase",UVM_LOW);    
    
  endtask 
  
endclass
