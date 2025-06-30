`timescale 1ns / 1ps


module write_read_final_speck_memory(
                input clk,wr,rd,en,
                input[63:0] in1,
                input[3:0] addo,
                output [3:0] out1
       );
       reg [3:0] speck_mem[0:15];
       reg[3:0] temp_out;
      assign out1=temp_out;
 always @(negedge clk)
  begin
    if(wr && !rd && en)
        begin
        speck_mem[15]  <= in1[3:0];
        speck_mem[14]  <= in1[7:4];
        speck_mem[13]  <= in1[11:8];
        speck_mem[12]  <= in1[15:12];
        speck_mem[11]  <= in1[19:16];
        speck_mem[10]  <= in1[23:20];
        speck_mem[9]  <= in1[27:24];
        speck_mem[8]  <= in1[31:28];
        speck_mem[7]  <= in1[35:32];
        speck_mem[6]  <= in1[39:36];
        speck_mem[5] <= in1[43:40];
        speck_mem[4] <= in1[47:44];
        speck_mem[3] <= in1[51:48];
        speck_mem[2] <= in1[55:52];
        speck_mem[1] <= in1[59:56];
        speck_mem[0] <= in1[63:60];
        end
        
     else if (rd && !wr && en)
     begin
        temp_out <= speck_mem[addo];
     end
        
    end
endmodule
