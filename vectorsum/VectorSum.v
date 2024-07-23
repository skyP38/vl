module VectorSum #(
    parameter DATA_W = 10,
    parameter POS_W = $clog2(DATA_W)
)(
    input wire [DATA_W-1:0] data,
    output wire [POS_W:0] sum
);

wire [POS_W-1:0] temp [DATA_W-1:0];

genvar Gi;
generate for (Gi = 0; Gi < DATA_W; Gi = Gi + 1)
begin: loop
        if (Gi == 0) 
            assign temp[Gi] = 'h0;
        else 
            assign temp[Gi] = temp[Gi - 1] + data[Gi -1];
end
endgenerate

assign sum = temp[DATA_W-1];

endmodule