`timescale 1ns / 1ps


module Decoder(IN , O, EN);  
        input [3:0]IN;
        input EN;
        output reg [15:0]O;
        always @(*)
            begin
                if(EN==1'b1)
                begin
                    case (IN)
                        4'b0000:O=16'b0000000000000001;
                        4'b0001:O=16'b0000000000000010;
                        4'b0010:O=16'b0000000000000100;
                        4'b0011:O=16'b0000000000001000;
                        4'b0100:O=16'b0000000000010000;
                        4'b0101:O=16'b0000000000100000;
                        4'b0110:O=16'b0000000001000000;
                        4'b0111:O=16'b0000000010000000;
                        4'b1000:O=16'b0000000100000000;
                        4'b1001:O=16'b0000001000000000;
                        4'b1010:O=16'b0000010000000000;
                        4'b1011:O=16'b0000100000000000;
                        4'b1100:O=16'b0001000000000000;
                        4'b1101:O=16'b0010000000000000;
                        4'b1110:O=16'b0100000000000000;
                        4'b1111:O=16'b1000000000000000;
                    endcase
                end
                else
                O=16'h00;
            end

endmodule

module ENCODER (IN,O,V);
        input [3:0]IN;
        output [1:0]O;
        output V;

        assign O[0]=((~IN[2])&IN[1])|IN[3];
        assign O[1]=IN[2]|IN[3];
        assign V=IN[0]|IN[1]|IN[2]|IN[3];
endmodule

module ENCODER1 (IN,O,V);
        input [3:0]IN;
        output reg [1:0]O;
        output reg V;

        always @(*)
        begin
            case(IN)
                    4'b0000: begin O=2'b00;V=1'b0; end
                    4'b0001: begin O=2'b00;V=1'b1; end
                    4'b0010: begin O=2'b01;V=1'b1; end
                    4'b0100: begin O=2'b10;V=1'b1; end
                    4'b1000: begin O=2'b11;V=1'b1; end
        
                    default:
                    begin O=2'bxx;V=1'b0; end
       endcase 
        end
endmodule

module MUX (IN,S,O);
        input [3:0]IN;
        input [1:0]S;
        output O;
        assign O= (IN[0] & ~S[1] & ~S[0]) |
                (IN[1] & ~S[1] & S[0]) |
                (IN[2] & S[1] & ~S[0]) |
                (IN[3] & S[1] & S[0]);
endmodule

module MUX1 (IN,S,O);
        input [3:0]IN;
        input [1:0]S;
        output reg O;
        always @(*)
        begin
            case(S)
            2'b00:O=IN[0];
            2'b01:O=IN[1];
            2'b10:O=IN[2];
            2'b11:O=IN[3];
        endcase
        end
endmodule


module DEMUX (IN,S,O);
        input IN;
        input [1:0]S;
        output [3:0]O;
        wire [3:0]OX;
        wire [3:0]N;
        //least significant 00
        NOT not2(.O(N[0]),.I(S[0]));
        NOT not3(.O(N[1]),.I(S[1]));
        AND and1(.O(OX[0]),.I1(N[0]),.I2(N[1]));
        TRI tri5(.O(O[0]),.E(OX[0]),.I(IN));
        //01
        NOT not4(.O(N[2]),.I(S[1]));
        AND and2(.O(OX[1]),.I1(S[0]),.I2(N[2]));
        TRI tri2(.O(O[1]),.E(OX[1]),.I(IN));
        //10
        NOT not5(.O(N[3]),.I(S[0]));
        AND and3(.O(OX[2]),.I1(N[3]),.I2(S[1]));
        TRI tri3(.O(O[2]),.E(OX[2]),.I(IN));
        //11
        AND and4(.O(OX[3]),.I1(S[0]),.I2(S[1]));
        TRI tri4(.O(O[3]),.E(OX[3]),.I(IN));

endmodule