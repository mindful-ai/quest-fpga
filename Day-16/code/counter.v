`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2023 13:22:11
// Design Name: 
// Module Name: counter
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


module counter(
    input clock,
    input reset,
    input enable,
    output reg [3:0] counter

    );
    
      parameter HZPCOUNT = 125000000;
      
      reg [31:0] hzpcounter;
      wire hzpulse;
      
      always@(posedge clock or posedge reset)
      begin
        if(reset) hzpcounter <= 0;
        else if (hzpulse)  hzpcounter <= 0;
        else if(enable) hzpcounter <= hzpcounter + 1;
        else hzpcounter <= hzpcounter;
        
      end 
      
      assign hzpulse = (hzpcounter == HZPCOUNT);
    
      always@(posedge clock or posedge reset)
      begin
        if(reset) counter <= 0;
        else if(hzpulse) counter <= counter + 1;
        else counter <= counter;
      end 
      
      
endmodule
