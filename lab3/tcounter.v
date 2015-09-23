module tcounter(CLK, CLR, ENP, ENT, Q);

input          CLK;
input          CLR;
input          ENP;
input          ENT;

output [3:0]   Q;

reg    [3:0]   IN;
wire           go;

assign go = (ENP & ENT) & ~CLR 
always @(*) begin
	casez({Q, go)
		// reset
		5'b0000_1: IN = 4'b0001;
		5'b0001_1: IN = 4'b0011;
		5'b0010_1: IN = 4'b0001;
		5'b0011_1: IN = 4'b0111;
		5'b0100_1: IN = 4'b0001;
		5'b0101_1: IN = 4'b0011;
		5'b0110_1: IN = 4'b0001;
		5'b0111_1: IN = 4'b1111;
		5'b1000_1: IN = 4'b0001;
		5'b1001_1: IN = 4'b0011;
		5'b1010_1: IN = 4'b0001;
		5'b1011_1: IN = 4'b0111;
		5'b1100_1: IN = 4'b0001;
		5'b1101_1: IN = 4'b0011;
		5'b1110_1: IN = 4'b0001;
		5'b1111_1: IN = 4'b1111;
		default  : IN = 4'b0000;
	endcase
end

treg4bit treg(
 	.CLK(CLK),
 	.RESET(CLR),
 	.IN(IN),
 	.OUT(Q)
);

endmodule

