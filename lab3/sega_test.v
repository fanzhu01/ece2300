/*  sega_test.v
    ECE/ENGRD 2300, Spring 2014
    
    Author: Saugata Ghose
    Last modified: February 15, 2014
    
    Description: Skeleton test bench for stopwatch circuit.
*/

// sets the granularity at which we simulate this file
`timescale 1 ps / 1 ps


module sega_test();  // name of the top-level module, for us it should always be <module_being_simulated>_test

  // inputs
  // for all of your input pins, declare them as type reg, and name them identically to the pins on your module
  reg  W;
  reg  X;
  reg  Y;
  reg  Z;

  // outputs
  // for all of your output pins, declare them as type wire so ModelSim can display them
  wire OUT;
  wire OUTNAND;
  
  // instance of sega module to test (Unit Under Test)
  sega UUT (
    .W(W),  // make sure to include all ports, and to connect them to the variables above
    .X(X),
    .Y(Y),
    .Z(Z),
    .OUT(OUT),
    .OUTNAND(OUTNAND)  // remember - no comma after the last port
  );


  /* ALL of the initial and always blocks below will work in parallel.
     Starting at time t = 0, they will all start counting the number
     of ticks.
  */


  // TEST CASES: add your test cases in the block here
  // REMEMBER: separate each test case by a delay of #100000, so we can see
  //    the output after the inputs propagate
  initial  // tells the test bench to start timing
  begin
    // start TEST CASES here
    
    $display("MSIM>");
    $display("MSIM> TEST CASES");
    $display("MSIM>");
   
    // the test cases should try all 10 combinations of WXYZ that we care about
   
    // first test case - assign the inputs
    // set values for W, X, Y, and Z
    W = 1'b0;
    X = 1'b0;
    Y = 1'b0;
    Z = 1'b0;
    
    #100000;  // wait for 100,000 ticks so that something happens on the circuit
    
    if(OUT == 1'b1 && OUTNAND == 1'b1) begin
      $display("MSIM> For WXYZ = 0000 (0), the segment logic is correct.  OUT = %1b, OUTNAND = %1b", OUT, OUTNAND);
    end
    else begin
       $display("MSIM> ERROR: For WXYZ = 0000 (0), the segment logic is incorrect (it should be 1).  Instead, OUT = %1b, OUTNAND = %1b", OUT, OUTNAND);
    end
    
    // second test case - for any inputs not written, their values stay the same as before
    // set values for W, X, Y, and Z
    Z = 1'b1;
    
    #100000;  // wait a little bit for gates to process new inputs
    
    if(OUT == 1'b0 && OUTNAND == 1'b0) begin
      $display("MSIM> For WXYZ = 0001 (1), the segment logic is correct.  OUT = %1b, OUTNAND = %1b", OUT, OUTNAND);
    end
    else begin
       $display("MSIM> ERROR: For WXYZ = 0001 (1), the segment logic is incorrect (it should be 0).  Instead, OUT = %1b, OUTNAND = %1b", OUT, OUTNAND);
    end
            
    // set values for W, X, Y, and Z
    W = 1'b0;
    X = 1'b0;
    Y = 1'b1;
    Z = 1'b0;
    
    #100000;  // wait a little bit for gates to process new inputs
    
    if(OUT == 1'b1 && OUTNAND == 1'b1) begin
      $display("MSIM> For WXYZ = 0010 (2), the segment logic is correct.  OUT = %1b, OUTNAND = %1b", OUT, OUTNAND);
    end
    else begin
       $display("MSIM> ERROR: For WXYZ = 0010 (2), the segment logic is incorrect (it should be 1).  Instead, OUT = %1b, OUTNAND = %1b", OUT, OUTNAND);
    end
            
    // set values for W, X, Y, and Z
    W = 1'b0;
    X = 1'b0;
    Y = 1'b1;
    Z = 1'b1;
    
    #100000;  // wait a little bit for gates to process new inputs
    
    if(OUT == 1'b1 && OUTNAND == 1'b1) begin
      $display("MSIM> For WXYZ = 0011 (3), the segment logic is correct.  OUT = %1b, OUTNAND = %1b", OUT, OUTNAND);
    end
    else begin
       $display("MSIM> ERROR: For WXYZ = 0011 (3), the segment logic is incorrect (it should be 1).  Instead, OUT = %1b, OUTNAND = %1b", OUT, OUTNAND);
    end
            
    // set values for W, X, Y, and Z
    W = 1'b0;
    X = 1'b1;
    Y = 1'b0;
    Z = 1'b0;
    
    #100000;  // wait a little bit for gates to process new inputs
    
    if(OUT == 1'b0 && OUTNAND == 1'b0) begin
      $display("MSIM> For WXYZ = 0100 (4), the segment logic is correct.  OUT = %1b, OUTNAND = %1b", OUT, OUTNAND);
    end
    else begin
       $display("MSIM> ERROR: For WXYZ = 0100 (4), the segment logic is incorrect (it should be 0).  Instead, OUT = %1b, OUTNAND = %1b", OUT, OUTNAND);
    end
            
    // set values for W, X, Y, and Z
    W = 1'b0;
    X = 1'b1;
    Y = 1'b0;
    Z = 1'b1;
    
    #100000;  // wait a little bit for gates to process new inputs
    
    if(OUT == 1'b1 && OUTNAND == 1'b1) begin
      $display("MSIM> For WXYZ = 0101 (5), the segment logic is correct.  OUT = %1b, OUTNAND = %1b", OUT, OUTNAND);
    end
    else begin
       $display("MSIM> ERROR: For WXYZ = 0101 (5), the segment logic is incorrect (it should be 1).  Instead, OUT = %1b, OUTNAND = %1b", OUT, OUTNAND);
    end
            
    // set values for W, X, Y, and Z
    W = 1'b0;
    X = 1'b1;
    Y = 1'b1;
    Z = 1'b0;
    
    #100000;  // wait a little bit for gates to process new inputs
    
    if(OUT == 1'b0 && OUTNAND == 1'b0) begin
      $display("MSIM> For WXYZ = 0110 (6), the segment logic is correct.  OUT = %1b, OUTNAND = %1b", OUT, OUTNAND);
    end
    else begin
       $display("MSIM> ERROR: For WXYZ = 0110 (6), the segment logic is incorrect (it should be 0).  Instead, OUT = %1b, OUTNAND = %1b", OUT, OUTNAND);
    end
            
    // set values for W, X, Y, and Z
    W = 1'b0;
    X = 1'b1;
    Y = 1'b1;
    Z = 1'b1;
    
    #100000;  // wait a little bit for gates to process new inputs
    
    if(OUT == 1'b1 && OUTNAND == 1'b1) begin
      $display("MSIM> For WXYZ = 0111 (7), the segment logic is correct.  OUT = %1b, OUTNAND = %1b", OUT, OUTNAND);
    end
    else begin
       $display("MSIM> ERROR: For WXYZ = 0111 (7), the segment logic is incorrect (it should be 1).  Instead, OUT = %1b, OUTNAND = %1b", OUT, OUTNAND);
    end
            
    // set values for W, X, Y, and Z
    W = 1'b1;
    X = 1'b0;
    Y = 1'b0;
    Z = 1'b0;
    
    #100000;  // wait a little bit for gates to process new inputs
    
    if(OUT == 1'b1 && OUTNAND == 1'b1) begin
      $display("MSIM> For WXYZ = 1000 (8), the segment logic is correct.  OUT = %1b, OUTNAND = %1b", OUT, OUTNAND);
    end
    else begin
       $display("MSIM> ERROR: For WXYZ = 1000 (8), the segment logic is incorrect (it should be 1).  Instead, OUT = %1b, OUTNAND = %1b", OUT, OUTNAND);
    end
            
    // set values for W, X, Y, and Z
    W = 1'b1;
    X = 1'b0;
    Y = 1'b0;
    Z = 1'b1;
    
    #100000;  // at the end, we need to wait again for 100,000 ticks so that our last change has time to show up
    
    if(OUT == 1'b1 && OUTNAND == 1'b1) begin
      $display("MSIM> For WXYZ = 1001 (9), the segment logic is correct.  OUT = %1b, OUTNAND = %1b", OUT, OUTNAND);
    end
    else begin
       $display("MSIM> ERROR: For WXYZ = 1001 (9), the segment logic is incorrect (it should be 1).  Instead, OUT = %1b, OUTNAND = %1b", OUT, OUTNAND);
    end
  end

endmodule
