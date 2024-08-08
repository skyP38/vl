`define POS_NAN 0
`define POS_ZERO 1
`define POS_NORM 2
`define POS_DENORM 3
`define POS_INF 4


module exp_sum
(
    input   wire [7:0] op1_exp, op2_exp;
    output  wire [9:0] tmp_res;
)

wire bias = 8'b0111_1111;
assign tmp_res <= op1 + op2 - bias;

endmodule


module FMUL32
(
    input  wire  [31:0] op1 ,
    input  wire  [31:0] op2 ,
    input  wire  [1:0]  opc ,
    input  wire  [1:0]  rmode,
    input  wire         clk,
    output wire         val,
    output wire  [31:0] result 
)

wire        op1_sign = op1[31];
wire [7:0]  op1_exp  = op1[30:23];
wire [22:0] op1_mant = op1[22:0];

wire        op2_sign = op2[31];
wire [7:0]  op2_exp  = op2[30:23];
wire [22:0] op2_mant = op2[22:0];


wire [4:0] op_mark1, [4:0] op_mark2;
wire [23:0] mant1,   [23:0] mant2;
wire opc_mark;

wire reg_sign;
wire [7:0] exp;
wire [22:0] mant;
wire res_mark;
wire tmp_res;

op_an operator1 (
    .op_sign    (op1_sign), 
    .op_exp     (op1_exp),
    .op_mant    (op1_mant),
    .op_mark    (op_mark1), 
    .mant       (mant1)
);
op_an operator2 (
    .op_sign    (op2_sign), 
    .op_exp     (op2_exp),
    .op_mant    (op2_mant), 
    .op_mark    (op_mark2), 
    .mant       (mant2)
);

prev_res result (
    .op_sign1   (op_sign1), 
    .op_sign2   (op_sign2), 
    .op_mark1   (.op_mark1), 
    .op_mark2   (op_mark2), 
    .opc_mark   (opc_mark),  
    .reg_sign   (reg_sign), 
    .res_mark   (res_mark) 
);
exp_sum sum (
    .op1        (op1_exp), 
    .op2        (op2_exp), 
    .tmp_res    (tmp_res)
);


wire val;

assign val = ~(opc == 2'h3);


endmodule