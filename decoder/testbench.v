`timescale 1ns/1ns

module testbench;

reg     [4  : 0] in;
wire    [15 : 0] out;

decoder_param #(.IN(4))
dec(
    .digit(in),
    .vector(out)
);

integer i, j;
reg [15:0] ans;
initial ans = 1;

initial begin
    in = 4'b0;
    for (i = 0; i < 16; i = i + 1) begin
        for (j = 0; j < 16; j = j + 1)
            $display(out[j]);
        #100;
        ans = ans << 1;
        in = in + 1;
    end
end


endmodule