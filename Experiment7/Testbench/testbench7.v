`timescale 1ns / 1ps



module tbMULTSsigned;
    reg [7:0]A;
    reg [7:0]X;
    wire [15:0]P;

    MULTS_signed uut(.A(A),.X(X),.result(P));

    initial
    begin
        A=8'b10101010;
        X=8'b00101010;
        #10
        A=8'b11111111;
        X=8'b11111111;
        #10
        A=8'b00101011;
        X=8'b00101111;
        #10
        A=8'b10101010;
        X=8'b11111010;
        #10
        $finish;
        end

endmodule


module testbench8;
    reg [23:0]data;
    reg [23:0]weight;
    reg clk;
    reg reset;
    wire [19:0]result;

    MAC uut(.clk(clk),.reset(reset),.data(data),.weight(weight),.result(result));

    initial
    begin
        reset=1'b0;
        clk=1'b0;
        data=24'b000000000000000000000100;
        weight=24'b111111111111111111111111;
        #10
        clk=1'b1;
        #10
        clk=1'b0;
        #10
        clk=1'b1;
        #10
        clk=1'b0;
        #10
        clk=1'b1;
        #10
        data=24'b000000000000000000000100;
        clk=1'b0;
        #10
        clk=1'b1;
        #10
        clk=1'b0;
        #10
        clk=1'b1;
        #10
        clk=1'b0;
        #10
        clk=1'b1;
        #10
        data=24'b000000000000000000000010;
        clk=1'b0;
        #10
        clk=1'b1;
        #10
        clk=1'b0;
        #10
        clk=1'b1;
        #10
        clk=1'b0;
        #10
        clk=1'b1;
        #10
        data=24'b000000000000000000000000;
        clk=1'b0;
        #10
        clk=1'b1;
        #10
        clk=1'b0;
        #10
        clk=1'b1;
        #10
        clk=1'b0;
        #10
        clk=1'b1;
        #10
        data=24'b000000000000000000000111;
        weight=24'b111111111111111111111000;
        clk=1'b0;
        #10
        clk=1'b1;
        #10
        clk=1'b0;
        #10
        clk=1'b1;
        #10
        clk=1'b0;
        #10
        clk=1'b1;
        #10
        data=24'b000000000000000000000001;
        weight=24'b111111111111111111111111;
        clk=1'b0;
        #10
        clk=1'b1;
        #10
        clk=1'b0;
        #10
        clk=1'b1;
        #10
        clk=1'b0;
        #10
        clk=1'b1;
        #10
        data=24'b000000000000000000000000;
        clk=1'b0;
        #10
        clk=1'b1;
        #10
        clk=1'b0;
        #10
        clk=1'b1;
        #10
        clk=1'b0;
        #10
        clk=1'b1;
        #10
        data=24'b000000000000000000000100;
        clk=1'b0;
        #10
        clk=1'b1;
        #10
        clk=1'b0;
        #10
        clk=1'b1;
        #10
        clk=1'b0;
        #10
        clk=1'b1;
        #10
        data=24'b000000000000000000000000;
        clk=1'b0;
        #10
        clk=1'b1;
        #10
        clk=1'b0;
        #10
        clk=1'b1;
        #10
        clk=1'b0;
        #10
        clk=1'b1;
        #10
        data=24'b000000100000000000000000;
        clk=1'b0;
        #10
        clk=1'b1;
        #10
        clk=1'b0;
        #10
        clk=1'b1;
        reset=1'b1;
        #10

        
        $finish;
    end

endmodule


module tbMULTSS;
    reg [7:0]A;
    reg [7:0]B;
    wire [15:0]R;

    MULTS_signed uut(.A(A),.X(B),.result(R));
    initial
    begin
    A=8'b00011111;
    B=8'b11111111;
    #10
    $finish;
    end
endmodule
module tbcon;
    reg signed [199:0]f;
    reg signed [71:0]w;
    reg clk;
    wire [19:0]result_33,result_32,result_31,result_23,result_22,result_21,result_13,result_12,result_11;

    D2C uut(.f(f),.w(w),.clk(clk),.result_33(result_33),.result_32(result_32),.result_31(result_31),.result_23(result_23),.result_22(result_22),.result_21(result_21),.result_13(result_13),.result_12(result_12),.result_11(result_11));

    initial
    begin
        f={8'd128,8'd128,8'd128,8'd128,8'd128,8'd255,8'd255,8'd128,8'd255,8'd255,8'd255,8'd255,8'd128,8'd255,8'd255,8'd255,8'd255,8'd128,8'd255,8'd255,8'd255,8'd255,8'd128,8'd255,8'd255};
        w={-8'd1,-8'd1,-8'd1,-8'd1,8'd8,-8'd1,-8'd1,-8'd1,-8'd1};
        clk=1'b0;
        #10
        clk=1'b1;
        #10
        clk=1'b0;
        #10
        $finish;

    end


endmodule
/*module tbCON;

    reg [4:0][4:0]f[7:0];
    reg [2:0][2:0]w;
    reg clk;
    wire [2:0][2:0]Y;

    2DC uut(.clk(clk),.f(f),.w(w),.result(Y));
    integer i,j;
    initial
    begin
        f = {8'd128,8'd128,8'd128,8'd128,8'd128;8'd255,8'd255,8'd128,8'd255,8'd255;8'd255,8'd255,8'd128,8'd255,8'd255;8'd255,8'd255,8'd128,8'd255,8'd255};
        w = {_8'd1,_8'd1,_8'd1;_8'd1,8'd8,_8'd1;_8'd1,_8'd1,_8'd1};
    end
endmodule*/