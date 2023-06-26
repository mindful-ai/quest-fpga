module shifter_4bit(
        input clock,
        input reset,
        input enable,
        input leftright,
        input serialin,
        
        input [3:0] pdatain,
        input pload,
        
        output [3:0] pdataout,
        output serialout
    );
    
    reg [3:0] shreg;
    
    
    always@(negedge clock or negedge reset)
    begin
        if(~reset)
            shreg <= 0;
        else if(pload)
            shreg <= pdatain;
        else if(enable)
            if(leftright)
                shreg <= {shreg[2:0], serialin};
            else
                shreg <= {serialin, shreg[3:1]};
        else
            shreg <= shreg;
    end
    
    assign pdataout = shreg;
    assign serialout = (leftright) ? shreg[3] : shreg[0];
        
   
endmodule