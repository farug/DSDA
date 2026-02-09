`timescale 1ns / 1ps


module MULTS(
    input [7:0]A,
    input [7:0]X,
    output [15:0]result
    );
    wire [15:0] PP0,PP1,PP2,PP3,PP4,PP5,PP6,PP7;
    wire [15:0] sum1,sum2,sum3,sum4,sum5,sum6,sum7;

    assign PP0 = {X[0],X[0],X[0],X[0],X[0],X[0],X[0],X[0]} & A;
    assign PP1 = ({X[1],X[1],X[1],X[1],X[1],X[1],X[1],X[1]} & A)<<1;
    assign PP2 = ({X[2],X[2],X[2],X[2],X[2],X[2],X[2],X[2]} & A)<<2;
    assign PP3 = ({X[3],X[3],X[3],X[3],X[3],X[3],X[3],X[3]} & A)<<3;
    assign PP4 = ({X[4],X[4],X[4],X[4],X[4],X[4],X[4],X[4]} & A)<<4;
    assign PP5 = ({X[5],X[5],X[5],X[5],X[5],X[5],X[5],X[5]} & A)<<5;
    assign PP6 = ({X[6],X[6],X[6],X[6],X[6],X[6],X[6],X[6]} & A)<<6;
    assign PP7 = ({X[7],X[7],X[7],X[7],X[7],X[7],X[7],X[7]} & A)<<7;


    //1st stage
    CLA16 cla1 (.a(PP0),.b(PP1),.cin(1'b0),.sum(sum1));
    CLA16 cla2 (.a(PP2),.b(PP3),.cin(1'b0),.sum(sum2));

    CLA16 cla3(.a(PP4),.b(PP5),.cin(1'b0),.sum(sum3));
    CLA16 cla4(.a(PP6),.b(PP7),.cin(1'b0),.sum(sum4));


    //2nd stage
    CLA16 cla5(.a(sum1),.b(sum2),.cin(1'b0),.sum(sum5));
    CLA16 cla6(.a(sum3),.b(sum4),.cin(1'b0),.sum(sum6));


    //3rd stage
    CLA16 cla7(.a(sum6),.b(sum5),.cin(1'b0),.sum(sum7));

    assign result = sum7;
    
endmodule
