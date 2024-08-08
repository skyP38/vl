module prev_res 
(
    input   wire       op1_sign, op2_sign,
    input   wire [4:0] op_mark1, op_mark2,
    input   wire [1:0] opc_mark, 
    output  wire       res_sign,
    output  wire [4:0] res_mark
)

assign res_sign = (opc_mark == 5'b00000) & ~(op1_sign == op2_sign) |
                  (opc_mark == 5'b00001) &  (op1_sign == op2_sign);

assign res_mark[POS_NAN]     = (op1_mark[POS_NAN]  == 1 | op2_mark[POS_NAN]  == 1 |
                                op1_mark(POS_ZERO] == 1 & op2_mark[POS_INF]  == 1 |
                                op1_mark(POS_INF]  == 1 & op2_mark[POS_ZEOR] == 1 );
assign res_mark[POS_ZERO]    = (op1_mark[POS_ZERO] == 1 | op2_mark[POS_ZERO] == 1);
//assign res_mark[POS_NORM]    = (|op_exp == 1 & ~&op_exp  == 1);
//assign res_mark[POS_DENORM]  = (|op_exp == 0 & |op_mant  == 1);
assign res_mark[POS_INF]     = (op1_mark[POS_INF] == 1 | op2_mark[POS_INF]  == 1);

endmodule