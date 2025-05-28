class scoreboard extends uvm_scoreboard;
  
  `uvm_component_utils(scoreboard)
  
  sequence_item seqt[$];
  
  uvm_analysis_imp #(sequence_item,scoreboard) item_collect_export;
  
  function new(string name ="scoreboard" ,uvm_component parent = null);
    super.new(name,parent);
    item_collect_export = new("item_collect_export",this);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
  
  function void write(sequence_item seq);
    seqt.push_back(seq);
  endfunction
  
  task run_phase(uvm_phase phase);
    
    sequence_item sbt;
    
    forever begin
      
      wait(seqt.size > 0);
      
      if(seqt.size > 0) begin
        sbt = seqt.pop_front();
        $display("--------------------------------------");
        
        if(sbt.d==sbt.q )begin
          `uvm_info(get_type_name(), $sformatf("d=%b q=%b reset=%b",sbt.d,sbt.q,sbt.reset) ,UVM_LOW)
        end
        else begin
          `uvm_error( get_type_name(), $sformatf("d=%b q=%b reset=%b",sbt.d,sbt.q,sbt.reset) )
        end
        
        $display("--------------------------------------");
       
        
      end
      
    end
    
  endtask  
  
endclass