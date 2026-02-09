`timescale 1ns / 1ps


module CLA16(a,b, cin, sum,cout);
input [15:0] a,b;
input cin;
output [15:0] sum;
output cout;
wire c1,c2,c3;

CLA cla1 (.X(a[3:0]), .Y(b[3:0]), .c0(cin), .S(sum[3:0]), .cout(c1));
CLA cla2 (.X(a[7:4]), .Y(b[7:4]), .c0(c1), .S(sum[7:4]), .cout(c2));
CLA cla3(.X(a[11:8]), .Y(b[11:8]), .c0(c2), .S(sum[11:8]), .cout(c3));
CLA cla4(.X(a[15:12]), .Y(b[15:12]), .c0(c3), .S(sum[15:12]), .cout(cout));

endmodule
