`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2023 10:55:58
// Design Name: 
// Module Name: tb_arch_alu
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


module tb_arch_alu();

    reg [7:0] a, b;
    reg [2:0] op;
    wire [7:0] result;
    real testid;
    integer file;
    event triggerMonitor;

    // DUT
    ALU dut(
        .A(a),
        .B(b),
        .Op(op),
        .R(result)  
    );
    
    // Driver Logic
    task driver;
        input [7:0] x, y;
        input [2:0] xyop;
        begin
            #10;
            a = x;
            b = y;
            op = xyop;
            #10;
        end
    endtask
    
    // Monitor Logic
    reg pass_fail;
    always@(triggerMonitor)
    begin
        comparator(pass_fail);
        if(pass_fail)
            $fdisplay(file, "ID = %.2f | A = %d | B = %d | OP = %d | Output = %d | PASS", testid, a, b, op, result);
        else
            $fdisplay(file, "ID = %.2f | A = %d | B = %d | OP = %d | Output = %d | FAIL", testid, a, b, op, result);
    end
    
    // Controller Logic and test cases
    initial
    begin   
    
        file = $fopen("test_report.mem", "w");
        
        testid = 1.1;
        driver(5, 5, 0);
        -> triggerMonitor;
        #10;
        
        testid = 1.2;
        driver(200, 200, 0);
        -> triggerMonitor;
        
        testid = 2.1;
        driver(5, 3, 1);
        -> triggerMonitor;
        
        testid = 2.2;
        driver(3, 5, 1);
        -> triggerMonitor;
        
        testid = 2.3;
        driver(5, 5, 1);
        -> triggerMonitor;
        
        testid = 2.3;
        driver(0, 0, 1);
        -> triggerMonitor;
        
        $fclose(file);
        
        $stop;
    end
    
    // Comparator Logic and Report Generator
    
    task generateReferenceOutputs;
        input [7:0] a, b;
        input [2:0] op;
        output [7:0] out;
        begin
            case (op)
                0: out = a + b;
                1: out = a - b;
                2: out = ~a;
            endcase
        end
    endtask
    
    
    task comparator;
        output pass_fail;
        reg [7:0] currentResult;
        begin
            generateReferenceOutputs(a, b, op, currentResult);
            if(result == currentResult) 
                pass_fail = 1;
            else
                pass_fail = 0;
        end
     endtask
    
endmodule
