`timescale 1ns / 1ps
module comparing_5bit_10101 (eqz, data); 
  input [4:0] data; 
  output eqz;
   assign eqz =(data == 5'b10101); 
endmodule 