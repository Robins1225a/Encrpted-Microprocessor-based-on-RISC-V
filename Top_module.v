`timescale 1ns / 1ps


module Top_module_datapath (X, H1, K1, Y1,clk,start_speck,start_rc4,eqz,reset_1,out,add_to_read,final_out);

    input [63:0]  X, H1, K1, Y1; 
    input [3:0] add_to_read;
    input clk,start_speck,reset_1;
    input start_rc4;
    output eqz;
    output [3:0] out;
    output [31:0] final_out;
    wire  [3:0]h_out;
    wire [3:0] in1s,in2s,in2;
    wire reset,temp_clk1,temp_clk2;
    assign reset=~start_rc4;
    wire [3:0]c4;
    counter_4bit_up_speck count4 (.q(c4),.reset(reset_1),.clk(clk));
    compare_0001  EQZ (.eqz(eqz),.data(c4)); 
    SPECK_HASH_DATAPATH uut_1 (
    .X(X),
    .reset8(reset8_s),
    .reset4(reset4_s),
    .reset_reg(reset_reg_s),
    .reset_counter(reset_counter_s),
    .clk(clk),
    .H1(H1),
    .K1(K1),
    .Y1(Y1),
    .ld(Load),
    .hout(h_out),
    .ld1(ld1),
    .eqz4_9(eqz4_9),
    .eqz2_0(eqz2_0),
    .eqz4_1(eqz4_1),
    .rd(rd),
    .wr(wr),
    .en(en)
);

control_path_speck uut_2 (
    .eqz4_9(eqz4_9),
    .eqz2_0(eqz2_0),
    .eqz4_1(eqz4_1),
    .Load(Load),
    .ld1(ld1),
    .reset4(reset4_s),
    .reset8(reset8_s),
    .reset_reg(reset_reg_s),
    .reset_counter(reset_counter_s),
    .clk(clk),
    .start(start_speck),
    .rd(rd),
    .wr(wr),
    .en(en)
);
clk_div_rc4 clk1_2 (.clk(clk),.reset(reset_1),.out1(temp_clk1),.out2(temp_clk2));
reg_rc4 rc4in1s(.din(h_out),.dout(in1s),.clk(temp_clk1),.reset(reset));
reg_rc4 rc4in2s(.din(h_out),.dout(in2s),.clk(temp_clk2),.reset(reset));
reg_rc4  rc4ink(.din(in1s),.dout(in2),.clk(temp_clk1),.reset(reset));

    RC4_DATAPATH t1 (.clk_rst(clk_rst),.en_s(en_s),.enc(enc),.reset4(reset4_r),.reset_reg(reset_reg_r),.reset_counter_final(reset_counter_final_r),.clk(clk),.reset3(reset3_r),.en_k(en_k),.in1s(in1s),.in2s(in2s),.in_k(in2),.reset1(reset1_r),.reset2(reset2_r),.eqz4(eqz4),.eqz3(eqz3),.eqz5(eqz5),.rd_1(rd_1),.wr_1(wr_1),.out(out),.add_to_read(add_to_read),.final_out(final_out));
    control_path_rc4 t2 (.start(start_rc4),.eqz4(eqz4),.eqz5(eqz5),.eqz3(eqz3),.en_s(en_s),.en_k(en_k),.clk_rst(clk_rst),.reset1(reset1_r),.reset2(reset2_r),.reset3(reset3_r),.clk(clk),.enc(enc),.reset4(reset4_r),.reset_reg(reset_reg_r),.reset_counter_final(reset_counter_final_r),.wr_1(wr_1),.rd_1(rd_1));

endmodule
