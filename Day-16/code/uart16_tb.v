
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.02.2023 15:45:00
// Design Name: 
// Module Name: uart16_tb
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


module uart16_tb;

        reg mclock;
        reg mreset;
        reg [15:0] datain;
        reg start_tx;
        wire serial_out;
        wire [7:0] dataout;
        wire dataout_valid;
        wire transmit_done;


    uart16 uart16(  

        .mclock(mclock),
        .mreset(mreset),
        .datain(datain),
        .start_tx(start_tx),
        .serial_out(serial_out),
        .dataout(dataout),
        .dataout_valid(dataout_valid),
        .transmit_done(transmit_done)

    );
    
    initial
    begin
        mclock = 0;
        forever #10 mclock = ~mclock;
    end 
    
    initial
    begin
    
        mreset = 1;
        datain = 0;
        start_tx = 0;
        
        #1000;
        mreset = 0;
        
        datain = 16'hAAAA;
        start_tx = 1;
        @(negedge transmit_done) start_tx = 0;
        @(posedge transmit_done);
        
        #1000;
        
        datain = 16'h00A5;
        start_tx = 1;
        @(negedge transmit_done) start_tx = 0;
        @(posedge transmit_done);
        
        #1000;
        
        datain = 16'hA500;
        start_tx = 1;
        @(negedge transmit_done) start_tx = 0;
        @(posedge transmit_done);
        
        #1000;
        
        datain = 16'h0A05;
        start_tx = 1;
        @(negedge transmit_done) start_tx = 0;
        @(posedge transmit_done);
        
        #1000;
        
        datain = 16'h5555;
        start_tx = 1;
        @(negedge transmit_done) start_tx = 0;
        @(posedge transmit_done);
        
        #1000;
        
        $stop;
        
    end
    
        
endmodule
