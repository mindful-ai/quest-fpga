`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.05.2023 10:12:37
// Design Name: 
// Module Name: counter_4bit
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


module counter_4bit(

        input clock,
        input reset,
        input enable,
        input [3:0] pdata,
        input penable,
        output reg [3:0] count,
        output cc

    );
    
    parameter MAX = 4'b1111;
    
    always@(posedge clock)
    begin
        if(reset)
            count <= 0;
        else if(penable)
            count <= pdata;
        else if(enable)
            count <= count + 1;
        else
            count <= count;
    end
    
    assign cc = (count == MAX);
    
endmodule
