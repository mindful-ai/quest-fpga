`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.05.2023 12:31:55
// Design Name: 
// Module Name: sequence_detector
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


module sequence_detector(
        input clock,
        input reset,
        input serialin,
        output seq_detected
    );
    
    
    
    localparam S1 = 0;
    localparam S2 = 1;
    localparam S3 = 2;
    
    reg [1:0] CS, NS;
    reg seqd;
    
    always@(posedge clock or posedge reset)
    begin
        if(reset) CS <= S1;
        else CS <= NS;
    end
    
    always@(*)
    begin
        seqd = 0;
        case(CS) 
            S1: begin
                if(serialin)
                    NS = S2;
                else
                    NS = S1;
            end 
            S2: begin
                if(~serialin)
                    NS = S3;
                else
                    NS = S2;
            end 
            S3: begin
                if(serialin) begin
                    seqd = 1;
                    NS = S2;
                end
                else
                    NS = S1;
            end
            default: NS = S1;
        
        endcase
        
     end
     
     assign seq_detected = seqd;
     
    
endmodule
