module ALU(
    input opcode,
    input [511:0] in1, in2,
    output [511:0] out1, out2
);

    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin
            assign {out2[32 * i +: 32], out1[32 * i +: 32]} = opcode == 0 ? 
            $signed(in1[32 * i +: 32]) + $signed(in2[32 * i +: 32])
            : $signed(in1[32 * i +: 32]) * $signed(in2[32 * i +: 32]);
        end
    endgenerate

endmodule


