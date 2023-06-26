`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.05.2023 12:53:20
// Design Name: 
// Module Name: binary_to_onehot
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


module binary_to_onehot(
        input [1:0] binary,
        output [3:0] onehot

    );
    
    reg [3:0] onehot;
    
    always@(*)
    begin
        case(binary)
            2'b00:
            begin
                onehot = 4'b0001;
                
            end 
            
            2'b01:
            begin
                onehot = 4'b0010;
                
            end
            
            2'b10:
            begin
                onehot = 4'b0100;
                
            end
            
            2'b11:
            begin
                onehot = 4'b1000;
                
            end 
            
            default: onehot = 4'b0000;
        endcase
    end
    
endmodule
