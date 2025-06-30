`timescale 1ns / 1ps


module counter_3bit_up_rc4 (q,reset,clk
    );
     output [2:0] q;
    input clk,reset;
    reg[2:0] temp_q;
    assign q=temp_q;
    always @(posedge clk, posedge reset)
    begin
        if(reset)
            temp_q <= 3'b000;
        else
           temp_q <= q+1;
    end
endmodule
