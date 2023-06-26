`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.05.2023 11:09:23
// Design Name: 
// Module Name: statemachine_1_tb
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


module statemachine_1_tb();

 reg clock, reset, enable;
 wire [3:0] c1, c2, c3, c4;
 
 statemachine_1 statemachine_1(
        .clock(clock),
        .reset(reset),
        .enable(enable),
        
        .c1(c1),
        .c2(c2),
        .c3(c3),
        .c4(c4)

    );
    
  initial
  begin
    clock = 0;
    forever #10 clock = ~clock;
  end
  
  initial
  begin
    reset = 1;
    enable = 0;
    #100 reset = 0;
    #100 enable = 1;
    #200 enable = 0;
    $stop;
  end
endmodule
