`timescale 1ns / 1ps


module write_rc4(input [3:0] addi,in,addo,
             input clk,wr_1,rd_1,
             output[3:0] out,
             output [31:0] final_out
    );
    
    reg [3:0] memory [0:15];
    reg [3:0] temp_out;
    assign out=temp_out;
    always @ (posedge clk)
    begin  
             if(wr_1 && !rd_1)
                memory[addi] <= in;
             else if (rd_1 && !wr_1)
               temp_out<=memory[addo];
    end
    wire [3:0] xor0, xor1, xor2, xor3, xor4, xor5, xor6, xor7;

    assign xor0 = memory[0] ^ memory[2];
    assign xor1 = memory[1] ^ memory[3];
    assign xor2 = memory[4] ^ memory[6];
    assign xor3 = memory[5] ^ memory[7];
    assign xor4 = memory[8] ^ memory[10];
    assign xor5 = memory[9] ^ memory[11];
    assign xor6 = memory[12] ^ memory[14];
    assign xor7 = memory[13] ^ memory[15];

    assign final_out = {xor0, xor1, xor2, xor3, xor4, xor5, xor6, xor7};
        
endmodule
