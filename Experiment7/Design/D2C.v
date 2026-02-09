`timescale 1ns / 1ps

 
module D2C(
    input [199:0]f,
    input [71:0]w,
    input clk,
    output [19:0]result_33,result_32,result_31,result_23,result_22,result_21,result_13,result_12,result_11
);
    wire [179:0]resultp;
    wire rst=1'b0;
    wire [19:0] result99,result1,result2,result3,result4,result5,result6,result7,result8,result9,result10,result11,result12,result13,result14,result15,result16,result17,result18,result19,result20,result21,result22,result23,result24,result25,result26;
    
   
    MAC mac1(.clk(clk),.reset(rst),.data({f[7:0],f[15:8],f[23:16]}),.weight({w[71:64],w[63:56],w[55:48]}),.result(result99));
    MAC mac2(.clk(clk),.reset(rst),.data({f[47:40],f[55:48],f[63:56]}),.weight({w[47:40],w[39:32],w[31:24]}),.result(result1));
    MAC maci(.clk(clk),.reset(rst),.data({f[87:80],f[95:88],f[103:96]}),.weight({w[23:16],w[15:8],w[7:0]}),.result(result2));
  
    assign resultp[19:0]= result99+result1+result2;
    assign result_33 = resultp[19:0];

    MAC mac3(.clk(clk),.reset(rst),.data({f[15:8],f[23:16],f[31:24]}),.weight({w[71:64],w[63:56],w[55:48]}),.result(result3));
    MAC mac4(.clk(clk),.reset(rst),.data({f[55:48],f[63:56],f[71:64]}),.weight({w[47:40],w[39:32],w[31:24]}),.result(result4));
    MAC mac5(.clk(clk),.reset(rst),.data({f[95:88],f[103:96],f[111:104]}),.weight({w[23:16],w[15:8],w[7:0]}),.result(result5));
    
    assign resultp[39:20]= result3+result4+result5;
    assign result_32=resultp[39:20];

    MAC mac6(.clk(clk),.reset(rst),.data({f[23:16],f[31:24],f[39:32]}),.weight({w[71:64],w[63:56],w[55:48]}),.result(result6));
    MAC mac7(.clk(clk),.reset(rst),.data({f[63:56],f[71:64],f[79:72]}),.weight({w[47:40],w[39:32],w[31:24]}),.result(result7));
    MAC mac8(.clk(clk),.reset(rst),.data({f[103:96],f[111:104],f[119:112]}),.weight({w[23:16],w[15:8],w[7:0]}),.result(result8));
    
    assign resultp[59:40]= result8+result6+result7;
    assign result_31 =  resultp[59:40];

    MAC mac9(.clk(clk),.reset(rst),.data({f[47:40],f[55:48],f[63:56]}),.weight({w[71:64],w[63:56],w[55:48]}),.result(result9));
    MAC mac10(.clk(clk),.reset(rst),.data({f[87:80],f[95:88],f[103:96]}),.weight({w[47:40],w[39:32],w[31:24]}),.result(result10));
    MAC mac11(.clk(clk),.reset(rst),.data({f[127:120],f[135:128],f[143:136]}),.weight({w[23:16],w[15:8],w[7:0]}),.result(result11));

    assign resultp[79:60]= result9+result10+result11;
    assign result_23 = resultp[79:60];

    MAC mac12(.clk(clk),.reset(rst),.data({f[55:48],f[63:56],f[71:64]}),.weight({w[71:64],w[63:56],w[55:48]}),.result(result12));
    MAC mac13(.clk(clk),.reset(rst),.data({f[95:88],f[103:96],f[111:104]}),.weight({w[47:40],w[39:32],w[31:24]}),.result(result13));
    MAC mac14(.clk(clk),.reset(rst),.data({f[135:128],f[143:136],f[151:144]}),.weight({w[23:16],w[15:8],w[7:0]}),.result(result14));

    assign resultp[99:80]= result12+result13+result14;
    assign result_22 = resultp[99:80];

    MAC mac15(.clk(clk),.reset(rst),.data({f[63:56],f[71:64],f[79:72]}),.weight({w[71:64],w[63:56],w[55:48]}),.result(result15));
    MAC mac26(.clk(clk),.reset(rst),.data({f[103:96],f[111:104],f[119:112]}),.weight({w[47:40],w[39:32],w[31:24]}),.result(result16));
    MAC maci7(.clk(clk),.reset(rst),.data({f[143:136],f[151:144],f[159:152]}),.weight({w[23:16],w[15:8],w[7:0]}),.result(result17));

    assign resultp[119:100]= result15+result16+result17;
    assign result_21 = resultp[119:100];

    MAC mac111(.clk(clk),.reset(rst),.data({f[87:80],f[95:88],f[103:96]}),.weight({w[71:64],w[63:56],w[55:48]}),.result(result18));
    MAC mac2a(.clk(clk),.reset(rst),.data({f[127:120],f[135:128],f[143:136]}),.weight({w[47:40],w[39:32],w[31:24]}),.result(result19));
    MAC maciv(.clk(clk),.reset(rst),.data({f[167:160],f[175:168],f[183:176]}),.weight({w[23:16],w[15:8],w[7:0]}),.result(result20));

   assign resultp[139:120]= result18+result19+result20;
   assign result_13 = resultp[139:120];

    MAC mac1f(.clk(clk),.reset(rst),.data({f[95:88],f[103:96],f[111:104]}),.weight({w[71:64],w[63:56],w[55:48]}),.result(result21));
    MAC mac2e(.clk(clk),.reset(rst),.data({f[135:128],f[143:136],f[151:144]}),.weight({w[47:40],w[39:32],w[31:24]}),.result(result22));
    MAC mactt(.clk(clk),.reset(rst),.data({f[175:168],f[183:176],f[191:184]}),.weight({w[23:16],w[15:8],w[7:0]}),.result(result23));

    assign resultp[159:140]= result21+result22+result23;
    assign result_13 = resultp[159:140];

    MAC mac1a(.clk(clk),.reset(rst),.data({f[103:96],f[111:104],f[119:112]}),.weight({w[71:64],w[63:56],w[55:48]}),.result(result24));
    MAC mac2g(.clk(clk),.reset(rst),.data({f[143:136],f[151:144],f[159:152]}),.weight({w[47:40],w[39:32],w[31:24]}),.result(result25));
    MAC macff(.clk(clk),.reset(rst),.data({f[183:176],f[191:184],f[199:192]}),.weight({w[23:16],w[15:8],w[7:0]}),.result(result26));

    assign resultp[179:160]= result24+result25+result26;
    assign result_13 = resultp[179:160];


endmodule 
