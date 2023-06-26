module shifter_4bit_tb();

    reg clock, reset, enable, lr, sin, pload;
    reg [3:0] pin;
    
    wire [3:0] pout;
    wire sout;


    // Creating an instance
    
    shifter_4bit shifter_4bit_inst(
        .clock(clock),
        .reset(reset),
        .enable(enable),
        .leftright(lr),
        .serialin(sin),
        
        .pdatain(pin),
        .pload(pload),
        
        .pdataout(pout),
        .serialout(sout)
    );

    initial
    begin
        clock = 0;
        forever #10 clock = ~clock;
    end
    
    initial
    begin
    
        // initialization
        reset = 0; // Active low reset
        enable = 0;
        lr = 0;
        sin = 0;
        pin = 4'b1010;
        pload = 0;
        // release the reset
        #100;
        reset = 1;
        // load parallel data
        #100;
        @(negedge clock) pload = 1;
        @(negedge clock) pload = 0;
        #100;
        $display($time, "Current data in shift register = %d", pout);
        // enable the shift register
        @(negedge clock) enable = 1;
        repeat(3)
            @(negedge clock);
        @(negedge clock) enable = 0;
         
        #100;
        $display($time, "Current data in shift register = %d", pout);
        
        // ------------------- by the end of this you should
        // ------------------- shift register being reset to all 0's
        
        // Class assignment
        // 5 more test scenarios
        
        
        
    
    
    end

endmodule