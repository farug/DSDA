`timescale 1ns / 1ps

module MAC(
    input clk,
    input reset,
    input signed [23:0]data,weight,
    output reg signed [19:0]result
);
    initial begin
        result = 20'b00000000000000000000;
    end
    wire signed [15:0]product0,product1,product2;
    wire signed [15:0] sum0,sum1;
    reg [1:0]count=2'b00;
        MULTB u1(.A(data[7:0]),.B(weight[7:0]),.result(product0));
        MULTB u2(.A(data[15:8]),.B(weight[15:8]),.result(product1));
        MULTB u3(.A(data[23:16]),.B(weight[23:16]),.result(product2));
        BA u4(.A(product0),.B(product1),.result(sum0));
        BA u5(.A(product2),.B(sum0),.result(sum1));
        always @(posedge clk )begin
            if (reset == 1'b1)begin
                result <= 20'b00000000000000000000;
                count <= 2'b00;
            end
            else if(count == 2'b00)begin
                result <= sum1;
                count <= count + 1'b1;
            end
            else if(count == 2'b10)begin
                count <=2'b00;
                result <= result + sum1;
            end 
            else begin
                result <= result + sum1;
                count <= count +1'b1;
            end
        end


endmodule
