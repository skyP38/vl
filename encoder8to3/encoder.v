module encoder(
        input  wire [7:0] in,
        output wire [2:0] out
);

genvar Gi;
generate for(Gi = 0; Gi < 8; Gi = Gi + 1)
begin: loop
	assign out = (in[Gi]) ? Gi : 0;
end
endgenerate


endmodule