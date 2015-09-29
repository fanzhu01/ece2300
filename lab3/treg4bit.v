 module treg4bit (
 	CLK,
 	RESET,
 	IN,
 	OUT
  );

 input             CLK;
 input             RESET;
 input      [3:0]  IN;

 output     [3:0]  OUT;

 localparam    nbits = 4;

genvar i;
generate 
	for (i = 0; i < nbits; i = i + 1) begin: tffp4_gen
	    tffp tffp4b
	    (
	    	.CLK(CLK),
	    	.RESET(RESET),
	    	.T(IN[i]),
	    	.Q(OUT[i])
	    );
	end 
endgenerate

endmodule