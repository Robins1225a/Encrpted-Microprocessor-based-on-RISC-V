`timescale 1ns / 1ps



module clk_div_rc4(clk,reset,out1,out2
    );
    input clk,reset;
    output out1,out2;
    reg [1:0] temp;
    assign out1 = ~temp[0];
    assign out2 = ~out1;
    always @ (posedge clk or posedge reset)
    begin
        if(reset)
            temp <= 2'd0;
        else
            temp <= temp + 1'd1;
    end
    
endmodule
