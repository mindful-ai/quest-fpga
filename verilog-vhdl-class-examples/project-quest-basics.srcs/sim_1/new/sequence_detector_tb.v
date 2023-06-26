`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.05.2023 12:48:54
// Design Name: 
// Module Name: sequence_detector_tb
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

`define DELAY 10;
module sequence_detector_tb();

    parameter path = "E:/Purushtoham/project-quest-basics/project-quest-basics.srcs/sim_1/new/testdata.mem";
    parameter results = "results.txt";
    
    
    
    reg [15:0] data = 16'b1011111110101111;
    reg [31:0] data2;
    reg clock, reset, serialin;
    reg [3:0] count, count_ref_overlapping;
    wire seqdetected;
    
    integer file, i;
    reg [31:0] filedata [7:0];
    
    event e; // event declaration
    

    sequence_detector sequence_detector_inst(
            .clock(clock),
            .reset(reset),
            .serialin(serialin),
            .seq_detected(seqdetected)
        );
        
  task drive_dut;
    input [31:0] data;
    integer i, file;
    begin
        file = $fopen(results, "a");
        $fdisplay(file,"Pushing data = %h", data);
        #100;
        for(i = 0; i <= 31;i = i + 1)
            @(posedge clock) serialin = data[i];
        #100;
        $fdisplay(file,"Actual count   = %d", count);
        $fdisplay(file,"Refernce count = %d", count_ref_overlapping);
        $fdisplay(file,"-------------------------------------");
        if(count == count_ref_overlapping)
            $fdisplay(file,"RESULT     : PASS      ");
        else
            $fdisplay(file,"RESULT     : FAIL      ");
        $fdisplay(file,"\n\n");
        $fclose(file);
    end
  endtask
  
  function [3:0] get_seqcount_overlapping;
    input [31:0] data;
    integer n, bits, i;
    reg [3:0] count;
    begin
        bits = 32 - 3;
        count = 0;
        for(i = 0; i < bits; i = i + 1) begin   
            if(data[2:0] == 3'b101) count = count + 1;
            data = data >> 1;
        end
        get_seqcount_overlapping = count;
    end
  endfunction
  
  task completed_message;
    begin
        $display("Testing completed");
        $display("Refer to the file named : %s", results);
    end
  endtask
  
  task reset_dut;
    begin
        reset = 1;
        #100;
        reset = 0;
        #100;
        #DELAY;

    end
  endtask
        
        
  initial
  begin
    clock = 0;
    forever #10 clock = ~clock;
  end
  
  initial
  begin
    /*
    file = $fopen(path, "r");
    $readmemh(file, filedata);
    $fclose(file);
    for(i = 0; i <= 7; i = i + 1) begin
        $display("%d\n",filedata[i]);
        reset_dut();
        data2 = filedata[i];
        count_ref_overlapping = get_seqcount_overlapping(data2);
        drive_dut(data2);
        #100;
    end
    */
    
   
    repeat(10) begin
        reset_dut();
        data2 = $random;
        //data2 = 32'h55555555;
        count_ref_overlapping = get_seqcount_overlapping(data2);
        drive_dut(data2);
        #100;
    end 
    -> e; // event trigger
    #10;
    $stop;
  end
  
  always@(posedge clock or posedge reset)
  begin
    if(reset)
        count <= 0;
    else if(seqdetected)
        count <= count + 1;
    else
        count <= count;
  end 
  
  // event capture
  always@(e)
    completed_message();
  
endmodule
