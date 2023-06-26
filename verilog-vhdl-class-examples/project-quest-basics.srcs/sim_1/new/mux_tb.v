`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.05.2023 10:28:26
// Design Name: 
// Module Name: mux_tb
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


module mux_tb();

    reg x, y, z;
    wire mux_out;

    // Instance of the design to test
    mux_2_1 mux_instance(
        .a(x),
        .b(y),
        .s(z),
        .out(mux_out)
    );
    
    // Signal generator logic - supposed to drive the instance inputs
    initial
    begin
        x = 0;
        y = 1;
        z = 0;
        #100; // produces 100 ns delay in simulation
        x = 0;
        y = 1;
        z = 1;
        #100;
        $stop; // indicates the verilog simulator to stop the simulation
    
    end


endmodule
