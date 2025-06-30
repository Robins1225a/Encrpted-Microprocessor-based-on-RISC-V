`timescale 1ns / 1ps

module tb_speck();

reg [63:0]  X, H1, K1, Y1;
reg clk, start;
wire [3:0] h_out;
wire [63:0] m1, m2, w1, w2, w3, w4, w5, w6, w7, w8, output_buf1, bf1h, output_buf2, t, m3, w26;
wire [2:0] w13;
wire [1:0] w33;
wire [3:0] uc3, final, uc4;

wire eqz4_9, eqz2_0, eqz4_1;
wire Load, ld1, reset4, reset8, reset_reg, reset_counter, rd, wr, en;

SPECK_HASH_DATAPATH uut_1 (
    .X(X),
    .reset8(reset8),
    .reset4(reset4),
    .reset_reg(reset_reg),
    .reset_counter(reset_counter),
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
    .reset4(reset4),
    .reset8(reset8),
    .reset_reg(reset_reg),
    .reset_counter(reset_counter),
    .clk(clk),
    .start(start),
    .rd(rd),
    .wr(wr),
    .en(en)
);

initial begin
    start = 1'b0;
    #30 start = 1'b1;
end

initial begin
    clk = 1'b1;
    forever #5 clk = ~clk;
end

initial begin
    X  = 64'h123456789ABCDEF1;
    H1 = 64'h6A09E66712345678;
    K1 = 64'hBB67AE8523456789;
    Y1 = 64'h6A09E66734567891;
end

assign m1 = uut.m1.out;
assign m2 = uut.m2.out;
assign w1 = uut.regx.dout;
assign w2 = uut.regy.dout;
assign w3 = uut.sr.out;
assign w4 = uut.add.add_out;
assign w5 = uut.regk1.dout;
assign w6 = uut.w6;
assign w7 = uut.sl.out;
assign w8 = uut.w8;
assign w13 = uut.dc.q;
assign output_buf1 = uut.bf1.out;
assign output_buf2 = uut.bf2.out;
assign bf1h = uut.bf1h.out;
assign w33 = uut.dch.q;
assign t = uut.H_final;
assign m3 = uut.mh.out;
assign w26 = uut.ww;
assign uc3 = uut.up_counter.q;
assign final = uut.final_value.out1;
assign uc4 = uut.uc4.q;

endmodule
