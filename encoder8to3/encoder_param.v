module encoder_param #(
    parameter IN_W = 8,
    parameter OUT_W = $clog2(IN_W)
)(
        input  wire [IN_W-1:0] in,
        output wire [OUT_W-1:0] out
);

wire [OUT_W-1:0] temp [IN_W-1:0];

genvar Gi;
generate for(Gi = 0; Gi < IN_W; Gi = Gi + 1)
begin: loop
    if (Gi == 0) 
        assign temp[Gi] = 'h0;
    else
	    assign temp[Gi] = {OUT_W(in[Gi])} & Gi | temp[Gi-1];
end
endgenerate

assign out = temp[IN_W - 1];

endmodule
