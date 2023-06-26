`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.05.2023 10:55:23
// Design Name: 
// Module Name: oneshot_gen
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


module oneshot_gen(
    input clock,
    input reset,
    input signalin,
    output oneshot_signal

    );
    
    reg [1:0] sh;
    
    always@(posedge clock or posedge reset)
    begin
        if(reset) sh <= 0;
        else sh <= {sh[0], signalin};
    end
    
    assign oneshot_signal = ~sh[1] & sh[0];
        
endmodule
