`timescale 1ns / 1ps

module with_SSI (
    input a,b,c,d,
    output f0,f1,f2,f3
);
    wire [7:0]OX;
    
    // for f0
    AND and4(.O(f0),.I1(b),.I2(d));
    
    //for f1
    AND and2(.O(OX[0]),.I1(a),.I2(d));
    AND and3(.O(OX[1]),.I1(b),.I2(c));
    EXOR exor2(.O(f1),.I1(OX[0]),.I2(OX[1]));

    // for f2
    AND and5(.O(OX[2]),.I1(a),.I2(c));
    NOT not2(.O(OX[3]),.I(b));  // b not
    NOT not3(.O(OX[4]),.I(d));  // d not
    OR or2(.O(OX[5]),.I1(OX[3]),.I2(OX[4]));
    AND and6(.O(f2),.I1(OX[2]),.I2(OX[5]));

    // for f3
    AND and7(.O(OX[6]),.I1(a),.I2(b));
    AND and8(.O(OX[7]),.I1(c),.I2(d));
    AND and9(.O(f3),.I1(OX[6]),.I2(OX[7]));
endmodule

module with_decoder(
    input a,b,c,d,
    output f0,f1,f2,f3
);
    wire EN;
    assign EN=1'b1;
    wire [3:0]IN;
    assign IN= {a,b,c,d};
    wire [15:0]OUT;
    wire [7:0]OX;


    Decoder decoder2(.EN(EN),.IN(IN),.O(OUT));
    assign f3=OUT[15];
    
    //f2
    OR or2(.I1(OUT[10]),.I2(OUT[11]),.O(OX[0]));
    OR or3(.I1(OX[0]),.I2(OUT[14]),.O(f2));

    //f1
    OR or4(.I1(OUT[6]),.I2(OUT[7]),.O(OX[1]));
    OR or5(.I1(OUT[9]),.I2(OX[1]),.O(OX[2]));
    OR or6(.I1(OUT[11]),.I2(OX[2]),.O(OX[3]));
    OR or7(.I1(OUT[11]),.I2(OX[3]),.O(OX[4]));
    OR or8(.I1(OUT[13]),.I2(OX[4]),.O(OX[5]));
    OR or9(.I1(OUT[14]),.I2(OX[5]),.O(f1));

    //f0
    OR or10(.I1(OUT[5]),.I2(OUT[7]),.O(OX[6]));
    OR or11(.I1(OUT[13]),.I2(OX[6]),.O(OX[7]));
    OR or12(.I1(OUT[15]),.I2(OX[7]),.O(f0));
    endmodule


module with_MUX (
    input a,b,c,d,
    output f0,f1,f2,f3
);
    integer i;
    wire [4:0]OX;
    wire [3:0]F0;
    wire [1:0]A;
    wire [3:0]F1;
    wire [3:0]F2;
    wire [3:0]F3;
    wire bn,dn;
    assign A={a,c};
    // f0
    AND and2(.I1(b),.I2(d),.O(OX[0]));
    assign F0={OX[0],OX[0],OX[0],OX[0]}; //assign F0={3'b000,OX[0]};
    MUX mux1(.IN(F0),.S(A),.O(f0));

    //f1
    EXOR exor2(.I1(b),.I2(d),.O(OX[1]));
    assign F1={1'b0,b,d,OX[1]};
    MUX mux2(.IN(F1),.S(A),.O(f1));

    //f2
    NOT not1(.I(b),.O(bn));
    NOT not2(.I(d),.O(dn));
    AND and3(.I1(b),.I2(dn),.O(OX[2]));
    OR or1(.I1(bn),.I2(OX[2]),.O(OX[3]));
    assign F2={3'b000,OX[3]};
    MUX mux3(.IN(F2),.S(A),.O(f2));

    //f3
    AND and4(.I1(b),.I2(d),.O(OX[4]));
    assign F3= {OX[4],3'b000};
    MUX mux4(.IN(F3),.S(A),.O(f3));
    endmodule