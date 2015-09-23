
module tffp (
 	CLK,
    RESET,
    T,
    Q
  );
  input      CLK;
  input      RESET;
  input      T;
  output reg Q;
  
  always @(posedge CLK) begin
  	if (RESET) begin
  		Q <= 1'b0;
  	end
  	else if (T == 1'b1) begin
  		Q <= ~Q;
  	end
  	else begin	   
  		Q <= Q; 
  	end
  end
  

  
endmodule