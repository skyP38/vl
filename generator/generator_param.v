module generator_param #(
    parameter PULSE = 5,
    parameter POS_W = $clog2(PULSE)
) (
        input  wire clk,
        input  wire reset,
        output wire signal
);
reg [POS_W-1:0] cnt;

always @(posedge clk) begin
	if (reset)
		cnt <= 0;
	else begin
		if (cnt == PULSE-1) 
			cnt <= 0;
		else 
			cnt <= cnt + 1;	
	end
end

assign signal = (cnt == PULSE-1);

endmodule