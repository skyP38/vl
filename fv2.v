module decoder_3to8_v2 (
  input wire a0, a1, a2,
  output reg [7:0] Y
);

  always @(*) begin
    if (!a0 & !a1 & !a2)
	Y = 8'b00000001;
    else if (!a0 & !a1 & a2) 
	Y = 8'b00000010;
    else if (!a0 & a1 & !a2) 
        Y = 8'b00000100;
    else if (!a0 & a1 & a2) 
        Y = 8'b00001000;
    else if (a0 & !a1 & !a2) 
        Y = 8'b00010000;
    else if (a0 & !a1 & a2) 
        Y = 8'b00100000;
    else if (a0 & a1 & !a2) 
        Y = 8'b01000000;
    else if (a0 & a1 & a2) 
        Y = 8'b10000000;
  end

endmodule