`timescale 1ns / 1ps

module BA(
    input signed [15:0]A,
    input signed [15:0]B,
    output reg signed [15:0]result
);
    always @(*)begin
    result = A+B;
    end

endmodule 
