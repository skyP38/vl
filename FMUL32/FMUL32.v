module exp_sum
(
    input reg op1, op2;
    output reg sum;
)

always @*
    sum <= op1 + op2;

endmodule


module FMUL32
(
    input  reg  [31:0] op1 ,
    input  reg  [31:0] op2 ,
    input  reg  [1:0] opc  ,
    input  reg  [1:0] rmode,
    input  wire clk,
    output wire val,
    output reg  [31:0] result 
)

wire [4:0] op_mark1, [4:0] op_mark2;
wire [23:0] mant1,   [23:0] mant2;
wire op_sign1, op_sign2;
wire opc_mark;

wire reg_sign;
wire [7:0] exp;
wire [22:0] mant;
wire res_mark;
wire res_val;
reg  exp_sum;

op_an(.op(op1), .op_mark(op_mark1), .mant(mant1));
op_an(.op(op2), .op_mark(op_mark2), .mant(mant2));

prev_res(.op1(op1), .op2(op2), .op_mark1(.op_mark1), .op_mark2(op_mark2), .op_sign1(op_sign1), .op_sign2(op_sign2), .opc_mark(opc_mark),  .reg_sign(reg_sign), .exp(exp), .mant(mant), .res_mark(res_mark), .res_val(res_val));
exp_sum(.op1(op1), .op2(op2), .sum(exp_sum));



endmodule