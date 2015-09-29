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

  assign en1 = (CENTISEC == 4'd9 && ENABLE) ? 1 : 0;
  assign en2 = (DECISEC  == 4'd9 && CENTISEC == 4'd9 && ENABLE) ? 1 : 0;
  assign en3 = (SEC      == 4'd9 && DECISEC  == 4'd9 && CENTISEC == 4'd9 && ENABLE) ? 1 : 0;
  assign en4 = (TENSEC   == 4'd5 && SEC      == 4'd9 && DECISEC  == 4'd9 
					&& CENTISEC == 4'd9 && ENABLE) ? 1 : 0;
  
  // ADD YOUR CODE BELOW THIS LINE
  tcounter tcnt1 (
    .CLK(CLK),
    .CLR(~RESET),
    .ENP(ENABLE),
    .ENT(1'b1),
	 .range(4'd10),
    .Q(CENTISEC)
  );
  tcounter tcnt2 (
    .CLK(CLK),
    .CLR(~RESET),
    .ENP(ENABLE),
    .ENT(en1),
	 .range(4'd10),
    .Q(DECISEC)
  );
  tcounter tcnt3 (
    .CLK(CLK),
    .CLR(~RESET),
    .ENP(ENABLE),
    .ENT(en2),
	 .range(4'd10),
    .Q(SEC)
  );
  tcounter tcnt4 (
    .CLK(CLK),
    .CLR(~RESET),
    .ENP(ENABLE),
    .ENT(en3),
	 .range(4'd6),
    .Q(TENSEC)
  );
  
  tcounter tcnt5 (
    .CLK(CLK),
    .CLR(~RESET),
    .ENP(ENABLE),
    .ENT(en4),
	 .range(4'd10),
    .Q(MIN)
  );
  // ADD YOUR CODE ABOVE THIS LINE

  assign TIME = {MIN, TENSEC, SEC, DECISEC, CENTISEC};

endmodule
