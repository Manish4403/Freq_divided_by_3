`timescale 1ns / 1ps


module freq_div(clk, reset, out1, out2, out3);
    input clk, reset;
    output out1, out2, out3;
    
    reg q1, q0, q2;
    
    always@(posedge clk)
    begin
        if(reset) begin
            q1 <= 1'b0;
            q0 <= 1'b0;
            end
        else begin
            q0 <= ~(q1 ^ q0);
            q1 <= q0;
            end
    end
    
    assign out1 = q0;
    
    always@(negedge clk) begin
        if(reset)
            q2 <= 1'b0;
        else
            q2 <= q0;
    end
    
    assign out2 = q2;
    
    assign out3 = out1 | out2;
    
endmodule
