class driver extends uvm_driver #(seq_item);
  
  `uvm_component_utils(driver)
  
  virtual intf intff;
  seq_item seq;
  
  function new(string name = "driver", uvm_component parent = null);
    
    super.new(name,parent);
    
  endfunction
  
  function void build_phase(uvm_phase phase);
    
    super.build_phase(phase);
    if( !uvm_config_db #(virtual intf)::get( this, "*" , "intff" , intff )) begin
      `uvm_fatal("DRV","NO DATA IN THE DRIVER")
    end
    
  endfunction
  
  task run_phase(uvm_phase phase);
  	
    forever begin
    
    seq_item_port.get_next_item(seq);
     
    intff.A = seq.A;
    intff.B = seq.B;
    intff.sel= seq.sel;
      `uvm_info("DRIVER",$sformatf("A=%d B=%d Sel=%b Result=%d",intff.A,intff.B,intff.sel,intff.Result),UVM_LOW)
    
    seq_item_port.item_done();
      
    end
    
  endtask
  
endclass
