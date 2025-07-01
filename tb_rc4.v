`timescale 1ns / 1ps


module tb_rc4(

    );
    reg reset_1;
    reg clk;
    reg [3:0]add_to_read;
    wire [3:0]out;
    wire [31:0] final_out;
   
    TOP_Module_final dut (.clk(clk),.reset_1(reset_1),.out(out),.add_to_read(add_to_read),.final_out(final_out));
    
    initial
    begin
    reset_1=1'b1;
    #10 reset_1=1'b0;
    end
   initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
    end
   reg [31:0] plaintext; 
    initial 
    begin
    plaintext=32'h4BC51EF9;
    end
    
  wire [31:0] encrypt;
  assign  encrypt=plaintext^final_out;
  
  wire [31:0]decrypt;
  assign decrypt=encrypt^final_out;
  
 

 wire[3:0] in1s,in2s,in2,c4,h_out,addo;
 wire eqz,rc4,temp_clk1,temp_clk2,wr,rd,eqz5;
 wire[4:0] uc5;
 assign in1s=dut.Final_1.rc4in1s.dout;
 assign in2s=dut.Final_1.rc4in2s.dout;
 assign in2=dut.Final_1.rc4ink.dout;
 assign eqz=dut.Final_2.eqz;
 assign c4=dut.Final_1.c4;
 assign rc4=dut.Final_2.start_rc4;
 assign temp_clk1=dut.Final_1.temp_clk1;
 assign temp_clk2=dut.Final_1.temp_clk2;
 assign h_out= dut.Final_1.h_out;
 assign wr=dut.Final_1.t2.wr_1;
 assign rd=dut.Final_1.t2.rd_1;
 assign addo=dut.Final_1.t1.addo;
 assign uc5=dut.Final_1.t1.uc5;
 assign eqz5 =dut.Final_1.t1.eqz5;
 
//reg[3:0] temp_out11;

integer k;
initial begin
    #1600;
    for(k=0;k<16;k=k+1)
        begin
          #20 add_to_read = (k);
        end
     end




endmodule


