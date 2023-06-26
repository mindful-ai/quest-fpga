`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.05.2023 09:46:44
// Design Name: 
// Module Name: blocking_nonblocking_demo
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


module blocking_nonblocking_demo(
        input clock,
        input reset,
        input serialin,
        output reg serialout
    );
    
        reg a, b, c;
        /*
        // Shift register using blocking operators
        // We expect a shift register with 4 flip flops - 4 bit shift register
        always@(posedge clock)
        begin
            if(reset) begin
                a = 0;
                b = 0;
                c = 0;
                serialout = 0;
            end
            else begin
                a = serialin;
                b = a;
                c = b;
                serialout = c;
            end 
        end
        */
        
        // Shift register using non-blocking operators
        // We expect a shift register with 4 flip flops - 4 bit shift register
        always@(posedge clock)
        begin
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
        end
endmodule
