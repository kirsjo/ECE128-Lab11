`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2023 01:43:05 PM
// Design Name: 
// Module Name: main_tb
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


module main_tb(    );
    
    
    reg clk;
    reg rst;
    reg [2:0]adr1; 
    reg [2:0] adr2;
    reg [2:0] adr_ram;
    wire [7:0] result;
    wire [3:0] st_out;
    wire [7:0] product;
    
    main uut (.clk(clk), .rst(rst),.adr1(adr1), .adr2(adr2), .adr_ram(adr_ram), .result(result), .st_out(st_out), .product(product));
    
    always begin
        #10 clk = ~clk;
    end
    
    initial begin
   clk = 0;
   rst = 1;
    #20 rst=0; adr1=1; adr2=2;adr_ram=5;
    #200 adr1=2; adr2=5;adr_ram=7;
    #200 adr1=4; adr2=6;adr_ram=1;
    end
    
    
endmodule
