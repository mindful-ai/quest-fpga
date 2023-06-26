`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.05.2023 11:58:00
// Design Name: 
// Module Name: counter_4bit_tb
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


module counter_4bit_tb();

    // Output signals to observe
    wire [3:0] count;
    wire cc;
    
    // Input signals to drive
    reg clock, reset, enable, penable;
    reg [3:0] pdata;
    
    // Design Under Test
    counter_4bit counter_4bit_inst(

        .clock(clock),
        .reset(reset),
        .enable(enable),
        .pdata(pdata),
        .penable(penable),
        .count(count),
        .cc(cc)

    );
    
    // driver block for clock
    initial
    begin
        clock = 0;
        forever #10 clock = ~clock;
    end
    
    /*
    always
    begin
        clock = 0;
        #10;
        clock = 1;
        #10;
    end
    
    */
    
    
    // driver block for other inputs
    initial
    begin
        // test-case -> initialization
        reset = 1;
        enable = 0;
        penable = 0;
        pdata = 4'h5;
        #100;
        
        // test-case -> drop reset and enable counter for 500 ns
        reset = 0;
        #100;
        enable = 1;
        #500;
        enable = 0;
        #100;
        
        // test - case -> load parallel value and run for 200 ns
        penable = 1;
        #40;
        penable = 0;
        #100;
        enable = 1;
        #200;
        enable = 0;
        #100;
        
        // Stop the simulation
        $stop;
    
    end
    
endmodule
