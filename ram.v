`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2023 01:41:49 PM
// Design Name: 
// Module Name: ram
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ram(
    input wire clk,
    input wire reset,
    input wire [2:0] address,
    input wire write_en,
    input wire [7:0] data_in,
    output reg [7:0] data_out
    );
    
    reg [7:0] mem [0:7];
    
    always @ (posedge clk) begin
        if (reset) begin
            mem[0] = 0;
            mem[1] = 0;
            mem[2] = 0;
            mem[3] = 0;
            mem[4] = 0;
            mem[5] = 0;
            mem[6] = 0;
            mem[7] = 0;
       end
       else begin
        if(write_en)
            mem[address] <=data_in;
        else
            data_out = mem[address];
       end
   end
endmodule
