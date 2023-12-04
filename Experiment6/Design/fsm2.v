`timescale 1ns / 1ps


module FSM2(
        input x,
        input clk,
        output z
    );
    reg q0=1'b0, q1=1'b0, q2=1'b0 ;
    wire Q0,Q1,Q2;
    always@(posedge clk)
    begin
        q0 <= Q0;
        q1 <= Q1;
        q2 <= Q2;
    end

    assign a= (x^q2);
    assign Q2 = (~x);
    assign Q1 = (a&(q0|q1));
    assign Q0 = (a&(~q1)&(~q0));
    assign z=(a&q1);
    
endmodule