`timescale 10ns / 1ps



module Top_module(SW,BTN,LED,CAT,AN,DP);
        input [7:0]SW; 
        input [3:0]BTN;
        output [7:0]LED;
        output [6:0]CAT;
        output [3:0]AN;
        output DP;
        wire [15:0]OX;
        wire HIGH;
        assign AN = 4'b1110;//for decoder
        assign DP=OX[15];//for decoder
        assign CAT=OX[14:8];//for decoder
        assign LED=OX[7:0];//for decoder
        assign HIGH=1'b1;//for decoder
        Decoder decoder1(.IN(SW[3:0]),.O(OX),.EN(HIGH));
        //ENCODER encoder1(.IN(SW[3:0]),.O(LED[1:0]),.V(LED[7]));
        //MUX mux1(.IN(SW[3:0]),.S(BTN[1:0]),.O(LED[0]));
        //MUX1 mux2(.IN(SW[3:0]),.S(BTN[1:0]),.O(LED[0]));
        //DEMUX demux1(.IN(SW[0]),.S(BTN[1:0]),.O(LED[3:0]));
endmodule
