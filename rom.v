module rom(
    input [2:0] address,
    output reg [3:0] data
);

always @ (address)begin
    case(address)
        3'd0: data = 4'b0011;
        3'd1: data = 4'b0110;
        3'd2: data = 4'b1100;
        3'd3: data = 4'b1001;
        3'd4: data = 4'b0001;
        3'd5: data = 4'b0010;
        3'd6: data = 4'b0100;
        3'd7: data = 4'b1000;
    endcase
  end
endmodule