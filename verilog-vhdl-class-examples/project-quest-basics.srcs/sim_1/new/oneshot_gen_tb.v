`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.05.2023 10:59:05
// Design Name: 
// Module Name: oneshot_gen_tb
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


module oneshot_gen_tb();

    reg clock, reset, signalin;
    wire oneshot_signal;

    oneshot_gen oneshot_gen_inst(
        .clock(clock),
        .reset(reset),
        .signalin(signalin),
        .oneshot_signal(oneshot_signal)
    
        );
        
    initial
    begin
        clock = 0;
        forever #10 clock = ~clock;
    end
    
    initial 
    begin
    
        // initialization
        reset = 1;
        signalin = 0;
        #100 reset = 0;
        #107 signalin = 1;
        #400 signalin = 0;
        #100 $stop;
        
    end
endmodule
