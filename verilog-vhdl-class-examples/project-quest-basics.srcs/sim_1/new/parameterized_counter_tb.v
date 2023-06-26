`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.05.2023 10:26:10
// Design Name: 
// Module Name: parameterized_counter_tb
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


module parameterized_counter_tb();

    reg clock, reset, enable;
    wire pulse;

    // DUT
    parameterized_counter #(.MAX(4)) parameterized_counter_inst(

        .clock(clock),
        .reset(reset),
        .enable(enable),

        .pulse_out(pulse)

    );
    
    // Test patterns
    
    // driver block for clock
    initial
    begin
        clock = 0;
        forever #10 clock = ~clock;
    end
    
    // testing
    initial
    begin
        reset = 1;
        enable = 0;
        #100 reset = 0;
        #100 enable = 1;
        #2000 enable = 0;
        #100 $stop;
    end
    
endmodule
