`timescale 1ns / 1ps


module up_counter_5bit (q,reset,clk

    );
     output [4:0] q;
    input clk,reset;
    reg[4:0] temp_q;
    assign q=temp_q;
    always @(posedge clk, posedge reset)
    begin
        if(reset)
            temp_q = 5'b00000;
        else
           temp_q = q+1;
    end
endmodule
