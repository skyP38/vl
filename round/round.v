module round
#(
        parameter DATA_W = 32
)
(
        input  wire [1          : 0] mode,
        input  wire [DATA_W - 1 : 0] datain,
        output wire [23         : 0] dataout
);


wire rounding_bit = datain[DATA_W - 1 - 23];
wire even_bit = datain[DATA_W - 23];

assign dataout =   
                (mode == 3                          ) ? datain[DATA_W - 1 - 9 : DATA_W - 1 - 23] + datain[DATA_W - 1]: //-inf
                (mode == 2                          ) ? datain[DATA_W - 1 - 9 : DATA_W - 1 - 23] + datain[DATA_W - 1]: //+inf
                (mode == 1                          ) ? datain[DATA_W - 1 - 9 : DATA_W - 1 - 23]                     : //0
                (mode == 0 & rounding_bit & even_bit) ? datain[DATA_W - 1 - 9 : DATA_W - 1 - 23] + 1'b1              : //near even
                                                        datain[DATA_W - 1 - 9 : DATA_W - 1 - 23];                      // default

endmodule