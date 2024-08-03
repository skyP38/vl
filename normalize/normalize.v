module normalize
#(
        parameter DATA_W = 8
)
(
        input  wire [DATA_W - 1 : 0] vector,
        output wire [DATA_W - 1 : 0] out
);


wire [$clog2(DATA_W) : 0] cnt [DATA_W - 1 : 0];

genvar Gi;
generate for (Gi = 0; Gi < DATA_W; Gi = Gi + 1)
begin: loop
        if (Gi == 0) 
                assign cnt[Gi] = !(vector[DATA_W - 1] == 1);
        else 
                assign cnt[Gi] = ((cnt[Gi - 1] == 1) & (vector[DATA_W - 1 - Gi] == 1)) ? Gi : cnt[Gi - 1]; 
end
endgenerate

assign out = vector << cnt[DATA_W - 1];

endmodule