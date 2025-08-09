class environment extends uvm_env;
  
  `uvm_component_utils(environment)
  
  agent agt;
  scoreboard scr;
  
  function new(string name = "environment" , uvm_component parent = null);
    
    super.new(name , parent );
    
  endfunction
  
  function void build_phase( uvm_phase phase );
    
    super.build_phase(phase);
    
    agt = agent::type_id::create("agt",this);
    scr = scoreboard::type_id::create("scr",this);
    
  endfunction
  
  
  function void connect_phase( uvm_phase phase );
    
    super.connect_phase(phase);
    agt.mon.item_collect_port.connect(scr.item_collect_export);
    
  endfunction
  
  
endclass
