module div_param #(
    parameter DIV = 6,
    parameter POS_W = $clog2((DIV >> 1) - 1)
)(
        input  wire clk,
        input  wire reset,
        output reg clk_div
);
reg [POS_W-1:0] cnt;

always @(posedge clk) begin
	if (reset) begin
		cnt <= 0;
		clk_div <= 0;
	end
	else begin
		if (cnt == (DIV >> 1) - 1) begin
			cnt <= 0;
			clk_div <= ~clk_div;
		end else
			cnt <= cnt + 1;	
	end
end

endmodule
