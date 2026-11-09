`timescale 1ns / 1ps

module tb_xor_parity();
    reg [7:0] tb_pi;
    wire tb_po;
    
    xor_parity uut(
        .pa_in(tb_pi),
        .pa_out(tb_po)
    );
    
    initial begin
        repeat(10) begin
            tb_pi = $random;
            #10;
        end
    end
    
    initial #100 $finish;
endmodule
