module fulladder(
	intf intff
);
  
  assign intff.sum = intff.a^intff.b^intff.c;
  assign intff.carry = (intff.a&intff.b)|(intff.b&intff.c)|(intff.a&intff.c);
  
endmodule
