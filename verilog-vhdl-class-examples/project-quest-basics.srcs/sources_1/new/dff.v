`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.05.2023 12:00:05
// Design Name: 
// Module Name: dff
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


module dff(
    input d,
    input clk,
    input rst,
    output reg q

    );
    
    
    always@(posedge clk)
    begin
        if(rst == 1)
        begin
            q <= 0;
        end
        else
        begin
            q <= d;
        end 
    end 
    
endmodule
