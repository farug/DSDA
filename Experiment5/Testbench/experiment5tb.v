`timescale 1ns / 1ps

module experiment5tb;

    reg Clk;
    reg [7:0]IN;
    reg Clear;
    wire [7:0]OUT;

    bit8Register uut(.Clk(Clk),.IN(IN),.Clear(Clear),.OUT(OUT)); //IN,Clk,Clear

    initial
    begin

    IN=8'b11110110;
    Clk=1'b1;
    Clear=1'b0;
    #10
    Clear=1'b1;
    #10
    IN=8'b01010101;
    Clk=1'b1;
    Clear=1'b1;
    #10
    Clear=1'b0;
    Clk=1'b0;
    #10
    Clk=1'b1;
    #10
    $finish;
    end
endmodule
