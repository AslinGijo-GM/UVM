class monitor extends uvm_monitor;
  
  `uvm_component_utils(monitor)
  
  virtual intf vif;
  
  transaction trans;
  
  uvm_analysis_port #(transaction) item_collect_port;
  
 function new(string name ="monitor",uvm_component parent = null);
    
   super.new(name,parent);
   item_collect_port = new("item_collect_port",this);
   trans = new(); 
   
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db #(virtual intf)::get(this,"","vif",vif))
      `uvm_fatal(get_type_name(),"no data on the monitor")
  endfunction
  
  task run_phase(uvm_phase phase);
    
    forever begin
    
      trans.a = vif.a;
      trans.b = vif.b;
      trans.c = vif.c;
      #1;
      trans.sum = vif.sum;
      trans.carry = vif.carry;
      
      `uvm_info( get_type_name(), $sformatf( "A = %b B = %b C =%b SUM =%b CARRY = %b",trans.a ,trans.b,trans.c,trans.sum,trans.carry ) , UVM_LOW );
      
      item_collect_port.write(trans);
      
    end
    
  endtask
  
endclass
