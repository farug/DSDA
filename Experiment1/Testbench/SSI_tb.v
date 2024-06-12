`timescale 1ns / 1ps


module Top_module_tb;
    reg     [1:0] IN;
    wire    [7:0] OUT;
    integer       i;
    
    AND   uut0 (.O(OUT[0]), .I1(IN[0]),.I2(IN[1]));
    OR    uut1 (.O(OUT[1]),.I1(IN[0]),.I2(IN[1]));
    NOT   uut2 (.O(OUT[2]),.I(IN[1]));
    NAND  uut3 (.O(OUT[3]),.I1(IN[0]),.I2(IN[1]));
    NOR   uut4 (.O(OUT[4]),.I1(IN[0]),.I2(IN[1]));
    EXOR  uut5 (.O(OUT[5]),.I1(IN[0]),.I2(IN[1]));
    EXNOR uut6 (.O(OUT[6]),.I1(IN[0]),.I2(IN[1]));
    TRI   uut7 (.O(OUT[7]),.I(IN[0]),.E(IN[1]));
    
    initial
    begin
    for (i = 0;i<4 ;i=i+1 ) begin
        IN = i;
        #10;
        if (OUT[0] == (IN[0]&IN[1])) begin
            $display ("AND is correct for %b and output %b", IN , OUT[0]);
        end
        else begin
            $display ("AND is not correct for input %b and output %b ", IN , OUT[0]);
        end
        if (OUT[1] == IN[0]|IN[1]) begin
            $display ("OR is correct for input %b and output %b", IN , OUT[1]);
        end
        else begin
            $display ("OR is not correct for %b and output %b", IN , OUT[1]);
        end
        if (OUT[2] == ~IN[1]) begin
            $display ("NOT is correct for %b and output %b", IN[1] , OUT[2]);
        end
        else begin
            $display ("NOT is not correct for input %b and output %b ", IN[1] , OUT[2]);
        end
        if (OUT[3] == ~(IN[0]&IN[1])) begin
            $display ("NAND is correct for input %b and output %b", IN , OUT[3]);
        end
        else begin
            $display ("NAND is not correct for %b and output %b", IN , OUT[3]);
        end
        if (OUT[4] == ~(IN[0]|IN[1])) begin
            $display ("NOR is correct for %b and output %b", IN , OUT[4]);
        end
        else begin
            $display ("NOR is not correct for input %b and output %b ", IN , OUT[4]);
        end
        if (OUT[5] == IN[0]^IN[1]) begin
            $display ("EXOR is correct for input %b and output %b", IN , OUT[5]);
        end
        else begin
            $display ("EXOR is not correct for %b and output %b", IN , OUT[5]);
        end
        if (OUT[6] == ~(IN[0]^IN[1])) begin
            $display ("EXNOR is correct for input %b and output %b", IN , OUT[6]);
        end
        else begin
            $display ("EXNOR is not correct for %b and output %b", IN , OUT[6]);
        end
        if (OUT[7] == ('bz)) begin
            if (IN[1] == 1'b0) begin
                $display ("TRI Buffer is correct for input %b and enable %b , ouptut %b", IN[0], IN[1], OUT[7]);
            end
            else begin
                $display ("TRI Buffer is not correct for input %b and enable %b , output %b", IN[0], IN[1], OUT[7]);
            end
        end
        else if(OUT[7] == IN[0]) begin
            if (IN[1] == 1'b1) begin
                $display ("TRI Buffer is correct for input %b and enable %b , ouptut %b", IN[0], IN[1], OUT[7]);
            end
            else begin
                $display ("TRI Buffer is not correct for input %b and enable %b , output %b", IN[0], IN[1], OUT[7]);
            end
        end
        #10;
    end
    $finish;
    
    end
endmodule