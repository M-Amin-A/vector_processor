`include "RegisterFile.v"
`include "Memory.v"
`include "ALU.v"

module CPU(
    input clk,
    input [8:0] instruction
);

    wire [1:0] rs = instruction[6:5];
    wire [4:0] address = instruction[4:0];
    wire is_load = instruction[8:7] == 2'b00;
    wire is_store = instruction[8:7] == 2'b01;
    wire is_alu = instruction[8] == 1'b1;

    wire [511:0] registers [0:3];
    wire [511:0] data_in0 = is_load ? mem_out_data : ALU_out[0];
    wire [511:0] data_in1 = ALU_out[1];
    wire [1:0] in_reg0 = is_load ? rs : 2'b10;
    wire [1:0] in_reg1 = 2'b11;
    wire we0 = is_store ? 0 : 1;
    wire we1 = is_alu ? 1 : 0;

    RegisterFile rf(clk, we0, we1, in_reg0, in_reg1, data_in0, data_in1, registers[0], registers[1], registers[2], registers[3]);

    wire [511:0] ALU_out [0:1];    
    ALU alu(instruction[7], registers[0], registers[1], ALU_out[0], ALU_out[1]);

    wire [511:0] mem_in_data = registers[rs];
    wire [511:0] mem_out_data;
    Memory memory(clk, is_store, is_load, address, mem_in_data, mem_out_data);

endmodule