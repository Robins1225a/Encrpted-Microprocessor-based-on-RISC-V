`timescale 1ns / 1ps
module eqz_comparing_15_rc4 (eqz, data); 
  input [3:0] data; 
  output eqz;
   assign eqz =(data == 4'b1111); 
endmodule 