module dflipflop(input clk ,input d , reset , output reg q);
  
  always @( posedge clk ) begin
    if(reset) begin
      q <= 0;
    end
    else begin
      q <= d;
    end
    
    
  end
  
  
endmodule

//  https://edaplayground.com/x/Y_6v
