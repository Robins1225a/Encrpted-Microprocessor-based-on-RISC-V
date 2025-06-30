`timescale 1ns / 1ps

module control_path_speck(eqz4_9, eqz2_0, eqz4_1, rd, wr, en, Load, ld1, reset4, reset8, reset_reg, reset_counter, clk, start);

    output reg reset_reg, reset4, reset8, reset_counter, Load, ld1, rd, wr, en;
    input eqz4_9, eqz2_0, eqz4_1, start, clk;

    reg[2:0] state;
    parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100, S5 = 3'b101, S6 = 3'b110, S7 = 3'b111;

    always @ (posedge clk) begin
        case (state)
            S0: begin #2 if (start) state <= S1; end
            S1: state <= S2;
            S2: begin #2 if (eqz4_9) state <= S3; end
            S3: begin #2 if (eqz2_0) state <= S4; end
            S4: state <= S5;
            S5: begin #2 if (eqz4_1) state <= S6; end
            S6: state <= S7;
            S7: state <= S7;
            default: state <= S0;
        endcase
    end

    always @ (state) begin
        case (state)
            S0: begin #1 reset8 = 1; reset4 = 1; reset_reg = 1; reset_counter = 0; Load = 0; ld1 = 0; wr = 0; rd = 0; en = 1; end
            S1: begin #1 reset8 = 0; reset4 = 0; reset_reg = 0; end
            S2: begin #1 Load = 1; end
            S3: begin #1 ld1 = 1; end
            S4: begin #1 ld1 = 1; wr = 1; reset_counter = 1; end
            S5: begin #1 wr = 0; rd = 1; reset_counter = 0; end
            S6: begin #1 rd = 1; end
            S7: rd = 0;
            default: #1 begin reset8 = 1; reset4 = 1; reset_reg = 1; reset_counter = 0; Load = 0; ld1 = 0; wr = 0; rd = 0; en = 1; end
        endcase
    end

endmodule
