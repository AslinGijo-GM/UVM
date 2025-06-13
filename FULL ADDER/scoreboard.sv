class scoreboard extends uvm_scoreboard;
  
  `uvm_component_utils(scoreboard)
  
  transaction tranx[$];
  
  uvm_analysis_imp #(transaction,scoreboard) item_collect_export;
  
  function new(string name = "scoreboard" , uvm_component parent = null);
    
    super.new(name,parent);
    item_collect_export = new("item_collect_export",this);
    
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
  
  function void write(transaction trans);
    tranx.push_back(trans);
    
  endfunction
  
  
  task run_phase(uvm_phase phase);
    
    transaction trx;
    
    forever begin
      
      wait(tranx.size > 0);
      
      if(tranx.size > 0) begin
        
        trx = tranx.pop_front();
        $display("--------------------------------------");
        
        if( ((trx.a^trx.b^trx.c)==trx.sum) & (((trx.a&trx.b)|(trx.b&trx.c)|(trx.a&trx.c))==trx.carry) ) begin
          `uvm_info( get_type_name(), $sformatf( "A = %b B = %b C =%b SUM =%b CARRY = %b",trx.a ,trx.b,trx.c,trx.sum,trx.carry ) , UVM_LOW );
          
        end
        
        else begin 
          
          `uvm_error( get_type_name(), $sformatf( "A = %b B = %b C =%b SUM =%b CARRY = %b",trx.a ,trx.b,trx.c,trx.sum,trx.carry ) );
          
        end
        
        $display("--------------------------------------");        
      end
      
    end

  endtask
  
endclass
