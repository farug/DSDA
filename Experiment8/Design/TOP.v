`timescale 1ns / 1ps


module TOP(
    input clk,reset,conv_run,
    input [71:0] kernel,
    output [1023:0] data_outl
    );
    wire [7:0] address_ram;
    wire [23:0] weight;
    wire [1039:0] data;
    wire [1023:0] data2;
    wire wea,ena;
    wire [6:0] ram_address;
    wire [1023:0] data3;
    control_input ci(.clk(clk),.reset(reset),.conv_run(conv_run),.kernel(kernel),.address_ram(address_ram),.weight(weight),.enable_ram(ena)); // all connections done
    blk_mem_gen_0 BRAM(.douta(data),.clka(clk),.addra(address_ram),.ena(ena),.wea(1'b0));// all connections done
    CONV128 CV1281(.weight(weight),.data(data),.clk(clk),.reset(reset),.result(data2)); // all connections done
    output_control co(.clk(clk),.reset(reset),.data(data2),.ram_address(ram_address),.data_out(data3),.conv_done(wea));//all connections done
    blk_mem_gen_1 BRAM2(.dina(data_outl),.clka(clk),.addra(ram_address),.wea(wea),.ena(ena2));
endmodule
