`timescale 1ns / 1ps


module shift_right_speck(in,
                   out
    );
    input[63:0] in;
    output[63:0] out;
    assign out = (in>>7);
    
endmodule
