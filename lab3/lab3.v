module lab3(CLK, RESET, ENABLE, TIME, MIN, TENSEC, SEC, DECISEC, CENTISEC);
  input         CLK;
  input         RESET;
  input         ENABLE;

  output [19:0] TIME;
  output [3:0]  MIN;
  output [3:0]  TENSEC;
  output [3:0]  SEC;
  output [3:0]  DECISEC;
  output [3:0]  CENTISEC;


  // ADD YOUR CODE BELOW THIS LINE


  // ADD YOUR CODE ABOVE THIS LINE

  assign TIME = {MIN, TENSEC, SEC, DECISEC, CENTISEC};

endmodule
