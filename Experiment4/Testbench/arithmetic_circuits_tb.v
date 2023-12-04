`timescale 1ns / 1ps

module Top_module_tb;
    reg [3:0]X;
    reg [3:0]Y;
    wire [3:0]S;
    wire Cout;
    reg Ci;
    wire C3;
    wire C4;
    wire V;


    ASV uut(.X(X),.Y(Y),.Ci(Ci),.V(V),.Cout(Cout),.S(S),.C3(C3),.C4(C4));
    
    initial
    begin
        Ci=1'b0;
        X=4'b0001;
        Y=4'b0010;
        #10
        X=4'b0001;
        Y=4'b0011;
        #10
        X=4'b0001;
        Y=4'b1111;
        #10
        Ci=1'b1;
        X=4'b0111;
        Y=4'b1000;
        #10
        X=4'b1110;
        Y=4'b1101;
        #10
        X=4'b1100;
        Y=4'b1100;
        #10
        X=4'b1101;
        Y=4'b0010;
        #10
        X=4'b1100;
        Y=4'b0101;
        #10
        $finish;
    end
endmodule

[DRC LUTLP-1] Combinatorial Loop Alert: 1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. 
The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint
 on any one of the nets in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets <myHier/myNet>]'. One net in the loop
  is Qn_OBUF. Please evaluate your design. The cells in the loop are: Qn_OBUF_inst_i_1.
