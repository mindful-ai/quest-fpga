`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.05.2023 12:58:28
// Design Name: 
// Module Name: binary_to_onehot_tb
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


module binary_to_onehot_tb();
     
    reg [1:0] bin;
    wire [3:0] onehot;
    integer i;
    
    binary_to_onehot binary_to_onehot_inst(
        .binary(bin),
        .onehot(onehot)

    );
    
    initial
    begin
        for(i = 0; i < 4; i = i + 1)
        begin
            bin = i;
            #100;
        end 
         
        $stop;
    end

endmodule
