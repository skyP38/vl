module decoder3to8(
	input 	wire [2:0] digit,
	output 	wire [7:0] vector
);

assign vector = 1'b1 << digit;

endmodule
