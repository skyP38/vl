module VectorSum #(
    parameter DATA_W = 10,
    parameter POS_W = $clog2(DATA_W)
)(
    input wire [DATA_W-1:0] data,
    output wire [POS_W:0] sum
);


function [POS_W:0] summa;
    input [DATA_W-1:0] data;
    integer i;
    begin
	sum = 0;
    	for (i = 0; i < DATA_W; i = i + 1) begin
            sum = sum + data[i];
    	end
    end
endfunction

assign sum = summa(data);
endmodule