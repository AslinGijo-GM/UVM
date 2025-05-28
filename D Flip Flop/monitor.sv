class monitor extends uvm_monitor;
  
  `uvm_component_utils(monitor)
  
  virtual intf vif;
  
  sequence_item seq;
  
  uvm_analysis_port #(sequence_item) item_collect_port;
  
  function new( string name = "monitor",uvm_component parent = null);
    super.new(name,parent);
    item_collect_port = new("item_collect_port",this);
    seq = new();
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db #(virtual intf)::get(this,"","vif",vif))
      `uvm_fatal(get_type_name(),"Not set at top level");    
  endfunction
  
  task run_phase(uvm_phase phase);
    
    forever begin
      
      wait(!vif.reset);
      @(posedge vif.clk);
      
      seq.d = vif.d;
      seq.reset = vif.reset;
       @(posedge vif.clk);
      seq.q = vif.q;      
      `uvm_info(get_type_name(), $sformatf("d = %d q = %d reset = %d ",seq.d,seq.q,seq.reset) ,UVM_LOW);
      
      item_collect_port.write(seq);
    end
    
  endtask
  
endclass