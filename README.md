![LOGO](/Miscellaneous/cpu.jpg?raw=true)

# Vector Processor
This project is a vector processor with a 16kb memory, four vector registers and following abilities:
- Addition of two registers
- Multiplication of two registers
- Load/Store a register from/to the memory using SIMD architecture (single instruction multiple data)


## Tools
For simulation, We have utilized Icarus Verilog, which is an implementation of the Verilog hardware description language compiler that generates netlists in the desired format (EDIF) and a simulator


## Implementation Details
This project has been developed using Verilog hardware description language. <br />
It consists of four main parts:
- ALU: With the ablility of parallel addition and multipliction
- Register File: Containing four 512-bit registers
- Memory Unit: With a size of 2kB
- CPU: Connecting preceding main parts


## Testing Method
For each test, many numbers have been generated randomly and been placed in memory. Then, We have calculated the results in two ways: <br/>
First, using the implemented CPU <br/>
Second, using Verilog high level programming <br/>
At last, these results have been compared and if the CPU results had been correct, it would have passed that test.


## How to Use
You can write your custom program using available instructions with following ISA:
![ISA](/Miscellaneous/ISA.jpg?raw=true)

Architecture Description:
- Word: This architecture supports 4-byte words.
- Memory: A memory with 512 words is available in this architecture and it is word-addressable
- Registers: Four 16-word registers are available (with indices from 00 to 11)
#
Instruction Details:
- Load: Loads 16 words (from Address * 16 to Address * 16 + 15) from memory to register Rs
- Store: Stores 16 words from register Rs to memory (from Address * 16 to Address * 16 + 15)
- Add: calculates the sum of Registers 00 and 01 and stores the result in registers {11, 10}
- Multiply: calculates the multiplication of Registers 00 and 01 and stores the result in registers {11, 10}


## Related Links
 - [Icarus Verilog](https://github.com/icarus-sim/icarus)


## Authors
- [Mahdi Alinejad](https://github.com/Soilorian)
- [Mohammad Amin Abbasfar](https://github.com/M-Amin-A)
