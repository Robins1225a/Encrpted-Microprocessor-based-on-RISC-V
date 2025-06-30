`timescale 1ns / 1ps

module eqz_comparing_0_speck (eqz, data); 
  input [1:0] data; 
  output eqz;
   assign eqz =(data == 2'b00); 
endmodule 