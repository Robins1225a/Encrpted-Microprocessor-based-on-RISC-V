`timescale 1ns / 1ps


module reg_rc4(din,
dout,clk,reset
    );
    input [3:0] din;
    output reg[3:0] dout;
    input clk,reset;
    
    always @ (posedge clk or posedge reset)
     begin
         if (reset)
          dout<=4'b0000;
         else
         dout<= din;
    end
    
endmodule
