`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.07.2023 12:07:41
// Design Name: 
// Module Name: cdc_sequence_detection
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


module cdc_sequence_detection();

    reg [15:0] data = 16'b1011111110101111;
    reg [31:0] data2;
    reg clock, reset, serialin;
    reg [3:0] count, count_ref_overlapping;
    reg input_seq_valid;
    wire seqdetected;
    
    task drive_dut;
        input [31:0] data;
        integer i;
    begin
        #100;
        
        for(i = 0; i <= 31;i = i + 1)
            @(posedge clock) serialin = data[i];
            input_seq_valid = 1;
        @(posedge clock) input_seq_valid = 0;
        #100;
    end
    endtask
    
    initial
    begin
        clock = 0;
        forever #5 clock = ~clock;
    end
  
    initial
    begin
        reset = 1;
        #100 reset = 0;
        #100 drive_dut(data);
    end
    
    sequence_detector sequence_detector_inst(
            .clock(clock),
            .reset(reset),
            .serialin(serialin),
            .seq_detected(seqdetected)
        );
        
    // ************************** DOMAIN CROSSING *********************** //

    reg [15:0] shreg;
    reg [1:0] ff;
    wire seq_valid_pos, seq_valid_neg;
    reg clock2, reset2;
    reg [3:0] elongator;
    
    always@(posedge clock)
        if(reset) ff <= 0;
        else ff <= {ff[0], input_seq_valid};
        
    assign seq_valid_pos = ~ff[1] & ff[0]; 
    assign seq_valid_neg = ff[1] & ~ff[0]; 
    
    always@(posedge clock)
        if(reset) elongator <= 0;
        else elongator <= {elongator[2:0], seq_valid_neg};
    
    assign elongated_seq_valid_neg = |elongator;
    
    always@(posedge clock)
    begin
        if(reset) shreg <= 0;
        else if(seq_valid_pos) shreg <= 0;
        else shreg <= {shreg[14:0], seqdetected};
    end
    
    
    initial
    begin
        clock2 = 0;
        forever #12 clock2 = ~clock2;
    end
        
    reg [15:0] shreg2;
    reg [2:0] ff2;
    reg [3:0] counter2;
    
    // cannot use seq_valid_neg directly
    // because it is in faster clock domain
    
    // Double synchronization
    always@(posedge clock2)
        if(reset2) ff2 <= 0;
        else ff2 <= {ff2[1:0], elongated_seq_valid_neg};
        
    // One shot generation
    assign transfer_seqfound_data = ~ff2[2] & ff2[1];
     
    always@(posedge clock2)
    begin
        if(reset2) shreg2 <= 0;
        else if(transfer_seqfound_data) shreg2 <= shreg;
        else shreg2 <= {shreg2[14:0], 1'b0};
    end
    
    
    always@(posedge clock2)
    begin
        if(reset2) counter2 <= 0;
        else if(transfer_seqfound_data) counter2 <= 0;
        else if(shreg2[15]) counter2 <= counter2 + 1;
        else counter2 <= counter2;
    end
       
       
    reg [3:0] prevcount;
    
    always@(posedge clock2)
    begin
        if(reset2) prevcount <= 0;
        else if(transfer_seqfound_data) prevcount <= counter2;
        else prevcount <= prevcount;
    end
    
endmodule


