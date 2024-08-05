module prev_res 
(
    input wire [31:0] op1, [31:0] op2,
    input wire [4:0] op_mark1, [4:0] op_mark2,
    input wire op_sign1, op_sign2,
    input wire [1:0] opc_mark, 
    output wire res_sign,
    output wire [7:0] exp,
    output wire [22:0] mant,
    output wire res_mark, 
    output wire res_val
)

assign res_sign = (opc_mark == 5'h0) & ~(op_sign1 == op_sign2) |
                  (opc_mark == 5'h1) &  (op_sign1 == op_sign2);

assign exp = op1[30:23] + op2[30:23];

assign mant = op1[22:0] * op2[22:0];

assign res_val = (&exp[7:0] == 1) | (op_mark1[0] == 0 | op_mark2[0] == 0);

assign res_mark = res_val & ~(|mant[22:0] == 0);

endmodule