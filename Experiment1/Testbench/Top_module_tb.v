`timescale 1ns / 1ps


module Top_module_tb;
    reg [15:0] inp;
    wire [7:0] out;
    integer i;
    
    Top_module uut(.O(out), .IN(inp));
    
    initial
    begin
        // inp1 =0 inp2=0
    inp=16'h00;
    #10 
    // inp1=0 inp2=1
    for (i=0 ; i<14 ; i=i+2 ) begin
        inp[i]=0;inp[i+1]=1;
    end
    #10 
    // inp1=1; inp2=0; also changing not input from 0 to 1
    for (i=0 ; i<14 ; i=i+2 ) begin
        inp[i]=1;inp[i+1]=0;
    end
    inp[14]=1;
    #10 
    inp=16'b1111111111111111;
    #10
    $finish;
    
    end
endmodule