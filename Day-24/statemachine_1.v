`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.05.2023 10:10:42
// Design Name: 
// Module Name: statemachine_1
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


module statemachine_1(
        input clock,
        input reset,
        input enable,
        
        output [3:0] c1,
        output [3:0] c2,
        output [3:0] c3,
        output [3:0] c4

    );
    
    reg e1, e2, e3, e4;
    
     counter_4bit counter_4bit_inst_1(

        .clock(clock),
        .reset(reset),
        .enable(enable & e1),
        .pdata(4'd0),
        .penable(1'b0),
        .count(c1),
        .cc()

    );
    
     counter_4bit counter_4bit_inst_2(

        .clock(clock),
        .reset(reset),
        .enable(enable & e2),
        .pdata(4'd0),
        .penable(1'b0),
        .count(c2),
        .cc()

    );
    
     counter_4bit counter_4bit_inst_3(

        .clock(clock),
        .reset(reset),
        .enable(enable & e3),
        .pdata(4'd0),
        .penable(1'b0),
        .count(c3),
        .cc()

    );
    
     counter_4bit counter_4bit_inst_4(

        .clock(clock),
        .reset(reset),
        .enable(enable & e4),
        .pdata(4'd0),
        .penable(1'b0),
        .count(c4),
        .cc()

    );
    
    // Coding the statemachine in 3 parts
    
    // Local parameters
    localparam INIT = 3'b000;
    localparam S1   = 3'b001;
    localparam S2   = 3'b010;
    localparam S3   = 3'b011;
    localparam S4   = 3'b100;
    localparam S5   = 3'b101;
    localparam S6   = 3'b110;
    
    // Registers
    reg [2:0] CS, NS;
    
    // Block - 1: Flip Flops
    always@(posedge clock or posedge reset)
    begin
        if(reset)
            CS <= INIT;
        else
            CS <= NS;
    end
    
    
    // Block - 2: Next state combinational logic
    always@(*)
    begin
        case(CS) 
            INIT: 
            begin
                NS = S1;
            end
            S1:
            begin
                NS = S2;
            end
            S2:
            begin
                NS = S3;
            end
            S3:
            begin
                NS = S4;
            end
            S4: 
            begin
                NS = S5;
            end
            S5:
            begin
                NS = S6;
            end
            S6:
            begin
                NS = S1;
            end
            default:
            begin
                NS = INIT;
            end
        endcase
    
    end
    
    
    // Block - 3: Output combinational logic
    always@(*)
    begin
        case(CS)
            INIT: begin
                e1 = 0;
                e2 = 0;
                e3 = 0;
                e4 = 0;
            end
            S1:begin
                e1 = 1;
                e2 = 0;
                e3 = 0;
                e4 = 0;
            end
            S2:begin
                e1 = 0;
                e2 = 1;
                e3 = 0;
                e4 = 0;
            end
            S3:begin
                e1 = 0;
                e2 = 1;
                e3 = 0;
                e4 = 0;
            end
            S4:begin
                e1 = 0;
                e2 = 0;
                e3 = 1;
                e4 = 0;
            end
            S5:begin
                e1 = 0;
                e2 = 0;
                e3 = 1;
                e4 = 0;
            end
            S6:begin
                e1 = 0;
                e2 = 0;
                e3 = 0;
                e4 = 1;
            end
            default:begin
                e1 = 0;
                e2 = 0;
                e3 = 0;
                e4 = 0;
            end
        endcase
    end
    
    ila_0  ila_inst (
        .clk(clock),
        .probe0(c1),
        .probe1(c2),
        .probe2(c3),
        .probe3(c4)
        );
    
endmodule
