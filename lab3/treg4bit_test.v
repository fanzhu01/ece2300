/*  treg4bit_test.v
    ECE/ENGRD 2300, Spring 2014
    
    Author: Saugata Ghose
    Last modified: February 15, 2014
    
    Description: Skeleton test bench for stopwatch circuit.
*/

// sets the granularity at which we simulate
`timescale 1 ps / 1 ps


module treg4bit_test();

  // inputs
  reg         CLK50;
  reg         RESET;
  reg  [3:0]  IN;
  
  // outputs
  wire [3:0]  OUT;
  
  // variables - internal state that can be used for statistics such as
  //   counters, but are not visible outside the test bench
  integer currentTestCorrect;
  integer numTestsPassed;
  
  
  // instance of treg4bit module to test (Unit Under Test)
  treg4bit UUT (
    .CLK(CLK50),
    .RESET(RESET),
    .IN(IN),
    .OUT(OUT)
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
    
    $display("MSIM> ");
    $display("MSIM> TEST CASES");
    $display("MSIM> ");
    
    numTestsPassed = 0;
    
    /* TESTS
       1. reset works
       2. all toggle
       3. all pause
       4. reset while all toggle
       5. 
       5. odd toggle
       6. first 2 toggle
       7. 0, 1, 3 toggle
       8. all pause --> all toggle
    */
    
    $display("MSIM> ");
    $display("MSIM> TEST 1: RESET FUNCTIONALITY");
    $display("MSIM> ===========================");
    $display("MSIM> ");
    
    currentTestCorrect = 1;
   
    // reset circuit
    RESET = 1'b1;
    IN = 4'b0;
    
    #20000;  // wait a cycle to observe result
    
    if(OUT == 4'b0) begin
      $display("MSIM> Reset is correct, OUT (value in register) now %4b", OUT);
    end
    else begin
      $display("MSIM> ERROR: Reset is incorrect. OUT (value in register) should be 0000, but is %4b", OUT);
      currentTestCorrect = 0;
    end
    
    $display("MSIM> ");
    if(currentTestCorrect == 1) begin
      numTestsPassed = numTestsPassed + 1;
      $display("MSIM> TEST 1 PASSED");
    end
    else begin
      $display("MSIM> TEST 1 FAILED (-1 pt)");
    end
    $display("MSIM> ");
    

    $display("MSIM> ");
    $display("MSIM> TEST 2: TOGGLE ALL FLIP-FLOPS");
    $display("MSIM> =============================");
    $display("MSIM> ");
    
    currentTestCorrect = 1;
    
    // enable and start running, but don't toggle yet
    RESET = 1'b0;
    
    #20000;  // wait a cycle to observe result
    
    if(OUT == 4'b0) begin
      $display("MSIM> Toggle off state (IN = %4b) is correct, OUT (value in register) now %4b", IN, OUT);
    end
    else begin
      $display("MSIM> ERROR: Toggle off state (IN = %4b) is incorrect. OUT (value in register) should be 0000, but is %4b", IN, OUT);
      currentTestCorrect = 0;
    end

    #20000;  // wait a cycle to observe result
    
    if(OUT == 4'b0) begin
      $display("MSIM> Toggle off state (IN = %4b) is correct, OUT (value in register) now %4b", IN, OUT);
    end
    else begin
      $display("MSIM> ERROR: Toggle off state (IN = %4b) is incorrect. OUT (value in register) should be 0000, but is %4b", IN, OUT);
      currentTestCorrect = 0;
    end

    // set toggle bits to 1 - output should now change every cycle
    IN = 4'b1111;

    #20000;  // wait a cycle to observe result
    
    if(OUT == 4'b1111) begin
      $display("MSIM> Toggle (IN = %4b) is correct, OUT (value in register) now %4b", IN, OUT);
    end
    else begin
      $display("MSIM> ERROR: Toggle (IN = %4b) is incorrect. OUT (value in register) should be 1111, but is %4b", IN, OUT);
      currentTestCorrect = 0;
    end

    #20000;  // wait a cycle to observe result
    
    if(OUT == 4'b0) begin
      $display("MSIM> Toggle (IN = %4b) is correct, OUT (value in register) now %4b", IN, OUT);
    end
    else begin
      $display("MSIM> ERROR: Toggle (IN = %4b) is incorrect. OUT (value in register) should be 0000, but is %4b", IN, OUT);
      currentTestCorrect = 0;
    end

    #20000;  // wait a cycle to observe result
    
    if(OUT == 4'b1111) begin
      $display("MSIM> Toggle (IN = %4b) is correct, OUT (value in register) now %4b", IN, OUT);
    end
    else begin
      $display("MSIM> ERROR: Toggle (IN = %4b) is incorrect. OUT (value in register) should be 1111, but is %4b", IN, OUT);
      currentTestCorrect = 0;
    end

    $display("MSIM> ");
    if(currentTestCorrect == 1) begin
      numTestsPassed = numTestsPassed + 1;
      $display("MSIM> TEST 2 PASSED");
    end
    else begin
      $display("MSIM> TEST 2 FAILED (-1 pt)");
    end
    $display("MSIM> ");
    

    $display("MSIM> ");
    $display("MSIM> TEST 3: HOLD FOR ALL FLIP-FLOPS");
    $display("MSIM> ===============================");
    $display("MSIM> ");
    
    currentTestCorrect = 1;
    
    // disable toggle again
    IN = 4'b0;

    #20000;  // wait a cycle to observe result
    
    if(OUT == 4'b1111) begin
      $display("MSIM> Toggle off state (IN = %4b) is correct, OUT (value in register) now %4b", IN, OUT);
    end
    else begin
      $display("MSIM> ERROR: Toggle off state (IN = %4b) is incorrect. OUT (value in register) should be 1111, but is %4b", IN, OUT);
      currentTestCorrect = 0;
    end

    #20000;  // wait a cycle to observe result
    
    if(OUT == 4'b1111) begin
      $display("MSIM> Toggle off state (IN = %4b) is correct, OUT (value in register) now %4b", IN, OUT);
    end
    else begin
      $display("MSIM> ERROR: Toggle off state (IN = %4b) is incorrect. OUT (value in register) should be 1111, but is %4b", IN, OUT);
      currentTestCorrect = 0;
    end

    #20000;  // wait a cycle to observe result
    
    if(OUT == 4'b1111) begin
      $display("MSIM> Toggle off state (IN = %4b) is correct, OUT (value in register) now %4b", IN, OUT);
    end
    else begin
      $display("MSIM> ERROR: Toggle off state (IN = %4b) is incorrect. OUT (value in register) should be 1111, but is %4b", IN, OUT);
      currentTestCorrect = 0;
    end

    // start toggling again
    IN = 4'b1111;
    
    #20000;  // wait a cycle to observe result
    
    if(OUT == 4'b0) begin
      $display("MSIM> Toggle (IN = %4b) is correct, OUT (value in register) now %4b", IN, OUT);
    end
    else begin
      $display("MSIM> ERROR: Toggle (IN = %4b) is incorrect. OUT (value in register) should be 0000, but is %4b", IN, OUT);
      currentTestCorrect = 0;
    end

    #20000;  // wait a cycle to observe result
    
    if(OUT == 4'b1111) begin
      $display("MSIM> Toggle (IN = %4b) is correct, OUT (value in register) now %4b", IN, OUT);
    end
    else begin
      $display("MSIM> ERROR: Toggle (IN = %4b) is incorrect. OUT (value in register) should be 1111, but is %4b", IN, OUT);
      currentTestCorrect = 0;
    end

    $display("MSIM> ");
    if(currentTestCorrect == 1) begin
      numTestsPassed = numTestsPassed + 1;
      $display("MSIM> TEST 3 PASSED");
    end
    else begin
      $display("MSIM> TEST 3 FAILED (-1 pt)");
    end
    $display("MSIM> ");
    

    $display("MSIM> ");
    $display("MSIM> TEST 4: RESET WHILE TOGGLE IS ON");
    $display("MSIM> ================================");
    $display("MSIM> ");
    
    currentTestCorrect = 1;
    
    // reset with toggle bit on
    RESET = 1'b1;
    
    #20000;  // wait a cycle to observe result
    
    if(OUT == 4'b0) begin
      $display("MSIM> Reset with toggle on (IN = %4b) is correct, OUT (value in register) now %4b", IN, OUT);
    end
    else begin
      $display("MSIM> ERROR: Reset with toggle on (IN = %4b) is incorrect. OUT (value in register) should be 0000, but is %4b", IN, OUT);
      currentTestCorrect = 0;
    end
    
    #20000;  // wait a cycle to observe result
    
    if(OUT == 4'b0) begin
      $display("MSIM> Reset with toggle on (IN = %4b) is correct, OUT (value in register) now %4b", IN, OUT);
    end
    else begin
      $display("MSIM> ERROR: Reset with toggle on (IN = %4b) is incorrect. OUT (value in register) should be 0000, but is %4b", IN, OUT);
      currentTestCorrect = 0;
    end
    
    $display("MSIM> ");
    if(currentTestCorrect == 1) begin
      numTestsPassed = numTestsPassed + 1;
      $display("MSIM> TEST 4 PASSED");
    end
    else begin
      $display("MSIM> TEST 4 FAILED (-1 pt)");
    end
    $display("MSIM> ");
    
    
    $display("MSIM> ");
    $display("MSIM> TEST 5: PARTIAL TOGGLE");
    $display("MSIM> ======================");
    $display("MSIM> ");
    
    currentTestCorrect = 1;
    
    // enable toggling for only some of the flip-flops
    RESET = 1'b0;
    IN = 4'b0101;
    
    #20000;  // wait a cycle to observe result
    
    if(OUT == 4'b0101) begin
      $display("MSIM> Partial toggle (IN = %4b) is correct, OUT (value in register) now %4b", IN, OUT);
    end
    else begin
      $display("MSIM> ERROR: Partial toggle (IN = %4b) is incorrect. OUT (value in register) should be 0101, but is %4b", IN, OUT);
      currentTestCorrect = 0;
    end
    
    // enable toggling for only some of the flip-flops
    IN = 4'b1100;
    
    #20000;  // wait a cycle to observe result
    
    if(OUT == 4'b1001) begin
      $display("MSIM> Partial toggle (IN = %4b) is correct, OUT (value in register) now %4b", IN, OUT);
    end
    else begin
      $display("MSIM> ERROR: Partial toggle (IN = %4b) is incorrect. OUT (value in register) should be 1001, but is %4b", IN, OUT);
      currentTestCorrect = 0;
    end
    
    // enable toggling for only some of the flip-flops
    IN = 4'b1011;
    
    #20000;  // wait a cycle to observe result
    
    if(OUT == 4'b0010) begin
      $display("MSIM> Partial toggle (IN = %4b) is correct, OUT (value in register) now %4b", IN, OUT);
    end
    else begin
      $display("MSIM> ERROR: Partial toggle (IN = %4b) is incorrect. OUT (value in register) should be 0010, but is %4b", IN, OUT);
      currentTestCorrect = 0;
    end
    
    // enable toggling for only some of the flip-flops
    IN = 4'b0110;
    
    #20000;  // wait a cycle to observe result
    
    if(OUT == 4'b0100) begin
      $display("MSIM> Partial toggle (IN = %4b) is correct, OUT (value in register) now %4b", IN, OUT);
    end
    else begin
      $display("MSIM> ERROR: Partial toggle (IN = %4b) is incorrect. OUT (value in register) should be 0100, but is %4b", IN, OUT);
      currentTestCorrect = 0;
    end
    
    // enable toggling for only some of the flip-flops
    IN = 4'b0000;
    
    #20000;  // wait a cycle to observe result
    
    if(OUT == 4'b0100) begin
      $display("MSIM> Partial toggle (IN = %4b) is correct, OUT (value in register) now %4b", IN, OUT);
    end
    else begin
      $display("MSIM> ERROR: Partial toggle (IN = %4b) is incorrect. OUT (value in register) should be 0100, but is %4b", IN, OUT);
      currentTestCorrect = 0;
    end
    
     // enable toggling for only some of the flip-flops
    IN = 4'b1100;
    
    #20000;  // wait a cycle to observe result
    
    if(OUT == 4'b1000) begin
      $display("MSIM> Partial toggle (IN = %4b) is correct, OUT (value in register) now %4b", IN, OUT);
    end
    else begin
      $display("MSIM> ERROR: Partial toggle (IN = %4b) is incorrect. OUT (value in register) should be 1000, but is %4b", IN, OUT);
      currentTestCorrect = 0;
    end
    
     // enable toggling for only some of the flip-flops
    IN = 4'b0011;
    
    #20000;  // wait a cycle to observe result
    
    if(OUT == 4'b1011) begin
      $display("MSIM> Partial toggle (IN = %4b) is correct, OUT (value in register) now %4b", IN, OUT);
    end
    else begin
      $display("MSIM> ERROR: Partial toggle (IN = %4b) is incorrect. OUT (value in register) should be 1011, but is %4b", IN, OUT);
      currentTestCorrect = 0;
    end
    
    // enable toggling for only some of the flip-flops
    IN = 4'b1101;
    
    #20000;  // wait a cycle to observe result
    
    if(OUT == 4'b0110) begin
      $display("MSIM> Partial toggle (IN = %4b) is correct, OUT (value in register) now %4b", IN, OUT);
    end
    else begin
      $display("MSIM> ERROR: Partial toggle (IN = %4b) is incorrect. OUT (value in register) should be 0110, but is %4b", IN, OUT);
      currentTestCorrect = 0;
    end
    
    // enable toggling for only some of the flip-flops
    IN = 4'b0000;
    
    #20000;  // wait a cycle to observe result
    
    if(OUT == 4'b0110) begin
      $display("MSIM> Partial toggle (IN = %4b) is correct, OUT (value in register) now %4b", IN, OUT);
    end
    else begin
      $display("MSIM> ERROR: Partial toggle (IN = %4b) is incorrect. OUT (value in register) should be 0110, but is %4b", IN, OUT);
      currentTestCorrect = 0;
    end
    
    $display("MSIM> ");
    if(currentTestCorrect == 1) begin
      numTestsPassed = numTestsPassed + 2;
      $display("MSIM> TEST 5 PASSED");
    end
    else begin
      $display("MSIM> TEST 5 FAILED (-2 pt)");
    end
    $display("MSIM> ");
    
    
    $display("MSIM> ");
    $display("MSIM> TEST 6: RESET AFTER PARTIAL TOGGLE");
    $display("MSIM> ==================================");
    $display("MSIM> ");
    
    currentTestCorrect = 1;
    
    // enable reset
    RESET = 1'b1;
    
    #20000;  // wait a cycle to observe result
    
    if(OUT == 4'b0000) begin
      $display("MSIM> Reset after partial toggle is correct, OUT (value in register) now %4b", OUT);
    end
    else begin
      $display("MSIM> ERROR: Reset after partial toggle is incorrect. OUT (value in register) should be 0101, but is %4b", OUT);
      currentTestCorrect = 0;
    end
    
    $display("MSIM> ");
    if(currentTestCorrect == 1) begin
      numTestsPassed = numTestsPassed + 1;
      $display("MSIM> TEST 6 PASSED");
    end
    else begin
      $display("MSIM> TEST 6 FAILED (-1 pt)");
    end
    $display("MSIM> ");
    
    
    // print final score
    $display("MSIM> ");
    $display("MSIM> Prelab 3 Score: %2d / 7", numTestsPassed);
    
        
    // Since the clock (see above) always keeps alternating, the test bench will never run out
    // of things to do.  As a result, we need to tell ModelSim to explicitly stop once we are
    // done with all of our test cases.
    $stop;
  end

endmodule
