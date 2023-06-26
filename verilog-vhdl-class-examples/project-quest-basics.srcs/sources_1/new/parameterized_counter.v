`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.05.2023 10:20:55
// Design Name: 
// Module Name: parameterized_counter
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


module parameterized_counter(

        input clock,
        input reset,
        input enable,

        output pulse_out

    );
    
    parameter MAX = 10;
    
    reg [31:0] count;
    wire maxcount_reached;
    
    always@(posedge clock)
    begin
        if(reset)
            count <= 0;
        else if(maxcount_reached)
            count <= 0;
        else if(enable)
            count <= count + 1;
        else
            count <= count;
    end
    
    assign maxcount_reached = (count == MAX);
    assign pulse_out = maxcount_reached;
    
endmodule
