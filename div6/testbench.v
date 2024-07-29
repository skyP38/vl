`timescale 10ns/1ns

module testbench;
reg clk;
reg reset;
wire clk_div6;

initial begin
        clk = 0;
        reset = 1;
	#2;
        reset = 0;
end

always #1 clk = ~clk;


div6_param #(.DIV(8)) DUT  (
        .clk(clk),
        .reset(reset),
        .clk_div6(clk_div6)
);



endmodule