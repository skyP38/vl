module generator(
        input  wire clk,
        input  wire reset,
        output reg signal
);
reg [2:0] cnt;

always @(posedge clk) begin
	if (reset) begin
		cnt <= 0;
		signal <= 0;
	end
	else begin
		if (cnt == 4) begin
			cnt <= 0;
			signal <= 1;
		end else begin
			cnt <= cnt + 1;	
			signal <= 0;
		end
	end
end

endmodule
