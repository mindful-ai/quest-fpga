`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.05.2023 12:15:23
// Design Name: 
// Module Name: dff_microarchitecture
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


module dff_microarchitecture(
    input d,
    input clk,
    input rst,
    output x

    );
    
    reg q1, q2;
    
    // First dff
    always@(posedge clk)
    begin
        if(rst == 1)
        begin
            q1 <= 0;
        end
        else
        begin
            q1 <= d;
        end 
    end 
    
    // Second dff
    always@(posedge clk)
    begin
        if(rst == 1)
        begin
            q2 <= 0;
        end
        else
        begin
            q2 <= q1;
        end 
    end 
    
    // and gate
    assign x = q1 & q2;
    
endmodule
