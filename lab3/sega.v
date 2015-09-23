module sega(W, X, Y, Z, OUT, OUTNAND);
  input  W;
  input  X;
  input  Y;
  input  Z;
  
  output OUT;
  output OUTNAND;
  
  assign OUT     = W | (~X & ~Z) | (X & Z) | (Y & Z);
  assign OUTNAND = ~(~(W & W) & ~(~(X & X) & ~(Z & Z)) & ~(X & Z) & ~(Y & Z));
  
endmodule
