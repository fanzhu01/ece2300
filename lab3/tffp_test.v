/*  tffp_test.v
    ECE/ENGRD 2300, Spring 2014
    
    Author: Saugata Ghose
    Last modified: February 15, 2014
    
    Description: Skeleton test bench for stopwatch circuit.
*/

// sets the granularity at which we simulate
`timescale 1 ps / 1 ps


module tffp_test();

  // inputs
  reg  CLK50;
  reg  RESET;
  reg  T;
  
  // outputs
  wire Q;
  
  // instance of tffp module to test (Unit Under Test)
  tffp UUT (
    .CLK(CLK50),
    .RESET(RESET),
    .T(T),
    .Q(Q)
  );


  /* ALL of the initial and always blocks below will work in parallel.
     Starting at time t = 0, they will all start counting the number
     of ticks.
  */


  // CLK50: generate a 50 MHz clock (rising edge does not start until
  //   10,000 ticks (10 ns) into simulation, and each clock cycle lasts for
  //   20,000 ticks (20 ns)
  always
  begin
    CLK50 = 1'b0;
    CLK50 = #10000 1'b1;
    #10000;
  end 


  // TEST CASES: add your test cases in the block here
  // REMEMBER: separate each test case by delays that are multiples of #20000, so we can see
  //    the output for at least one cycle (since we chose a 50 MHz clock)
  initial
  begin
    // wait at the beginning to make sure that we don't start on a rising clock edge -
    //    this guarantees that we give the flip-flops enough setup time
    #20000;
    
    // start TEST CASES here
    
    $display("MSIM>");
    $display("MSIM> TEST CASES");
    $display("MSIM>");
   
    // reset circuit
    RESET = 1'b1;
    T = 1'b0;
    
    #20000;  // wait a cycle to observe result
    
    if(Q == 1'b0) begin
      $display("MSIM> Reset is correct, Q (value in flip-flop) now %1b", Q);
    end
    else begin
      $display("MSIM> ERROR: Reset is incorrect. Q (value in flip-flop) should be 0, but is %1b", Q);
    end

    // enable and start running, but don't toggle yet
    RESET = 1'b0;
    
    #20000;  // wait a cycle to observe result
    
    if(Q == 1'b0) begin
      $display("MSIM> No toggle state is correct, Q (value in flip-flop) now %1b", Q);
    end
    else begin
      $display("MSIM> ERROR: No toggle state is incorrect. Q (value in flip-flop) should be 0, but is %1b", Q);
    end

    #20000;  // wait a cycle to observe result
    
    if(Q == 1'b0) begin
      $display("MSIM> No toggle state is correct, Q (value in flip-flop) now %1b", Q);
    end
    else begin
      $display("MSIM> ERROR: No toggle state is incorrect. Q (value in flip-flop) should be 0, but is %1b", Q);
    end
    
    // set toggle bit to 1 - output should now change every cycle
    T = 1'b1;

    #20000;  // wait a cycle to observe result
    
    if(Q == 1'b1) begin
      $display("MSIM> Toggle state is correct, Q (value in flip-flop) now %1b", Q);
    end
    else begin
      $display("MSIM> ERROR: Toggle state is incorrect. Q (value in flip-flop) should be 1, but is %1b", Q);
    end

    #20000;  // wait a cycle to observe result
    
    if(Q == 1'b0) begin
      $display("MSIM> Toggle state is correct, Q (value in flip-flop) now %1b", Q);
    end
    else begin
      $display("MSIM> ERROR: Toggle state is incorrect. Q (value in flip-flop) should be 0, but is %1b", Q);
    end

    #20000;  // wait a cycle to observe result
    
    if(Q == 1'b1) begin
      $display("MSIM> Toggle state is correct, Q (value in flip-flop) now %1b", Q);
    end
    else begin
      $display("MSIM> ERROR: Toggle state is incorrect. Q (value in flip-flop) should be 1, but is %1b", Q);
    end
    
    // disable toggle again
    T = 1'b0;

    #20000;  // wait a cycle to observe result
    
    if(Q == 1'b1) begin
      $display("MSIM> No toggle state is correct, Q (value in flip-flop) now %1b", Q);
    end
    else begin
      $display("MSIM> ERROR: No toggle state is incorrect. Q (value in flip-flop) should be 1, but is %1b", Q);
    end

    #20000;  // wait a cycle to observe result
    
    if(Q == 1'b1) begin
      $display("MSIM> No toggle state is correct, Q (value in flip-flop) now %1b", Q);
    end
    else begin
      $display("MSIM> ERROR: No toggle state is incorrect. Q (value in flip-flop) should be 1, but is %1b", Q);
    end

    #20000;  // wait a cycle to observe result
    
    if(Q == 1'b1) begin
      $display("MSIM> No toggle state is correct, Q (value in flip-flop) now %1b", Q);
    end
    else begin
      $display("MSIM> ERROR: No toggle state is incorrect. Q (value in flip-flop) should be 1, but is %1b", Q);
    end
    
    // start toggling again
    T = 1'b1;
    
    #20000;  // wait a cycle to observe result
    
    if(Q == 1'b0) begin
      $display("MSIM> Toggle state is correct, Q (value in flip-flop) now %1b", Q);
    end
    else begin
      $display("MSIM> ERROR: Toggle state is incorrect. Q (value in flip-flop) should be 0, but is %1b", Q);
    end

    #20000;  // wait a cycle to observe result
    
    if(Q == 1'b1) begin
      $display("MSIM> Toggle state is correct, Q (value in flip-flop) now %1b", Q);
    end
    else begin
      $display("MSIM> ERROR: Toggle state is incorrect. Q (value in flip-flop) should be 1, but is %1b", Q);
    end

    // reset with toggle bit on
    RESET = 1'b1;
    
    #20000;  // wait a cycle to observe result
    
    if(Q == 1'b0) begin
      $display("MSIM> Reset with toggle on is correct, Q (value in flip-flop) now %1b", Q);
    end
    else begin
      $display("MSIM> ERROR: Reset with toggle on is incorrect. Q (value in flip-flop) should be 0, but is %1b", Q);
    end

    #20000;  // wait a cycle to observe result
    
    if(Q == 1'b0) begin
      $display("MSIM> Reset with toggle on is correct, Q (value in flip-flop) now %1b", Q);
    end
    else begin
      $display("MSIM> ERROR: Reset with toggle on is incorrect. Q (value in flip-flop) should be 0, but is %1b", Q);
    end

    // disable reset to start toggling immediately
    RESET = 1'b0;
    
    #20000;  // wait a cycle to observe result
    
    if(Q == 1'b1) begin
      $display("MSIM> Toggle after reset is correct, Q (value in flip-flop) now %1b", Q);
    end
    else begin
      $display("MSIM> ERROR: Toggle after reset is incorrect. Q (value in flip-flop) should be 1, but is %1b", Q);
    end

    #20000;  // wait a cycle to observe result
    
    if(Q == 1'b0) begin
      $display("MSIM> Toggle after reset is correct, Q (value in flip-flop) now %1b", Q);
    end
    else begin
      $display("MSIM> ERROR: Toggle after reset is incorrect. Q (value in flip-flop) should be 0, but is %1b", Q);
    end
    
    #20000;  // wait a cycle to observe result
    
    if(Q == 1'b1) begin
      $display("MSIM> Toggle after reset is correct, Q (value in flip-flop) now %1b", Q);
    end
    else begin
      $display("MSIM> ERROR: Toggle after reset is incorrect. Q (value in flip-flop) should be 1, but is %1b", Q);
    end

    // disable toggle one last time
    T = 1'b0;
    
    #20000;  // wait a cycle to observe result
    
    if(Q == 1'b1) begin
      $display("MSIM> Hold after toggle is correct, Q (value in flip-flop) now %1b", Q);
    end
    else begin
      $display("MSIM> ERROR: Hold after toggle is incorrect. Q (value in flip-flop) should be 1, but is %1b", Q);
    end
        
    // Since the clock (see above) always keeps alternating, the test bench will never run out
    // of things to do.  As a result, we need to tell ModelSim to explicitly stop once we are
    // done with all of our test cases.
    $stop;
  end

endmodule
