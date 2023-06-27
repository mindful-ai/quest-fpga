`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.02.2023 14:30:54
// Design Name: 
// Module Name: uart16
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


module uart16(  

        input mclock,
        input mreset,
        input [15:0] datain,
        input start_tx,
        output serial_out,
        output [7:0] dataout,
        output dataout_valid,
        output transmit_done

);
        
        //parameter BAUD = 5;
        //parameter BAUD = 163*2;
        parameter BAUD = 406;

        // UART signals

		wire        baud_clk;
		wire [7:0]  rec_data;
		wire        rec_ready;
		wire        rxd_new_byte;
		reg  [2:0]  rec_ready_sync;
		reg  [15:0] data_to_transmit;
		
		// ------------------------------------------------------
		// BAUD RATE GENERATOR 
		// ------------------------------------------------------
								 
		baud baud (
							 .sys_clk(mclock), 
							 .sys_rst_l(!mreset), 
							 .baud_clk(baud_clk), 
							 .baud_rate_div(BAUD)
					  );
					  
		assign ref_baud_clock = baud_clk;
		
		// ------------------------------------------------------
		// UART Receiver
		// ------------------------------------------------------

		u_rec u_rec (
							 .sys_rst_l(!mreset), 
							 .sys_clk(baud_clk), 
							 .uart_dataH(uart_rx), 
							 .rec_dataH(rec_data), 
							 .rec_readyH(rec_ready)
						 );
						 
		// ------------------------------------------------------
		// Data register
		// ------------------------------------------------------
						 
		always@(posedge mclock)
		begin
		  if(mreset) data_to_transmit <= 0;
		  else data_to_transmit <= datain;
		end 
		
		// rec_ready is active low
		// produce one shot of this signal to sample the data in to the buffer

		always@(posedge baud_clk or posedge mreset)
				if(mreset) rec_ready_sync <= 0;
				else rec_ready_sync <= { rec_ready_sync[1:0], rec_ready };

		assign rxd_new_byte = ~rec_ready_sync[2] & rec_ready_sync[1];
		
		assign dataout =   rxd_new_byte;
		assign dataout_valid = rec_data;
		
		// ------------------------------------------------------
		// One shot generator
		// ------------------------------------------------------
		reg [1:0] delay_reg;
		wire oneshot_start_tx;
		
		always@(posedge baud_clk or posedge mreset)
		begin
		  if(mreset) delay_reg <= 0;
		  else delay_reg <= {delay_reg[0],  start_tx}; 
		end
		
		assign oneshot_start_tx = delay_reg[1] & ~delay_reg[0];
		
		// ------------------------------------------------------
		// Data transmitter
		// ------------------------------------------------------
			
			
		reg load_data_H;
		reg load_data_L;
		reg xmitH;
		reg [7:0] xmit_data_H;
		reg tx_complete;
		
		parameter BEGIN = 0,
		          CHECK = 1,
		          SAMPLE_LSB = 2,
		          SEND_LSB = 3,
		          WAIT_LSB_COMPLETE = 4,
		          SAMPLE_MSB = 5,
		          SEND_MSB = 6,
		          WAIT_MSB_COMPLETE =7;
		          
		reg [3:0] NS, CS;
		
        always@(posedge baud_clk or posedge mreset)
        begin
            if(mreset)
                CS <= BEGIN;
            else
                CS <= NS;
        end
        
        always@(*)
        begin
        
	  
            load_data_H     = 0;
            load_data_L     = 0;
            xmitH           = 0;
            tx_complete     = 0;
            
            case(CS) 
                BEGIN:
                begin
                    if(oneshot_start_tx) NS = CHECK;
                    else NS = BEGIN;
                end
                CHECK:
                begin
                    if(xmit_doneH) NS = SAMPLE_LSB;
                    else NS = CHECK;
                end
                SAMPLE_LSB:
                begin
                    load_data_L = 1;
                    NS = SEND_LSB;
                end
                SEND_LSB:
                begin
                    xmitH = 1;
                    NS = WAIT_LSB_COMPLETE;
                end
                WAIT_LSB_COMPLETE:
                begin
                    if(xmit_doneH) NS = SAMPLE_MSB;
                    else NS = WAIT_LSB_COMPLETE;
                end
                SAMPLE_MSB:
                begin
                    load_data_H = 1;
                    NS = SEND_MSB;
                end
                SEND_MSB:
                begin
                    xmitH = 1;
                    NS = WAIT_MSB_COMPLETE;
                end
                WAIT_MSB_COMPLETE:
                begin
                    if(xmit_doneH) begin
                        tx_complete = 1;
                        NS = BEGIN;
                    end
                    else NS = WAIT_MSB_COMPLETE;
                end
                
            endcase
            
            
            
        end
            
           
        
            always@(posedge baud_clk)
            begin
                if(mreset)
                    xmit_data_H <= 0;
                else if(load_data_H)
                    xmit_data_H <= data_to_transmit[15:8];
                else if(load_data_L)
                    xmit_data_H <= data_to_transmit[7:0];
                else
                    xmit_data_H <= xmit_data_H;
            end
        
            u_xmit u_xmit (
            .sys_clk(baud_clk), 
            .sys_rst_l(~mreset), 
             
            .uart_xmitH(serial_out), 
             
            .xmitH(xmitH), 
            .xmit_dataH(xmit_data_H), 
             
            .xmit_doneH(xmit_doneH)
            );
            
          assign transmit_done = tx_complete;
		
						 
endmodule
