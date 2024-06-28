module Memory (
    input clk,
    input is_store,
    input is_load,
    input [4:0] address,
    input [511:0] in_data,
    output reg [511:0] out_data
);
    reg [31:0] memory [0:511];
    initial begin
        $readmemh("in_memory.txt", memory);    
    end

    wire [8:0] int_address = address << 4;
    
    integer i;
    always @(posedge clk) begin
        if(is_load)
        begin
            for (i = 0; i < 16; i = i + 1)
                out_data[32 * i +: 32] = memory[int_address + i];
        end
        if(is_store)
        begin
            for (i = 0; i < 16; i = i + 1)
                memory[int_address + i] = in_data[32 * i +: 32];
            $writememh("out_memory.txt", memory);
        end
    end
endmodule