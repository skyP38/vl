module generator_param #(
    parameter PULSE = 5,
    parameter POS_W = $clog2(PULSE)
) (
        input  wire clk,
        input  wire reset,
        output reg signal
);
reg [POS_W:0] cnt;

always @(posedge clk) begin
	if (reset) begin
		cnt <= 0;
		signal <= 0;
	end
	else begin
		if (cnt == PULSE-1) begin
			cnt <= 0;
			signal <= 1;
		end else begin
			cnt <= cnt + 1;	
			signal <= 0;
		end
	end
end

endmodule