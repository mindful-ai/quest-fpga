`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.05.2023 10:15:13
// Design Name: 
// Module Name: mux_2_1
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


module mux_2_1(
    input a,
    input b,
    input s,
    output o
    );
    
    assign o = s ? b : a;
    
endmodule

module tb();

    mux4_1 dut(
         .A(),
         .B(),
         .C(),
         .D(),
         .S0(),
         .S1(),
         .Z()
    );

endmodule