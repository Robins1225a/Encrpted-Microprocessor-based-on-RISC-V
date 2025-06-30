`timescale 1ns / 1ps

module eqz_comparing_9_speck (eqz, data); 
  input [3:0] data; 
  output eqz;
   assign eqz =(data == 4'b1001); 
endmodule 