module decoder_param #(
    parameter IN = 3,
    parameter OUT = 1 << IN
) (
	input wire [IN-1:0] digit,
	output wire [OUT-1:0] vector
);

assign vector = 1'b1 << digit;

endmodule