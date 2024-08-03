module div6(
        input  wire clk,
        input  wire reset,
        output reg clk_div6
);
reg [2:0] cnt;

always @(posedge clk) begin
	if (reset) begin
		cnt <= 0;
		clk_div6 <= 0;
	end
	else begin
		if (cnt == 2) begin
			cnt <= 0;
			clk_div6 <= ~clk_div6;
		end else
			cnt <= cnt + 1;	
	end
end

endmodule