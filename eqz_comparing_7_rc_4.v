`timescale 1ns / 1ps

module eqz_comparing_7_rc4 (eqz, data); 
  input [2:0] data; 
  output eqz;
   assign eqz =(data == 3'b111); 
endmodule 