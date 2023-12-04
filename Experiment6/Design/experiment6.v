`timescale 1ns / 1ps


module FSM1(
        input x,
        input clk,
        output z
    );
    reg q0=1'b1, q1=1'b1, q2=1'b1 , q3=1'b1,  q4=1'b1, q5=1'b1;
    wire Q0,Q1,Q2,Q3,Q4,Q5;
    always@(posedge clk)
    begin
        q0 <= Q0;
        q1 <= Q1;
        q2 <= Q2;
        q3 <= Q3;
        q4 <= Q4;
        q5 <= Q5;
        //z <= ((~x)&q2)|(q5&x);
    end

    assign Q5 = x&(q4|q5);
    assign Q4 = x&q3;
    assign Q3 = x&(q0|q1|q2);
    assign Q2 = (~x)&(q1|q2);
    assign Q1 = (~x)&q0;
    assign Q0 = (~x)&(q3|q4|q5);
    assign z = ((~x)&q2)|(q5&x);
    
endmodule