/*  lab3_test.v
    ECE/ENGRD 2300, Spring 2014
    
    Author: Saugata Ghose
    Last modified: February 15, 2014
    
    Description: Skeleton test bench for stopwatch circuit.
*/

// sets the granularity at which we simulate
`timescale 1 ps / 1 ps


module lab3_test();

  // inputs
  reg         CLK;
  reg         RESET;
  reg         ENABLE;

  // outputs
  wire [19:0] TIME;
  wire [3:0]  MIN;
  wire [3:0]  TENSEC;
  wire [3:0]  SEC;
  wire [3:0]  DECISEC;
  wire [3:0]  CENTISEC;
  
  // variables for test bench
  integer     i;
  integer     j;
  integer     k;
  reg  [3:0]  expectedCentisec;
  reg  [3:0]  expectedDecisec;
  reg  [3:0]  expectedSec;
  reg  [19:0] expectedTime;

  // instance of lab3 module to test (Unit Under Test)
  lab3 UUT (
    .CLK(CLK),
    .RESET(RESET),
    .ENABLE(ENABLE),
    .TIME(TIME),
	 .MIN(MIN),
	 .TENSEC(TENSEC),
	 .SEC(SEC),
	 .DECISEC(DECISEC),
	 .CENTISEC(CENTISEC)
  );


  /* ALL of the initial and always blocks below will work in parallel.
     Starting at time t = 0, they will all start counting the number
     of ticks.
  */


  // CLK: generate a 10 MHz clock (rising edge does not start until
  //   50,000 ticks (50 ns) into simulation, and each clock cycle lasts for
  //   100,000 ticks (100 ns)
  always
  begin
    CLK = 1'b0;
    CLK = #50000 1'b1;
    #50000;
  end 


  // TEST CASES: add your test cases in the block here
  // REMEMBER: separate each test case by delays that are multiples of #100000, so we can see
  //    the output for at least one cycle (since we chose a 10 MHz clock)
  initial
  begin
    // wait at the beginning to make sure that we don't start on a rising clock edge -
    //    this guarantees that we give the flip-flops enough setup time
    #50000;
    
    // start TEST CASES here
    
    
    
    $display("MSIM>");
    $display("MSIM> FULL STOPWATCH TEST CASES (can be ignored for Part A)");
    $display("MSIM>");

    // reset circuit
    ENABLE = 1'b1;
    RESET = 1'b1;
    expectedCentisec = 4'b0;
    expectedDecisec = 4'b0;
    expectedSec = 4'b0;
    expectedTime = 20'b0;
    
    #100000;  // wait a cycle to observe result
    
    if(TIME == 20'b0) begin
      $display("MSIM> Reset is correct, TIME now %h:%2h:%2h", TIME[19:16], TIME[15:8], TIME[7:0]);
    end
    else begin
      $display("MSIM> ERROR: Reset is incorrect. TIME should be 0:00:00, but is %h:%2h:%2h", TIME[19:16], TIME[15:8], TIME[7:0]);
    end

    // enable and start running
    ENABLE = 1'b1;
    RESET = 1'b0;
    
    for(i = 0; i < 2; i = i + 1) begin
      expectedDecisec = 4'b0;
      
      for(j = 0; j < 10; j = j + 1) begin
        expectedCentisec = 4'b0;
        
        for(k = 0; k < 10; k = k + 1) begin
          if(TIME == {8'b0, expectedSec, expectedDecisec, expectedCentisec}) begin
            $display("MSIM> Increment is correct, TIME now %h:%2h:%2h", TIME[19:16], TIME[15:8], TIME[7:0]);
          end
          else begin
            $display("MSIM> ERROR: Increment is incorrect.  Time should be 0:0%1h:%1h%1h, but is %h:%2h:%2h", expectedSec, expectedDecisec, expectedCentisec, TIME[19:16], TIME[15:8], TIME[7:0]);
          end
          
          expectedCentisec = expectedCentisec + 4'b1;
          #100000;
        end
        
        expectedDecisec = expectedDecisec + 4'b1;
      end
      
      expectedSec = expectedSec + 4'b1;
    end
    
    if(TIME == {8'b0, expectedSec, 8'b0}) begin
      $display("MSIM> Increment is correct, TIME now %h:%2h:%2h", TIME[19:16], TIME[15:8], TIME[7:0]);
    end
    else begin
      $display("MSIM> ERROR: Increment is incorrect.  Time should be 0:0%1h:00, but is %h:%2h:%2h", expectedSec, TIME[19:16], TIME[15:8], TIME[7:0]);
    end

    #579500000;  // advance 5795 cycles to expected stopwatch time 0:59:95
 
    expectedTime = 20'h05995;
    if(TIME == expectedTime) begin
      $display("MSIM> Increment is correct after a long time, TIME now %h:%2h:%2h", TIME[19:16], TIME[15:8], TIME[7:0]);
    end
    else begin
      $display("MSIM> ERROR: Increment is incorrect after a long time.  Time should be %h:%2h:%2h, but is %h:%2h:%2h", expectedTime[19:16], expectedTime[15:8], expectedTime[7:0], TIME[19:16], TIME[15:8], TIME[7:0]);
    end
    
    #100000;  // wait one cycle
 
    expectedTime = 20'h05996;
    if(TIME == expectedTime) begin
      $display("MSIM> Increment is correct, TIME now %h:%2h:%2h", TIME[19:16], TIME[15:8], TIME[7:0]);
    end
    else begin
      $display("MSIM> ERROR: Increment is incorrect.  Time should be %h:%2h:%2h, but is %h:%2h:%2h", expectedTime[19:16], expectedTime[15:8], expectedTime[7:0], TIME[19:16], TIME[15:8], TIME[7:0]);
    end
    
    #100000;  // wait one cycle
 
    expectedTime = 20'h05997;
    if(TIME == expectedTime) begin
      $display("MSIM> Increment is correct, TIME now %h:%2h:%2h", TIME[19:16], TIME[15:8], TIME[7:0]);
    end
    else begin
      $display("MSIM> ERROR: Increment is incorrect.  Time should be %h:%2h:%2h, but is %h:%2h:%2h", expectedTime[19:16], expectedTime[15:8], expectedTime[7:0], TIME[19:16], TIME[15:8], TIME[7:0]);
    end
    
    #100000;  // wait one cycle
 
    expectedTime = 20'h05998;
    if(TIME == expectedTime) begin
      $display("MSIM> Increment is correct, TIME now %h:%2h:%2h", TIME[19:16], TIME[15:8], TIME[7:0]);
    end
    else begin
      $display("MSIM> ERROR: Increment is incorrect.  Time should be %h:%2h:%2h, but is %h:%2h:%2h", expectedTime[19:16], expectedTime[15:8], expectedTime[7:0], TIME[19:16], TIME[15:8], TIME[7:0]);
    end
    
    #100000;  // wait one cycle
 
    expectedTime = 20'h05999;
    if(TIME == expectedTime) begin
      $display("MSIM> Increment is correct, TIME now %h:%2h:%2h", TIME[19:16], TIME[15:8], TIME[7:0]);
    end
    else begin
      $display("MSIM> ERROR: Increment is incorrect.  Time should be %h:%2h:%2h, but is %h:%2h:%2h", expectedTime[19:16], expectedTime[15:8], expectedTime[7:0], TIME[19:16], TIME[15:8], TIME[7:0]);
    end
    
    #100000;  // wait one cycle
 
    expectedTime = 20'h10000;
    if(TIME == expectedTime) begin
      $display("MSIM> Increment is correct, TIME now %h:%2h:%2h", TIME[19:16], TIME[15:8], TIME[7:0]);
    end
    else begin
      $display("MSIM> ERROR: Increment is incorrect.  Time should be %h:%2h:%2h, but is %h:%2h:%2h", expectedTime[19:16], expectedTime[15:8], expectedTime[7:0], TIME[19:16], TIME[15:8], TIME[7:0]);
    end
    
    #100000;  // wait one cycle
 
    expectedTime = 20'h10001;
    if(TIME == expectedTime) begin
      $display("MSIM> Increment is correct, TIME now %h:%2h:%2h", TIME[19:16], TIME[15:8], TIME[7:0]);
    end
    else begin
      $display("MSIM> ERROR: Increment is incorrect.  Time should be %h:%2h:%2h, but is %h:%2h:%2h", expectedTime[19:16], expectedTime[15:8], expectedTime[7:0], TIME[19:16], TIME[15:8], TIME[7:0]);
    end
    
    #100000;  // wait one cycle
 
    expectedTime = 20'h10002;
    if(TIME == expectedTime) begin
      $display("MSIM> Increment is correct, TIME now %h:%2h:%2h", TIME[19:16], TIME[15:8], TIME[7:0]);
    end
    else begin
      $display("MSIM> ERROR: Increment is incorrect.  Time should be %h:%2h:%2h, but is %h:%2h:%2h", expectedTime[19:16], expectedTime[15:8], expectedTime[7:0], TIME[19:16], TIME[15:8], TIME[7:0]);
    end
    
    #100000;  // wait one cycle
 
    expectedTime = 20'h10003;
    if(TIME == expectedTime) begin
      $display("MSIM> Increment is correct, TIME now %h:%2h:%2h", TIME[19:16], TIME[15:8], TIME[7:0]);
    end
    else begin
      $display("MSIM> ERROR: Increment is incorrect.  Time should be %h:%2h:%2h, but is %h:%2h:%2h", expectedTime[19:16], expectedTime[15:8], expectedTime[7:0], TIME[19:16], TIME[15:8], TIME[7:0]);
    end
    
    ENABLE = 1'b0;  // hold the counter value
    
    for(i = 0; i < 7; i = i + 1) begin
      #100000;  // wait one cycle

      if(TIME == expectedTime) begin
        $display("MSIM> Holding is correct, TIME now %h:%2h:%2h", TIME[19:16], TIME[15:8], TIME[7:0]);
      end
      else begin
        $display("MSIM> ERROR: Holding is incorrect.  Time should be %h:%2h:%2h, but is %h:%2h:%2h", expectedTime[19:16], expectedTime[15:8], expectedTime[7:0], TIME[19:16], TIME[15:8], TIME[7:0]);
      end
    end
    
    ENABLE = 1'b1;  // continue the stopwatch
 
    for(i = 0; i < 4; i = i + 1) begin
      #100000;  // wait one cycle
      expectedTime = expectedTime + 20'b1;

      if(TIME == expectedTime) begin
        $display("MSIM> Incrementing after holding is correct, TIME now %h:%2h:%2h", TIME[19:16], TIME[15:8], TIME[7:0]);
      end
      else begin
        $display("MSIM> ERROR: Incrementing after holding is incorrect.  Time should be %h:%2h:%2h, but is %h:%2h:%2h", expectedTime[19:16], expectedTime[15:8], expectedTime[7:0], TIME[19:16], TIME[15:8], TIME[7:0]);
      end
    end
    
    ENABLE = 1'b0;  // hold the counter value
    
    for(i = 0; i < 2; i = i + 1) begin
      #100000;  // wait one cycle

      if(TIME == expectedTime) begin
        $display("MSIM> Holding is correct, TIME now %h:%2h:%2h", TIME[19:16], TIME[15:8], TIME[7:0]);
      end
      else begin
        $display("MSIM> ERROR: Holding is incorrect.  Time should be %h:%2h:%2h, but is %h:%2h:%2h", expectedTime[19:16], expectedTime[15:8], expectedTime[7:0], TIME[19:16], TIME[15:8], TIME[7:0]);
      end
    end
    
    RESET = 1'b1;  // reset the counter value
    expectedTime  = 20'b0;
    
    for(i = 0; i < 7; i = i + 1) begin
      #100000;  // wait one cycle

      if(TIME == expectedTime) begin
        $display("MSIM> Resetting while not enabled is correct, TIME now %h:%2h:%2h", TIME[19:16], TIME[15:8], TIME[7:0]);
      end
      else begin
        $display("MSIM> ERROR: Resetting while not enabled is incorrect.  Time should be %h:%2h:%2h, but is %h:%2h:%2h", expectedTime[19:16], expectedTime[15:8], expectedTime[7:0], TIME[19:16], TIME[15:8], TIME[7:0]);
      end
    end
    
    RESET = 1'b0;  // hold the counter value after reset
    
    for(i = 0; i < 2; i = i + 1) begin
      #100000;  // wait one cycle

      if(TIME == expectedTime) begin
        $display("MSIM> Holding after reset is correct, TIME now %h:%2h:%2h", TIME[19:16], TIME[15:8], TIME[7:0]);
      end
      else begin
        $display("MSIM> ERROR: Holding after reset is incorrect.  Time should be %h:%2h:%2h, but is %h:%2h:%2h", expectedTime[19:16], expectedTime[15:8], expectedTime[7:0], TIME[19:16], TIME[15:8], TIME[7:0]);
      end
    end
    
    ENABLE = 1'b1;
    
    for(i = 0; i < 6; i = i + 1) begin
      #100000;  // wait one cycle
      expectedTime = expectedTime + 20'b1;

      if(TIME == expectedTime) begin
        $display("MSIM> Incrementing after resetting is correct, TIME now %h:%2h:%2h", TIME[19:16], TIME[15:8], TIME[7:0]);
      end
      else begin
        $display("MSIM> ERROR: Incrementing after resetting is incorrect.  Time should be %h:%2h:%2h, but is %h:%2h:%2h", expectedTime[19:16], expectedTime[15:8], expectedTime[7:0], TIME[19:16], TIME[15:8], TIME[7:0]);
      end
    end
    

    
    $display("MSIM>");
    $display("MSIM> ===============================================================");
    $display("MSIM>");
    $display("MSIM> CENTISEC TEST CASES (can be ignored for Part B)");
    $display("MSIM>");
   
    // reset circuit
    ENABLE = 1'b1;
    RESET = 1'b1;
    expectedCentisec = 4'b0;
    
    #100000;  // wait a cycle to observe result
    
    if(TIME[3:0] == 4'b0) begin
      $display("MSIM> Reset is correct, CENTISEC now %2d", TIME[3:0]);
    end
    else begin
      $display("MSIM> ERROR: Reset is incorrect. CENTISEC should be 00, but is %2d", TIME[3:0]);
    end

    // enable and start running
    ENABLE = 1'b1;
    RESET = 1'b0;
    
    // observe incrementing for 20 cycles
    for(i = 0; i < 20; i = i + 1) begin
      #100000;
      expectedCentisec = expectedCentisec + 4'b1;
      
      if(TIME[3:0] == expectedCentisec) begin
        $display("MSIM> Incrementing is correct for this cycle, CENTISEC now %2d", TIME[3:0]);
      end
      else begin
        $display("MSIM> ERROR: Incrementing is incorrect. CENTISEC should be %2d, but is %2d", expectedCentisec, TIME[3:0]);
      end
    end
    
    // disable counter
    ENABLE = 1'b0;
    
    // observe holding for 5 cycles
    for(i = 0; i < 5; i = i + 1) begin
      #100000;
      if(TIME[3:0] == expectedCentisec) begin
        $display("MSIM> Holding is correct for this cycle, CENTISEC now %2d", TIME[3:0]);
      end
      else begin
        $display("MSIM> ERROR: Holding is incorrect. CENTISEC should be %2d, but is %2d", expectedCentisec, TIME[3:0]);
      end
    end
    
    ENABLE = 1'b1;
    
    // observe incrementing after holding for 5 cycles (should continue where it left off)
    for(i = 0; i < 5; i = i + 1) begin
      #100000;
      expectedCentisec = expectedCentisec + 4'b1;
      
      if(TIME[3:0] == expectedCentisec) begin
        $display("MSIM> Incrementing after holding is correct for this cycle, CENTISEC now %2d", TIME[3:0]);
      end
      else begin
        $display("MSIM> ERROR: Incrementing after holding is incorrect. CENTISEC should be %2d, but is %2d", expectedCentisec, TIME[3:0]);
      end
    end
    
    ENABLE = 1'b0;
    
    // observe holding for 5 cycles
    for(i = 0; i < 5; i = i + 1) begin
      #100000;
      if(TIME[3:0] == expectedCentisec) begin
        $display("MSIM> Holding is correct for this cycle, CENTISEC now %2d", TIME[3:0]);
      end
      else begin
        $display("MSIM> ERROR: Holding is incorrect. CENTISEC should be %2d, but is %2d", expectedCentisec, TIME[3:0]);
      end
    end
    
    RESET = 1'b1;
    expectedCentisec = 4'b0;
    
    // observe reset with enable disabled for 5 cycles
    for(i = 0; i < 5; i = i + 1) begin
      #100000;
      if(TIME[3:0] == 4'b0) begin
        $display("MSIM> Resetting while not enabled is correct for this cycle, CENTISEC now %2d", TIME[3:0]);
      end
      else begin
        $display("MSIM> ERROR: Resetting while not enabled is incorrect. CENTISEC should be 00, but is %2d", TIME[3:0]);
      end
    end
    
    RESET = 1'b0;
    
    // observe holding for 5 cycles
    for(i = 0; i < 5; i = i + 1) begin
      #100000;
      if(TIME[3:0] == 4'b0) begin
        $display("MSIM> Holding after reset is correct for this cycle, CENTISEC now %2d", TIME[3:0]);
      end
      else begin
        $display("MSIM> ERROR: Holding after reset is incorrect. CENTISEC should be 00, but is %2d", TIME[3:0]);
      end
    end
   
    ENABLE = 1'b1;
    
    // observe incrementing after holding for 5 cycles (should continue where it left off)
    for(i = 0; i < 5; i = i + 1) begin
      #100000;
      expectedCentisec = expectedCentisec + 4'b1;
      
      if(TIME[3:0] == expectedCentisec) begin
        $display("MSIM> Incrementing after holding is correct for this cycle, CENTISEC now %2d", TIME[3:0]);
      end
      else begin
        $display("MSIM> ERROR: Incrementing after holding is incorrect. CENTISEC should be %2d, but is %2d", expectedCentisec, TIME[3:0]);
      end
    end
        
    // Since the clock (see above) always keeps alternating, the test bench will never run out
    // of things to do.  As a result, we need to tell ModelSim to explicitly stop once we are
    // done with all of our test cases.
    $stop;
  end

endmodule
