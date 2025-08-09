class monitor extends uvm_monitor ;
  
  `uvm_component_utils(monitor)
  
  virtual intf intff;
  
  seq_item seq;
  
  uvm_analysis_port #(seq_item) item_collect_port;
  
  function new( string name = "monitor" , uvm_component parent = null);
    
    super.new(name,parent);
    
  endfunction
  
  function void build_phase(uvm_phase phase);
    
    super.build_phase(phase);
    item_collect_port = new("item_collect_port",this);
    if( !uvm_config_db #(virtual intf)::get( this, "*" , "intff" , intff )) begin
      `uvm_fatal("MON","NO DATA IN THE Monitor")
    end
    
     //seq = new();
    
  endfunction
  
  task run_phase(uvm_phase phase);
    
    seq = new();
    
    forever begin
      
  //    @wait(!intff.reset);
      @(negedge intff.clk)
    // #4;
      seq.A = intff.A;
      seq.B = intff.B;
      seq.sel = intff.sel;
   
     
      seq.Result = intff.Result;
      `uvm_info("MONITOR TASK",$sformatf("A=%d B=%d Sel=%b Result=%d",seq.A,seq.B,seq.sel,seq.Result),UVM_LOW)
      
      
		
      
      
      item_collect_port.write(seq);
      
    end
    
  endtask
  
  
endclass
