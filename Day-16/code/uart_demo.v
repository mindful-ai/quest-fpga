`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2023 14:24:46
// Design Name: 
// Module Name: uart_demo
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


module uart_demo(
    input clock,
    input reset,
    input uart_rx,
    input start_tx,
    output uart_tx,
    output transmit_done
    
    );
    
    uart16 uart16_dut(  

        .mclock(clock),
        .mreset(reset),
        .datain(16'hFFAA),
        .start_tx(start_tx),
        .serial_out(uart_tx),
        .dataout(),
        .dataout_valid(),
        .transmit_done(transmit_done)

    );
    
    
endmodule
