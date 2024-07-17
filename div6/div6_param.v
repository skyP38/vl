module div6_param #(
    parameter DIV = 6,
    parameter POS_W = $clog2(DIV)
)(
        input  wire clk,
        input  wire reset,
        output reg clk_div6
);
reg [POS_W:0] cnt;

always @(posedge clk) begin
	if (reset) begin
		cnt <= 0;
		clk_div6 <= 0;
	end
	else begin
		if (cnt == (DIV >> 1) - 1) begin
			cnt <= 0;
			clk_div6 <= ~clk_div6;
		end else
			cnt <= cnt + 1;	
	end
end

endmodule
