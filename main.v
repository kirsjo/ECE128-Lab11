`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2023 01:33:54 PM
// Design Name: 
// Module Name: main
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


module main(
    input clk,
    input rst,
    input [2:0]adr1, 
    input [2:0] adr2,
    input [2:0] adr_ram,
    output [7:0] product,
    output [7:0] result,
    output [3:0] st_out);
    
    wire [3:0] d, a, b;
    wire w_rf;
    wire  w_ram;
    wire sa, sb, da;
    wire [2:0] adr;

    
rom rom1 (adr, d);
cu cu1(.clk(clk), .reset(rst), .w_rf(w_rf), .adr1(adr1), .adr2(adr2), .w_ram(w_ram), .adr (adr), .DA (da),.SA(sa),.SB(sb), .st_out(st_out));
rf rf1(.A(a), .B (b), .SA(sa), .SB(sb), .D(d), .DA (da), .W(w_rf), .rst(rst), .clk(clk)); 
multiplier mult(.a(a),.b(b),.p(product)); 
ram ram11(.clk(clk), .reset(rst), .address(adr_ram), .write_en(w_ram), .data_in(product), .data_out(result));
endmodule
