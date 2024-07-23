module LIFO #(
    parameter DATA_W = 10,
    parameter LIFO_SIZE = 6 
) (
    input wire clk,
    input wire reset,
    input wire write,
    input wire read,
    input wire [DATA_W - 1:0] datain,
    output reg [DATA_W - 1:0] dataout,
    output wire val,
    output wire full
);
    reg [LIFO_SIZE-1:0] buffer [DATA_W-1:0];
    reg [$clog2(LIFO_SIZE)-1:0] ptr;

    always @(posedge clk) begin
        if (reset) begin
            ptr <= 0;
        end else begin
	    if (read & !write & val) begin
                ptr <= ptr - 1;
            end
            else if (!read & write & !full) begin
               buffer[ptr] <= datain;
               ptr <= ptr + 1;
            end
            
        end
    end
    
    assign dataout = buffer[ptr];
    assign full = (ptr == LIFO_SIZE); 
    assign val = (ptr != 'h0);   
endmodule