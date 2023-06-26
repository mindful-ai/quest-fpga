`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.05.2023 10:14:36
// Design Name: 
// Module Name: microarch_project_1
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


module microarch_project_1(
    input clock,
    input reset,
    input enable,
    input [3:0] pdata,
    input pload,
    
    output [3:0] count,
    output cc

    );
    
    wire pulse;
    wire cc_temp;
    
    // Hertz Pulse Generator
    
    parameterized_counter #(.MAX(5)) parameterized_counter_inst(

        .clock(clock),
        .reset(reset),
        .enable(1'b1),

        .pulse_out(pulse)

    );
    
    // Counter
    
    counter_4bit counter_4bit_inst(

        .clock(clock),
        .reset(reset),
        .enable(enable & pulse),
        .pdata(pdata),
        .penable(pload),
        .count(count),
        .cc(cc_temp)

    );
    
    // One Shot Generator
    oneshot_gen oneshot_gen_inst(
        .clock(clock),
        .reset(reset),
        .signalin(cc_temp),
        .oneshot_signal(cc)
    
    );
    
endmodule
