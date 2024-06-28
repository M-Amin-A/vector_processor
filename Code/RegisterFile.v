module RegisterFile(
    input clk,
    input we1, input we2,
    input [1:0] in_reg1, in_reg2,
    input [511:0] in_data1, in_data2,
    output [511:0] register0, register1, register2, register3
);

    reg [511:0] registers [0:3];
    assign register0 = registers[0];
    assign register1 = registers[1];
    assign register2 = registers[2];
    assign register3 = registers[3];

    always @(posedge clk) begin
        if (we1) begin
            registers[in_reg1] = in_data1;
        end
        if (we2) begin
            registers[in_reg2] = in_data2;
        end
    end

endmodule
