`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.05.2023 09:01:20
// Design Name: 
// Module Name: operators
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


module operators(
    input clock, reset,
    input serialin,
    output reg serialout

    );
    
    reg a, b, c; 
    
    always@(posedge clock)
        if(reset) begin
            a <= 0;
            b <= 0;
            c <= 0;
            serialout <= 0;
        end
        else begin
            a <= serialin;
            b <= a;
            c <= b;
            serialout <= c;
        end
endmodule
