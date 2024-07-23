module LIFO_eth
#(
    parameter   DATA_W      =   2,
    parameter   LIFO_SIZE   =   6
)
(
        input  wire clk,
        input  wire reset,
        input  wire write,
        input  wire read,
        input  wire [DATA_W - 1:0] datain,
        output reg  [DATA_W - 1:0] dataout,
        output wire val,
        output wire full
);

reg [LIFO_SIZE      -1  :0] buffer [DATA_W - 1:0];
reg [$clog2(LIFO_SIZE)-1:0] cntr;

genvar Gi;

/*
0 0 0 0 0 0
1 0 0 0 0 0
1 2 0 0 0 0
1 2 3 0 0 0
1 2 0 0 0 0

0 0 0 0 0 0
1 0 0 0 0 0
2 1 0 0 0 0
3 2 1 0 0 0
2 1 0 0 0 0
*/

wire    read_perm   =   read & val;
wire    write_perm  =   write&~full;
wire    rd_wr_perm  =   read & write & val;

always @(posedge clk)
if(reset)
    cntr    <=  'h0;
else begin
    if (full)
        cntr    <=  rd_wr_perm  ?   cntr        :
                    read        ?   cntr - 1'b1 :   cntr;
    else
        cntr    <=  rd_wr_perm  ?   cntr        :
                    write       ?   cntr + 1'b1 :
                    read_perm   ?   cntr - 1'b1 :   cntr;
end

assign  val         =   (cntr != 'h0);
assign  full        =   (cntr == LIFO_SIZE);
assign  data_out    =   buffer[0];

generate
for(Gi=0; Gi<LIFO_SIZE; Gi=Gi+1) begin: buffer_gen
    always @(posedge clk)
    if(~reset) begin
        if(Gi==0)
            buffer[0]   <=  rd_wr_perm  ? datain       :
                            read_perm   ? buffer[1]     :
                            write_perm  ? datain       :   buffer[0];
        else if (Gi != LIFO_SIZE-1)
            buffer[Gi]  <=  rd_wr_perm  ? buffer[Gi]    :
                            read_perm   ? buffer[Gi+1]  :
                            write_perm  ? buffer[Gi-1]  :   buffer[Gi];
        else // Gi == LIFO_SIZE-1
            buffer[Gi]  <=  rd_wr_perm  ? buffer[Gi]    :
                            write_perm  ? buffer[Gi-1]  :   buffer[Gi];
    end
end      
endgenerate

endmodule
