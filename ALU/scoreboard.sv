class scoreboard extends uvm_scoreboard ;
  
  `uvm_component_utils(scoreboard)
  
  seq_item seqq[$];
  
  uvm_analysis_imp #(seq_item,scoreboard) item_collect_export;
  
  function new( string name = "scoreboard" , uvm_component parent = null);
    
    super.new(name,parent);
    
  endfunction
  
  function void build_phase ( uvm_phase phase );
    
    super.build_phase(phase);
    item_collect_export = new("item_collect_export",this);
    
  endfunction
  
  function void write ( seq_item seq ) ;
    
    seqq.push_back(seq);
    
  endfunction
  
  task run_phase(uvm_phase phase);
    
    seq_item seqsr;
    bit check;
    
    forever begin
      
      wait(seqq.size > 0);
      
      if(seqq.size > 0 ) begin
        
        seqsr = seqq.pop_front();
        
        
          case(seqsr.sel)
            3'b000: check = (seqsr.Result==(seqsr.A+seqsr.B)       );
            3'b001: check = (seqsr.Result==(seqsr.A+(~seqsr.B+1)  )); 
            3'b010: check = (seqsr.Result==(seqsr.A & seqsr.B)     );
            3'b011: check = (seqsr.Result==(seqsr.A | seqsr.B)     ); 
            3'b100: check = (seqsr.Result==(seqsr.A*seqsr.B)       ); 
            3'b101: check = (seqsr.Result==(seqsr.A^seqsr.B)       ); 
            3'b110: check = (seqsr.Result==(~(seqsr.A & seqsr.B) ) );
            3'b111: check = (seqsr.Result==(~(seqsr.A | seqsr.B) ) );
          endcase
        
        $display("-------------------------------------");
        
        
        
        if( check )begin
          
          `uvm_info( get_type_name(), $sformatf("A=%d B=%d Sel=%b Result=%d",seqsr.A,seqsr.B,seqsr.sel,seqsr.Result) , UVM_LOW )
          
        end
        else begin
          
          `uvm_error( get_type_name(), $sformatf("A=%d B=%d Sel=%b Result=%d,exResult",seqsr.A,seqsr.B,seqsr.sel,seqsr.Result) )//, UVM_LOW )
        
        end
        
        $display("--------------------------------------");
        
      end
      
    end   
    
  endtask  
  
endclass
