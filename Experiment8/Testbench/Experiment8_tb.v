`timescale 1ns / 1ps
module tb();
    reg clk,reset,conv_run;
    reg signed [71:0] kernel;
    wire [1023:0] data_outl;

    TOP uut(.clk(clk),.reset(reset),.kernel(kernel),.data_outl(data_outl),.conv_run(conv_run));

    integer f;
    integer i;
    integer l;
    integer k;


    initial begin
        k=0;
        l=0;
        f = $fopen("output.txt","w");
        reset = 1'b1;
        clk=1'b1;
        #2
        reset = 1'b0;
        clk=1'b0;
        conv_run=1'b1;
        kernel = 72'b111111111111111111111111111111110000100011111111111111111111111111111111;
        for(i=0;i<410;i=i+1)begin
            clk = ~clk;
            #2;
            l=l+1;
            if(l >19)begin
                if(k!=2)begin
                k=k+1;
            end
            else if(k==2)begin
                $fwrite(f,"%H\n",data_outl);
                k=0;
            end
            end
            
            
        end
            
        $fclose(f);
        $finish;
    end

endmodule
