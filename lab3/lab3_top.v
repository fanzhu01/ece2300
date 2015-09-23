module lab3_top(CLK50, SW, KEY, RESET_N, LEDR, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);
  input         CLK50;
  input  [9:0]  SW;
  input  [3:0]  KEY;
  input			 RESET_N;
  
  output [9:0]  LEDR;
  output [6:0]  HEX5;
  output [6:0]  HEX4;
  output [6:0]  HEX3;
  output [6:0]  HEX2;
  output [6:0]  HEX1;
  output [6:0]  HEX0;
  
  wire          CLK;
  wire   [3:0]  MIN;
  wire   [3:0]  TENSEC;
  wire   [3:0]  SEC;
  wire   [3:0]  DECISEC;
  wire   [3:0]  CENTISEC;
  
  lab3 theLab(
    .CLK(CLK),
	 .RESET(~RESET_N),
	 .ENABLE(SW[0]),
	 .MIN(MIN),
	 .TENSEC(TENSEC),
	 .SEC(SEC),
	 .DECISEC(DECISEC),
	 .CENTISEC(CENTISEC)
  );
  
  var_clk clockGenerator(
    .clock_50MHz(CLK50),
    .clock_sel(SW[9:7]),
    .var_clock(CLK)
  );
  
  // SEVEN-SEGMENT DISPLAY DRIVERS

  // replace upper segments with code to disable display
  assign HEX5 = 7'b1111111;

  hex_to_seven_seg minDisplay(
    .B(MIN),
    .SSEG_L(HEX4)
  );

  hex_to_seven_seg tensecDisplay(
    .B(TENSEC),
    .SSEG_L(HEX3)
  );

  hex_to_seven_seg secDisplay(
    .B(SEC),
    .SSEG_L(HEX2)
  );

  hex_to_seven_seg decisecDisplay(
    .B(DECISEC),
    .SSEG_L(HEX1)
  );

  hex_to_seven_seg centisecDisplay(
    .B(CENTISEC),
    .SSEG_L(HEX0)
  );
  
endmodule
