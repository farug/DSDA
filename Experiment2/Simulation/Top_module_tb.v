`timescale 1ns / 1ps


module Top_module_tb;
    reg inp;
    reg [1:0]sel;
    //reg [1:0] sel;
    //wire [7:0] out; // for encoder and decoder
    wire [3:0]out;


    Top_module uut(.SW(inp),.BTN(sel),.LED(out));
    initial
    begin
        //inp = 1 sel = 00
        inp=1'b1;
        sel=2'b00;
        #10
        sel=2'b01;
        #10
        sel=2'b10;
        #10
        sel=2'b11;
        #10
        $finish;
    end
endmodule

    //Top_module uut(.SW(inp), .DP(out[15]),.CAT(out[14:8]),.LED(out[7:0])); //for decoder
    
    //Top_module uut(.SW(inp), .DP(out[15]),.CAT(out[14:8]),.LED(out[7:0]));//for encoder
    //Top_module uut(.SW(inp),.BTN(sel) , .LED(out));//for mux
    /*initial //for mux
    begin
        // inp = 0101 sel = 00
        inp = 4'b0101;
        sel = 2'b00;
        #10
        // inp = 1010 sel =00
        inp = 4'b1010;
        sel = 2'b00;
        #10
        // inp = 1010 sel =01
        inp = 4'b1010;
        sel = 2'b01;
        #10
        // inp =1011 sel = 10
        inp = 4'b1011;
        sel = 2'b10;
        #10
        // inp = 1011 sel =11
        inp = 4'b1011;
        sel = 2'b11;*/
//        #10
//        $finish;
//    end
//endmodule

   /* initial // for encoder and decoder
    begin
    // inp = 0000
    inp=4'b0000;
    #10 
    // inp = 0001
    inp=4'b0001;
    #10 
    // inp = 0010
    inp=4'b0010;
    #10
    // inp = 0011
    inp=4'b0011;
    #10 
    // inp = 0100
    inp=4'b0100;
    #10
    // inp = 0101
    inp=4'b0101;
    #10
    // inp = 0110
    inp=4'b0110;
    #10
    // inp = 0111
    inp=4'b0111;
    #10
    // inp = 1000
    inp = 4'b1000;
    #10
    // inp = 1001
    inp = 4'b1001;
    #10
    // inp = 1010
    inp = 4'b1010;
    #10
    // inp = 1011
    inp = 4'b1011;
    #10
    // inp = 1100
    inp = 4'b1100;
    #10
    // inp = 1101
    inp =4'b1101;
    #10
    // inp = 1110
    inp= 4'b1110;
    #10
    // inp = 1111
    inp = 4'b1111;
    #10
    $finish;
    
    end*/
//endmodule