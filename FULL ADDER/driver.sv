class driver extends uvm_driver #(transaction);
  
  `uvm_component_utils(driver)
  
  virtual intf vif;
  
  function new(string name ="driver" , uvm_component parent = null);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db #(virtual intf)::get(this,"","vif",vif))
      `uvm_fatal(get_type_name(), "not set at top level");
    
  endfunction
  
  task run_phase(uvm_phase phase);
    
    transaction trans;
    
    forever begin
      
      seq_item_port.get_next_item(trans);
      `uvm_info( get_type_name(), $sformatf( "A = %b B = %b C =%b",trans.a ,trans.b,trans.c ) , UVM_LOW )
      
      vif.a = trans.a;
      vif.b = trans.b;
      vif.c = trans.c;
      
      seq_item_port.item_done();
      
    end
    
  endtask
  
  
endclass
