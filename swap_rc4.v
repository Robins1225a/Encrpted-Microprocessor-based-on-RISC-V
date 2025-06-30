`timescale 1ns / 1ps


module swap_rc4(clk,
            reset,
            out1,out2,
            in1,in2,
            sel
    );
    
    
    wire [3:0] w1,w2,w3,w4,w5,w6;
    wire [3:0] r1,r2;
    wire [3:0] s1,s2;
    


    input clk,reset;
    input [3:0] in1,in2;
    output[3:0] out1,out2;
    input sel;
    
    
    mux2to1_rc4 m1(.in1(in1),.in2(out2),.out(w2),.sel(sel));
    mux2to1_rc4 m2(.in1(in2),.in2(out1),.out(w4),.sel(sel));
    reg_rc4 rc1(.din(w2),.dout(out1),.clk(clk),.reset(reset));
    reg_rc4 rc2(.din(w4),.dout(out2),.clk(clk),.reset(reset));
    
endmodule
