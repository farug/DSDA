`timescale 1ns / 1ps


//module project2(input r,x,clk,
//                output y
//    );
//    reg q0=1'b0,q1=1'b0,q2=1'b0,q3=1'b0;
//    wire Q0,Q1,Q2,Q3;
//    wire yp;
//    wire ContA,ContB;
//    reg [1:0] Acount=2'b00,Bcount=2'b00;
//    always @(posedge clk) begin
//        q0 <= Q0;
//        q1 <= Q1;
//        q2 <= Q2;
//        q3 <= Q3;
//        Acount <= Acount+ContA;
//        Bcount <= Bcount+ContB;
//    end
//    assign Q0=((~q2)&q1&(~q0)&(~x))|(q2&(~q1)&(~q0)&x)|(q1&q0&x)&(~r);
//    assign Q1=((~x)&q2)|((~x)&(~q0)&q1)|(x&(~q0)&q1&q2)&(~r);
//    assign Q2=(~x)|(q0)|((~q1)&q2)|(q1&(~q2))&(~r);
//    assign Q3=((~k)&(~r)&q3)|(k&(~r));
    
//    assign k=(Acount[1]|Bcount[1]);

//    assign yp=((~x)&q1&(~q2))|((~x)&q0&q1);
//    assign y = (yp|q3)&(~r);

//    assign ContA=(~x)&q1&(~q2);
//    assign ContB=(~x)&q0&q1;
//endmodule

//module project2.1(
//    input r,x,clk,
//    output y
//);
//    reg q0=1'b0,q1=1'b0,q2=1'b0,q3=1'b0;
//    wire Q0,Q1,Q2,Q3;
//    wire k;
//    wire CA,CB;
//    wire AC0,AC1;
//    reg [1:0]Acount,Bcount;

//    always @(posedge clk) begin
//        q0<=Q0;
//        q1<=Q1;
//        q2<=Q2;
//        q3<=Q3;
//        Acount[0]<=AC0;
//        Acount[1]<=AC1;
//        Bcount[0]<=BC0;
//        Bcount[1]<=BC1;
//    end
    
//    assign CA=((~x)&(~q2)&q1&(~q0))|((~x)&q2&(~q1)&(~q0));
//    assign CB=(~x)&q2&q1;

//    assign AC1=(~Acount[0])&CA;
//    assign AC0=((~Acount[0])&CA)|(Acount[0]&(~CA)); // sorun olursa buraya birdaha bakq

//    assign 

//    assign k=Acount[1]|Bcount[1];

//    assign Q2=((~x)&q2)|(q2&q1)|(q2&(~q0))|((~x)&q1&(~q0))|(x&(~q2)&(~q1)&q0);
//    assign Q1=((~x)&(~q2)&(q0))|((~x)&(~q2)&q1)|((~q2)&q1&q0)|((~x)&q2&(~q1));
//    assign Q0=((~x)&(~q2)&(~q1))|((~x)&(~q2)&q0)|((~x)&(~q1)&q0)|((~q2)&(~q1)&q0)|(x&q2&(~q0))|(x&q2&q1);
    
//    assign Q3=((~k)&r)|(q3&(~r));

//endmodule

module Project2_2 (
    input r,x,clk,
    output reg y
);

    reg [2:0] state;
    reg [1:0] CountA;
    reg [1:0] CountB;

    

    always @(posedge clk or posedge r)  begin
        if(r == 1)begin
            state <= 3'b000;
        end
        else begin
            case(state)
                3'b000: begin
                    if(x) begin
                        state <= 3'b000;
                    end
                    else if(!x) begin
                        state <= 3'b001;
                    end
                    else begin
                        state <= 3'b000;
                    end
                end
                3'b001: begin
                    if(x) begin
                        state <= 3'b101;
                    end
                    else if(!x) begin
                        state <= 3'b011;
                    end
                    else begin
                        state <= 3'b000;
                    end
                end
                3'b010: begin
                    if(x) begin
                        state <= 3'b000;
                    end
                    else if(!x) begin
                        state <= 3'b110;
                    end
                    else begin
                        state <= 3'b000;
                    end
                end
                3'b011: begin
                    if (x) begin
                        state <= 3'b010;
                    end
                    else if(!x) begin
                        state <= 3'b011;
                    end
                    else begin
                        state <= 3'b000;
                    end
                end
                3'b100: begin
                    if (x) begin
                        state <= 3'b101;
                    end
                    else if(!x) begin
                        state <= 3'b111;
                    end
                    else begin
                        state <= 3'b000;
                    end
                end
                3'b101: begin
                    if (x) begin
                        state <= 3'b000;
                    end
                    else if(!x) begin
                        state <= 3'b100;
                    end
                    else begin
                        state <= 3'b000;
                    end
                end
                3'b110: begin
                    if (x) begin
                        state <= 3'b101;
                    end
                    else if(!x) begin
                        state <= 3'b111;
                    end
                    else begin
                        state <= 3'b000;
                    end
                end
                3'b111: begin
                    if (x) begin
                        state <= 3'b010;
                    end
                    else if(!x) begin
                        state <= 3'b011;
                    end
                    else begin
                        state <= 3'b000;
                    end
                end
            endcase
        end
    end

    always @(*) begin
        if ((CountA > 2'b01) | (CountB > 2'b01)) begin
            y = 1'b1;
        end
        else begin
            case(state)
                3'b111: begin
                    y = 1'b1;
                end
                3'b110: begin
                    y = 1'b1;
                end
                default: begin
                    y = 1'b0;
                end
            endcase
            
        end
    end
    always @(posedge clk or posedge r) begin
        if (r == 1) begin
            CountA <= 2'b00;
            CountB <= 2'b00;
        end
        else begin
            if ( state == 3'b111) begin
                CountB <= CountB + 2'b01;
            end
            else if ( state == 3'b110) begin
                CountA <= CountA + 2'b01;
            end
        end
    end

endmodule 

/* module project2_3 (
    input r,x,clk,
    output reg y
);
    wire Q0,Q1,Q2,Q3,Q4,Q5,CA,CB;
    reg q0,q1,q2,q3,q4,q5;


    always @(posedge clk or posedge r) begin
        if (r) begin
            q0 <= 0;
            q1 <= 0;
            q2 <= 0;
            q3 <= 0;
            q4 <= 0;
            q5 <= 0;
            y <= 0;
        end
        else if (~r)begin
            q0 <= Q0;
            q1 <= Q1;
            q2 <= Q2;
            q3 <= Q3;
            q4 <= Q4;
            q5 <= Q5;
            y <= ((CB)|(CA)|((q5)&(q4)&(q3)));
            //CB <= (~x)&(q2)&(q1);
            //CA <= ((~x)&(~q2)&(q1)&(~q0))|((~x)&(q2)&(~q1)&(~q0));
        end

    end

    assign Q0 = ((~x)&(~q2)&(~q1))|((~x)&(~q2)&(q0))|((~x)&(~q1)&(q0))|((~q2)&(~q1)&(q0))|((x)&(q2)&(~q0))|((x)&(q2)&(q1));
    assign Q1 = ((~x)&(~q2)&(q0))|((~x)&(~q2)&(q1))|((~q2)&(q1)&(q0))|((~x)&(q2)&(~q1));
    assign Q2 = ((~x)&(q2))|((q2)&(~q0))|((q2)&(q1))|((~x)&(q1)&(~q0))|((x)&(~q2)&(~q1)&(q0));

    assign CA = ((~x)&(~q2)&(q1)&(~q0))|((~x)&(q2)&(~q1)&(~q0));
    assign CB = (~x)&(q2)&(q1);

    assign Q3 = ((q3)|((CB)&(q4))|((CB)&(q5))|((CA)&(q4))|((CA)&(q5))|((CA)&(CB)));
    assign Q4 = (((~CB)&(q4))|((CB)&(q3))|((CB)&(q5))|((CA)&(q4))|((CA)&(~CB)&(~q5)));
    assign Q5 = (((~CA)&(q5))|((CB)&(q5))|((CA)&(q3))|((CA)&(q4))|((~CA)&(CB)&(~q4)));

    //assign y = (((CB)|(CA)|((q5)&(q4)&(q3))));
endmodule */