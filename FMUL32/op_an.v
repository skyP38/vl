module op_an
(
    input  wire         op_sign,
    input  wire [7:0]   op_exp,
    input  wire [22:0]  op_mant,
    output wire [4:0]   op_mark, 
    output wire [23:0]  mant
)

wire h_bit; 

assign op_mark[POS_NAN]     = (&op_exp == 1 & |op_mant  == 1);
assign op_mark[POS_ZERO]    = (|op_exp == 0 & |op_mant  == 0);
assign op_mark[POS_NORM]    = (|op_exp == 1 & ~&op_exp  == 1);
assign op_mark[POS_DENORM]  = (|op_exp == 0 & |op_mant  == 1);
assign op_mark[POS_INF]     = (&op_exp == 1 & |op_mant  == 0);

assign h_bit                = (op_mark == 5'b00010) ? 1 : 0;

assign mant                 = {h_bit, op_mant};

endmodule