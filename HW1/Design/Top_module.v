`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/13/2022 01:10:23 PM
// Design Name: 
// Module Name: Top_module
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


module Top_module(O,IN

    );
    output [7:0]O;
    input [15:0]IN;
    
    AND GATE1(.O(O[0]),.I1(IN[0]),.I2(IN[1]));
    OR GATE2(.O(O[1]),.I1(IN[2]),.I2(IN[3]));
    
    NAND GATE4(.O(O[2]),.I1(IN[4]),.I2(IN[5]));
    NOR GATE5(.O(O[3]),.I1(IN[6]),.I2(IN[7]));
    EXOR GATE6(.O(O[4]),.I1(IN[8]),.I2(IN[9]));
    EXNOR GATE7(.O(O[5]),.I1(IN[10]),.I2(IN[11]));
    TRI GATE8(.O(O[6]),.I(IN[12]),.E(IN[13]));

    NOT GATE3(.O(O[7]),.I(IN[14]));

endmodule
