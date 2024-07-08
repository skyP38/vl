module clk_divider_by_6 (
    input clk,
    input reset,
    output reg clk_div
);

reg [2:0] counter;

always @(posedge reset) begin
    if (reset) begin
        counter <= 3'b0;
        clk_div <= 1'b0;
    end 
end

always @(posedge clk) begin
    if (counter == 3'b101) begin
        counter <= 3'b0;
        clk_div <= ~clk_div;
    end else begin
         counter <= counter + 1;
    end
end

endmodule
