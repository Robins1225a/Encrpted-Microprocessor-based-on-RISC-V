`timescale 1ns / 1ps

module compare_0001 (eqz, data); 
  input [3:0] data; 
  output eqz;
   assign eqz =(data == 4'b0001); 
endmodule 