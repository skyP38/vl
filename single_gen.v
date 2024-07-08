module single_gen (
    input  clk,
    input  reset,
    output reg pulse
);

reg [2:0] counter;

always @(posedge reset) begin
    if (reset) begin
        counter <= 3'b0;
        pulse <= 1'b0;
    end 
end

always @(posedge clk) begin
     if (counter == 3'b100) begin
            counter <= 3'b0;
            pulse <= 1'b1;
      end else if (counter == 3'b101) begin
            pulse <= 1'b0;
      end else begin
            counter <= counter + 1;
      end
end

endmodule
