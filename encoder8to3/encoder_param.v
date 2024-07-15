module encoder_param #(
    parameter IN_W = 8,
    parameter OUT_W = $clog2(IN_W)
)(
        input  wire [IN_W-1:0] in,
        output wire [OUT_W-1:0] out
);

genvar Gi;
generate for(Gi = 0; Gi < IN_W; Gi = Gi + 1)
begin: loop
	assign out = (in[Gi]) ? Gi : 0;
end
endgenerate


endmodule
