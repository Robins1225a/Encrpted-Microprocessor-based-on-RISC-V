`timescale 1ns / 1ps


module TOP_Module_final(clk,reset_1,add_to_read,out,final_out);

input clk,reset_1;
input [3:0] add_to_read;
output [3:0] out;
output [31:0] final_out;

wire [63:0] X,H1,K1,Y1;
wire eqz;
Top_module_datapath Final_1(.X(X), .H1(H1), .K1(K1), .Y1(Y1),.clk(clk),.start_speck(start_speck),.reset_1(reset_1),.start_rc4(start_rc4),.eqz(eqz),.out(out),.add_to_read(add_to_read),.final_out(final_out));
Top_module_controlpath Final_2(.clk(clk),.reset_1(reset_1),.start_speck(start_speck),.start_rc4(start_rc4),.eqz(eqz),.X(X),.H1(H1),.K1(K1),.Y1(Y1));

endmodule
