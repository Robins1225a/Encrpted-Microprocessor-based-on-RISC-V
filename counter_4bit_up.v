`timescale 1ns / 1ps


module counter_4bit_up_speck (q,reset,clk

    );
     output [3:0] q;
    input clk,reset;
    reg[3:0] temp_q;
    assign q=temp_q;
    always @(posedge clk, posedge reset)
    begin
        if(reset)
            temp_q <= 4'b0000;
        else
           temp_q <= q+1;
    end
endmodule