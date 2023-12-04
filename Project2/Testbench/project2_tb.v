`timescale 1ns / 1ps


module project2_tb;
    reg clk,r,x;
    wire y;
    integer i;
    Project2_2 uut(.x(x),.y(y),.clk(clk),.r(r));

    reg [40:0]data;
    reg [40:0]data2;
    initial begin
        clk=1'b0;
    end
    always begin
        clk =~clk;
        #5;
    end
    initial begin
        x=1'b1;
        r=1'b1;
        #100;
        r=1'b0;
        data=27'b111111100100000010111001000;
        data2=27'b111111100100000010111010010;
        for(i=0;i<27;i=i+1)begin
            x=data[i];
            #10;
        end
        r=1'b1;
        #10;
        r=1'b0;
        #10;
        for(i=0;i<27;i=i+1)begin
            x=data[i];
            #10;
        end
        r=1'b1;
        #10;
        r=1'b0;
        for(i=0;i<27;i=i+1)begin
            x=data2[i];
            #10;
            if (i == 4) begin
                r=1'b1;
                #10;
                r=1'b0;
            end
        end
        $finish;
    end
endmodule
