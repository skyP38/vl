module lifo #(
    parameter DATA_W = 10,
    parameter LIFO_SIZE = 6 
) (
    input write,
    input [DATA_W-1:0] datain,
    input read,
    input clock,
    input reset,
    output [DATA_W-1:0] dataout,
    output val,
    output reg full
);
    reg [DATA_W-1:0] buffer [0:LIFO_SIZE-1];
    reg [LIFO_SIZE-1:0] ptr;

    always @(posedge clock) begin
        if (reset) begin
            ptr <= 0;
            val <= 0;
        end else begin
	    val <= 1;
            if (write) begin
               buffer[ptr] <= datain;
               ptr <= ptr + 1;
            end
            if (read) begin
                ptr <= ptr - 1;
            end
        end
    end
    
    assign dataout = buffer[ptr];
    assign full = (ptr == LIFO_SIZE - 1); 
   
endmodule