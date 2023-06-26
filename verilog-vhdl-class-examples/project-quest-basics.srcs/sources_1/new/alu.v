`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2023 08:50:37
// Design Name: 
// Module Name: alu
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

/*

Analysis of Specifications of the ALU ->
    A  -> input (8)
    B  -> input (8)
    Op -> input (3)
    R  -> Final Output (8)
                Op -> Operation
                 0 -> addition
                 1 -> subtraction
                 2 -> NOT 
                 3 -> NAND   
                 4 -> NOR                 
                 5 -> AND  
                 6 -> OR     
                 7 -> XOR  
*/

module ALU(
        A,
        B,
        Op,
        R   
    );
    
    //inputs,outputs and internal variables declared here
    input [7:0] A,B;
    input [2:0] Op;
    output [7:0] R;
    wire [7:0] Reg1,Reg2;
    reg [7:0] Reg3;
    
    //Assign A and B to internal variables for doing operations
    assign Reg1 = A;
    assign Reg2 = B;
    //Assign the output 
    assign R = Reg3;

    //Always block with inputs in the sensitivity list.
    always @(Op or Reg1 or Reg2)
    begin
        case (Op)
             0 : Reg3 = Reg1 + Reg2;  //addition
             1 : Reg3 = Reg1 - Reg2; //subtraction
             2 : Reg3 = ~Reg1;  //NOT gate
             3 : Reg3 = ~(Reg1 & Reg2); //NAND gate 
             4 : Reg3 = ~(Reg1 | Reg2); //NOR gate               
             5 : Reg3 = Reg1 & Reg2;  //AND gate
             6 : Reg3 = Reg1 | Reg2;  //OR gate    
             7 : Reg3 = Reg1 ^ Reg2; //XOR gate  
        endcase 
    end
    
endmodule
