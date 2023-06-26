`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.05.2023 12:46:59
// Design Name: 
// Module Name: shifter_4bit_v2
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


module shifter_4bit_v2(
        input clock,
        input reset,
        input enable,
        input leftright,
        input serialin,
        input select,
        
        input [3:0] pdatain,
        input pload,
        
        output [3:0] pdataout,
        output serialout
    );

    wire muxout_serialin;
    reg muxout_serialin2;

    // Multiplexer Component
    mux_2_1 mux_2_1_inst(
        .a(1'b0),
        .b(serialin),
        .s(select),
        .out(muxout_serialin)
    );
    
    /*
    mux_2_1 mux_2_1_inst2(
        .a(1'b1),
        .b(serialin),
        .s(select),
        .out(muxout_serialin2)
    );
    */
    
    always@(*)
    begin
        if(select)
            muxout_serialin2 = serialin;
        else
            muxout_serialin2 = 1'b1;
    end
    
    assign newoutput = muxout_serialin & muxout_serialin2;
    
    
    // Shifter Component
    shifter_4bit shifter_4bit_inst(
        .clock(clock),
        .reset(reset),
        .enable(enable),
        .leftright(leftright),
        .serialin(newoutput),
        
        .pdatain(pdatain),
        .pload(pload),
        
        .pdataout(pdataout),
        .serialout(serialout)
    );
   
endmodule
