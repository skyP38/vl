`timescale 100ns/1ns

module testbench;
reg [7:0] data;
wire[2:0] sum;

VectorSum #(.DATA_W(8)) DUT(
        .data(data),
	.sum(sum)
);

integer i, j;

initial begin
	
	in = 8'b1;
	for (j = 0; j<7; j = j+1) begin
	
		for (i = 0; i<3; i= i+1)
			$display(out[i]);
		#100;
		in  = in + 1;
	end
end


endmodule
