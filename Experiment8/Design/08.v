`timescale 1ns / 1ps

module MAC_NORMALIZE(
        input [19:0] data,
        output reg [7:0] result
    );
    always @(*) begin
        if( data < 20'd0 )begin
            result = 8'h00;
        end
        else if( data > 20'd255) begin
            result = 8'b11111111;
        end
        else begin
            result = data[7:0];
        end
    end
        
endmodule

module CONV(
    input clk,reset,
    input [23:0] data,weight,
    output [7:0] result
);
    wire [19:0] resultp;
        MAC mac1(.clk(clk),.reset(reset),.data(data),.weight(weight),.result(resultp));
        MAC_NORMALIZE macn1(.data(resultp),.result(result));
    
endmodule

module CONV128(
    input clk,reset,
    input [1039:0] data,
    input [23:0] weight,
    output [1023:0] result
);
    genvar i;
        generate
            for(i=0;i<128;i=i+1) begin
                CONV convi(.clk(clk),.reset(reset),.data(data[23+8*i:8*i]),.weight(weight),.result(result[8*i+7:8*i]));
            end
        endgenerate
endmodule

module control_input(
    input clk,reset,conv_run,
    input [71:0] kernel,
    output reg enable_ram,
    output reg [7:0] address_ram,
    output reg [23:0] weight
);
    integer i;
    reg [1:0] count;
    reg [7:0] addr;
    always @(posedge clk) begin
        if (reset == 1'b1)begin
            addr <= 8'b00000000;
            count <= 2'b00;
        end
        else if(conv_run == 1'b1) begin
            enable_ram <= 1'b1;
                if(count == 2'b00)begin
                    weight <= kernel[23:0];
                    address_ram <= addr;
                    count <= count + 1'b1;
                end
                else if(count == 2'b01) begin
                    weight <= kernel[47:24];
                    address_ram <= addr+1'b1;
                    count <= count + 1'b1;
                end
                else if(count == 2'b10) begin
                    weight <= kernel[71:48];
                    address_ram <= addr+2'b10;
                    count<=2'b00;
                    addr <= addr +1'b1;
                end
            else if(addr == 8'b10000010)begin
                addr <= 8'b00000000;
            end
        end
    end
endmodule

module output_control(
    input clk,reset,
    input [1023:0] data,
    output reg conv_done,
    output reg [6:0] ram_address,
    output reg [1023:0] data_out
);
    integer i;
    reg [1:0] count;
    reg [6:0] addr;
    reg [1023:0] datap1,datap2,datap3;
    always @(posedge clk | reset) begin
        if (reset == 1'b1) begin
            count=2'b00;
            addr=7'b0000000;
        end
        else if(reset == 1'b0 )begin
                if(count == 2'b00)begin
                    datap1 <= data;
                    count <= 2'b01;
                end
                else if(count == 2'b01)begin
                    datap2 <= data;
                    count <= 2'b10;
                    ram_address <= addr;
                end
                else if(count == 2'b10)begin
                    datap3 <= data;
                    count <= 2'b11;
                end
                else if(count == 2'b11) begin
                    data_out <= datap1+datap2+datap3;
                    addr <= addr+1'b1;
                    count <= 2'b01;
                    datap1 <= data;
                end
            end
    end
endmodule
// her 3 clk de bir output gelmesi lazim
