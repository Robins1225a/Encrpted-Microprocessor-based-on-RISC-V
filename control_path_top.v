`timescale 1ns / 1ps


module Top_module_controlpath(clk,reset_1,eqz,start_rc4,start_speck,X,H1,K1,Y1);
input clk,eqz,reset_1;
output reg start_rc4,start_speck;
output reg [63:0] X,H1,K1,Y1;
    

reg [2:0]state;
parameter S0=3'b000,S1=3'b001,S2=3'b010,S3=3'b011,S4=3'b100,S5=3'b101,S6=3'b110;

always @(posedge clk)
begin
  case(state)
  S0:  begin #2if(!reset_1)state<=S1;end
  S1:  begin  state<=S2;end
  S2:  begin  state<=S3;end
  S3:  begin  state<=S4;end
  S4:  begin  #2if(eqz)state<=S5;end
  S5:  begin state<=S6; end
  S6:  begin state<=S6; end
  default:  state<=S0;
  endcase
end
always @(state)
begin
  case(state)
  S0: begin start_speck=0;start_rc4=0;
        X  = 64'hAD345F789EBC2EF1;
        H1 = 64'h6A09E6671A34C678;
        K1 = 64'hBB67AE8523456789;
        Y1 = 64'h6A09E66734567891;
    end
  S1: begin start_speck=0;start_rc4=0;end
  S2: begin start_speck=0;start_rc4=0;end
  S3: begin start_speck=0;start_rc4=0;end
  S4: begin start_speck=1;start_rc4=0;end
  S5: begin start_rc4=1;end
  S6: begin start_rc4=1;end
  default: begin start_speck=0;start_rc4=0; X=64'hAD345F789EAC2EF1;H1 = 64'h6A09E6671A34C678;
             K1 = 64'hBB27AE8523456789;Y1 = 64'h6A09E66734567891;end
  endcase
end

endmodule
