`timescale 1ns / 1ps



module experiment6tb;

    reg clk;
    wire z;
    reg x;
    reg [31:0]values;
    reg [9:0]values2;
    
    
    FSM2 uut(.x(x),.clk(clk),.z(z));
    integer i;
    initial
    begin

        clk=1'b0;
        values = 32'b01001100011100001111000001111100;
        values2 = 10'b0000111111;
        i=31;
        while(i>=0)
        begin
            clk = ~clk;
            x=values[i];
            #5
            clk <=~clk;
            #5     
            i = i-1;   
        end
            clk = ~clk;
            x=values2[9];
            #5
            clk <=~clk;
            #5     
            clk = ~clk;
            x=values2[8];
            #5
            clk <=~clk;
            #5     
            clk = ~clk;
            x=values2[7];
            #5
            clk <=~clk;
            #5     
            clk = ~clk;
            x=values2[6];
            #5
            clk <=~clk;
            #5     
            clk = ~clk;
            x=values2[5];
            #5
            clk <=~clk;
            #5     
            clk = ~clk;
            x=values2[4];
            #5
            clk <=~clk;
            #5     
            clk = ~clk;
            x=values2[3];
            #5
            clk <=~clk;
            #5     
            clk = ~clk;
            x=values2[2];
            #5
            clk <=~clk;
            #5     
            clk = ~clk;
            x=values2[1];
            #5
            clk <=~clk;
            #5     
            clk = ~clk;
            x=values2[0];
            #5
            clk <=~clk;
            #5     
    $finish;
    end
endmodule