`timescale 10ns/1ns

module testbench;
reg clk;
reg reset;
wire signal;


initial begin
        clk = 0;
        reset = 1;
        #10;
        reset = 0;
end

always #1 clk = ~clk;


generator_param #(.PULSE(8)) DUT  (
        .clk(clk),
        .reset(reset),
        .signal(signal)
);

endmodule