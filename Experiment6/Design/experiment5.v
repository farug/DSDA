`timescale 1ns / 1ps

module SR_Latch (
    input S,R,
    output Q,Qn
);
    wire [1:0]OX;
    NAND nand1(.I1(S),.I2(OX[1]),.O(OX[0]));
    NAND nand2(.I1(R),.I2(OX[0]),.O(OX[1]));

    assign Q=OX[0];
    assign Qn=OX[1];
endmodule

module DFF (
    input D,Clk,
    output Q,Qn
);
    wire [4:0]OX;

    NOT not1(.I(D),.O(OX[0])); //Dnot

    NAND nand1(.I1(D),.I2(Clk),.O(OX[1]));
    NAND nand2(.I1(OX[1]),.I2(OX[2]),.O(OX[3])); //OX[2]=Qn , OX[3]=Q
    
    NAND nand3(.I1(OX[0]),.I2(Clk),.O(OX[4]));
    NAND nand4(.I1(OX[3]),.I2(OX[4]),.O(OX[2]));

    assign Qn=OX[2];
    assign Q=OX[3];

endmodule

module MSDF (
    input D,Clock,
    output Q,Qn,Qm
);
    wire [2:0]OX;
    //wire Qm;

    NOT not1(.I(Clock),.O(OX[0])); //Clocknot
    DFF dff1(.D(D),.Clk(Clock),.Q(Qm));
    DFF dff2(.D(Qm),.Clk(OX[0]),.Q(OX[1]),.Qn(OX[2]));

    assign Q=OX[1];
    assign Qn=OX[2];


endmodule

module DFFB(
    input D,Clk,
    output Q,Qn
);
    reg FF;
    always @(posedge Clk) begin
        FF=D;
    end
    assign Q=FF;
    assign Qn=~FF;
endmodule

module bit8Register(
    input [7:0]IN,
    input Clk,
    input Clear,
    output [7:0]OUT
);
    reg [7:0]FF;
    always@(posedge Clk)
    begin
        FF<=IN;
    end
    always @(Clear) begin
        FF <= FF & {~Clear,~Clear,~Clear,~Clear,~Clear,~Clear,~Clear,~Clear};
    end

    assign OUT = FF ;

endmodule

module BRAM(
    input clka,
    input wea,
    input [3:0]addra,
    output [7:0]douta 
);
    reg clka1;
    integer count;
    integer count_next;
    wire [7:0]dina;
    assign dina=8'b10101010;

    /*always@(posedge clka)
    begin
        if(count == 2)
        begin
            count_next<=0;
            clka1<= 1'b1;
        end
        else
        begin
        count_next=count+1;
        count=count_next;
        end
    end*/
    blk_mem_gen_0 BRAM(.clka(clka),.wea(wea),.addra(addra),.douta(douta),.dina(dina));

endmodule