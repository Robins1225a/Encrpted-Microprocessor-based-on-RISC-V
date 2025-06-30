`timescale 1ns / 1ps


module adder_rc4(input [3:0] in1,in2,
             output [4:0] out
    );
        assign out = in1+in2;
endmodule
