module op_an
(
    input  wire [31:0] op,
    output wire [4:0] op_mark, 
    output wire [23:0] mant
)

wire h_bit; 

assign op_mark = (|op[30:23] == 0 & |op[22:0] == 0) ? 5'h1 :
                 (|op[30:23] == 0 & |op[22:0] == 1) ? 5'h3 :
                 (&op[30:23] == 1 & |op[22:0] == 1) ? 5'h0 :
                 (&op[30:23] == 1 & |op[22:0] == 0) ? 5'h4 : 5'h2;

assign h_bit = (op_mark == 5'h2) ? 1 : 0;

assign mant = {h_bit, op[22:0]};

endmodule