`timescale 1ns / 1ps

module control_path_rc4 (start,eqz4,eqz3,eqz5,en_s,en_k,clk_rst,reset1,reset2,reset3,clk,enc,reset4,reset_reg,reset_counter_final,wr_1,rd_1);

        input eqz4,eqz3,eqz5,clk,start;
        output reg en_s,en_k,clk_rst,reset1,reset2,reset3,enc,reset4,reset_reg,reset_counter_final,wr_1,rd_1;
        
        reg [4:0] state; 
        parameter S0 =5'b00000, S1 =5'b00001, S2 =5'b00010, S3 =5'b00011, S4=5'b00100,
                  S5 =5'b00101, S6 =5'b00110, S7 =5'b00111, S8 =5'b01000, S9=5'b01001,S10=5'b01010,
                  S11=4'b1011, S12=4'b1100, S13=4'b1101, S14=4'b1110, S15=4'b1111, S16=5'b10000,S17=5'b10001,
                  S18=5'b10010;
   always @(posedge clk) 
    begin 
      case (state) 
        S0:    if(start) state <= S1;
        S1:    state <= S2; 
        S2:    begin #2 if(eqz3)state <= S3; end
        S3:    state <=S4;
        S4:    state <=S5;
        S5:    begin #2 if(eqz3)state <= S6;end
        S6:    state <= S7;
        S7:    state <= S8;
        S8:    state <= S9;
        S9:    state <= S10;
        S10:    begin #2 if (eqz4) state<= S11; end
        S11:    state <= S12; 
        S12:    state <= S13;
        S13:    state <= S14;  
        S14:    state <= S15;
        S15:    begin #2 if(eqz5)state <= S16;end
        S16:    state <= S17;
        S17:    state <= S18;
        S18:    state <= S18; 
        default: state <= S0;
endcase 
    end
always @(state) 
  begin 
    case (state) 
      S0:   begin #1 en_s=1;en_k=1;clk_rst=1;reset1=1;reset2=1;enc=1;reset4=1;wr_1=1;rd_1=0; end 
      S1:   begin #1 clk_rst=0;reset1=0;reset2=0;reset4=0;end 
      S2:   begin #1 en_s=1; end 
      S3:   begin #1 en_s=1; end 
      S4:   begin #1 en_s=0;en_k=1;enc=1; end
      S5:   begin #1 en_s=0;en_k=1;enc=1; end
      S6:   begin #1 en_s=0;en_k=1;enc=1; end
      S7:   begin #1 en_k=0;enc=0;reset3=1; end 
      S8:   begin #1 reset3=1;end
      S9:   begin #1 reset3=0;end
      S10:  begin #1 enc=0 ;end
      S11:  begin #1 enc=1;reset_reg=1;end 
      S12:  begin #1 reset_reg=1;end
      S13:  begin #1 reset_reg=0;reset_counter_final=1;end 
      S14:  begin #1 reset_counter_final=1;end 
      S15:  begin #1 reset_counter_final=0;end
      S16:  begin #1 reset_counter_final=0;wr_1=0;rd_1=0;end
      S17:  begin #1 reset_counter_final=0;wr_1=0;rd_1=0;end
      S18:  begin #1 reset_counter_final=0;wr_1=0;rd_1=1;end 
      default: begin #1 en_s=0;en_k=0;clk_rst=0;reset1=0;reset2=0;reset3=0;enc=0;reset4=0;reset_reg=0;reset_counter_final=0;wr_1=1;rd_1=0;end  
    endcase  
  end 
endmodule
