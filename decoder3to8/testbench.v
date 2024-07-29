`timescale 100ns/1ns

module testbench;
reg  [3:0] digit;
wire [15:0] vector; 

decoder_param #(.IN(4)) DUT (digit, vector);

integer i, j;

initial begin
	
	digit = 4'b0000;
	for (j = 0; j<15; j = j+1) begin
	digit  = digit + 1;
		for (i = 0; i<16; i= i+1)
			$display(vector[i]);
		#100;
	end
end
endmodule
