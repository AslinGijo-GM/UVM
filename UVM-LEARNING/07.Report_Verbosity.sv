`include "uvm_macros.svh"
import uvm_pkg::*;

class driver extends uvm_driver;
  
  `uvm_component_utils(driver)
  
  function new(string name = "driver" , uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void display();
    
    `uvm_info("INFO" , $sformatf("REPORT VERBOSITY : LOW    " ), UVM_LOW)
    `uvm_info("INFO" , $sformatf("REPORT VERBOSITY : NONE   " ), UVM_NONE)
    `uvm_info("INFO" , $sformatf("REPORT VERBOSITY : MEDIUM " ), UVM_MEDIUM)                        
    `uvm_info("INFO" , $sformatf("REPORT VERBOSITY : HIGH   " ), UVM_HIGH)
    `uvm_info("INFO" , $sformatf("REPORT VERBOSITY : FULL   " ), UVM_FULL)
    `uvm_info("INFO" , $sformatf("REPORT VERBOSITY : DEBUG  " ), UVM_DEBUG)
                        
    `uvm_warning("WARNING","REPORT SEVERITY")
    `uvm_error("ERROR", "REPORT SEVERITY")
    `uvm_error("FATAL" , "REPORT SEVERITY ERROR CHANGED TO [FATAL]" ) 
              
              
              
  endfunction
              
  
endclass
              
module test;
  
  driver drv;
  
  initial begin
    
    drv = driver::type_id::create("drv",null);
   // drv.display();
    `uvm_info ( "AFTER LEVEL INC" , "**********************************" , UVM_LOW  )  
    drv.set_report_verbosity_level(UVM_DEBUG);
    drv.set_report_severity_id_override(UVM_ERROR,"FATAL",UVM_FATAL);
    drv.display();    
    
  end
  
endmodule
