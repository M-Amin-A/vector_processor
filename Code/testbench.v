`timescale 1us/100ns
`include "CPU.v"

module testbench;
    
    reg [8:0] instruction;
    reg clk = 0;

    CPU cpu_ins(clk, instruction);
 
    reg [31:0] in_memory [0:511];
    reg [31:0] out_memory [0:511];
    integer i;
    reg correctness = 1;

    initial begin
        
        // $display("test 1: vector addition");
        // #2 instruction = 9'b000000000;      // load A1 mem(0 * 16)
        // #2 instruction = 9'b000100001;      // load A2 mem(1 * 16)
        // #2 instruction = 9'b100000000;      // add
        // #2 instruction = 9'b011000010;      // store A3 mem(2 * 16)
        // #2 instruction = 9'b011100011;      // store A4 mem(3 * 16)
        // #2

        // // check correctness
        // $readmemh("in_memory.txt", in_memory);
        // $readmemh("out_memory.txt", out_memory);

        // for(i = 0; i < 16; i = i + 1) begin
        //     if({out_memory[3 * 16 + i], out_memory[2 * 16 + i]}
        //      != {{32{in_memory[0 * 16 + i][31]}}, in_memory[0 * 16 + i]} + {{32{in_memory[1 * 16 + i][31]}}, in_memory[1 * 16 + i]})
        //         correctness = 0;
            
        //     $display("calculated = %h, correct = %h", 
        //     $signed({out_memory[3 * 16 + i], out_memory[2 * 16 + i]}),
        //     $signed({{32{in_memory[0 * 16 + i][31]}}, in_memory[0 * 16 + i]}) + $signed({{32{in_memory[1 * 16 + i][31]}}, in_memory[1 * 16 + i]}));
        // end

        // if(correctness == 1)
        //     $display("test passed!");
        // else
        //     $display("test failed!");

        //----------------------------------------------------------------------

        $display("test 2: vector multiplication");
        #2 instruction = 9'b000000000;      // load A1 mem(0 * 16)
        #2 instruction = 9'b000100001;      // load A2 mem(1 * 16)
        #2 instruction = 9'b110000000;      // multiply
        #2 instruction = 9'b011000010;      // store A3 mem(2 * 16)
        #2 instruction = 9'b011100011;      // store A4 mem(3 * 16)
        #2

        // check correctness
        $readmemh("in_memory.txt", in_memory);
        $readmemh("out_memory.txt", out_memory);

        for(i = 0; i < 16; i = i + 1) begin
            if({out_memory[3 * 16 + i], out_memory[2 * 16 + i]}
             != {{32{in_memory[0 * 16 + i][31]}}, in_memory[0 * 16 + i]} * {{32{in_memory[1 * 16 + i][31]}}, in_memory[1 * 16 + i]})
                correctness = 0;
            
            $display("calculated = %h, correct = %h", 
            $signed({out_memory[3 * 16 + i], out_memory[2 * 16 + i]}),
            $signed({{32{in_memory[0 * 16 + i][31]}}, in_memory[0 * 16 + i]}) * $signed({{32{in_memory[1 * 16 + i][31]}}, in_memory[1 * 16 + i]}));
        end

        if(correctness == 1)
            $display("test passed!");
        else
            $display("test failed!");        
        
        #2 $finish();
    end

    always #0.5 clk = ~clk;

endmodule

