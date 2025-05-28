class driver extends uvm_driver #(sequence_item);
  
  `uvm_component_utils(driver)
  
  virtual intf vif;
  
  function new( string name="driver",uvm_component parent =null);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db #(virtual intf)::get(this,"","vif",vif))
      `uvm_fatal(get_type_name(),"not set at top level");    
  endfunction
  
  task run_phase(uvm_phase phase);
    
    sequence_item seq;
    
    forever begin
    	seq_item_port.get_next_item(seq);
      `uvm_info( get_type_name(), $sformatf( "D = %b Reset = %b",seq.d,seq.reset ) ,UVM_LOW )
      
      vif.d = seq.d;
      
      seq_item_port.item_done();
      
    end
      
  endtask
  
endclass