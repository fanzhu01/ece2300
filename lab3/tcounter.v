module tcounter(CLK, CLR, ENP, ENT, Q);

input          CLK;
input          CLR;
input          ENP;
input          ENT;
//input    [3:0] range;

output     [3:0]   Q;


reg        [3:0]   IN;
wire               go;
wire       [3:0]   OUT;


//assign reset = ( go && OUT == range) ? 1 : 0;
assign go = (ENP & ENT) ;
always @(*) begin
	casez({Q, go})
		// reset
		5'b0000_1: IN = 4'b0001;
		5'b0001_1: IN = 4'b0011;
		5'b0010_1: IN = 4'b0001;
		5'b0011_1: IN = 4'b0111;
		5'b0100_1: IN = 4'b0001;
		5'b0101_1: IN = 4'b0011;
		//5'b0101_1: begin if (range == 4'd6) IN = 4'b0101; else IN = 4'b0011; end
		5'b0110_1: IN = 4'b0001;
		5'b0111_1: IN = 4'b1111;
		5'b1000_1: IN = 4'b0001;
		5'b1001_1: IN = 4'b1001;
		default  : IN = 4'b0000;
	endcase
end

treg4bit treg(
 	.CLK(CLK),
 	.RESET(~CLR),
 	.IN(IN),
 	.OUT(OUT)
);

assign Q =  OUT;


endmodule

