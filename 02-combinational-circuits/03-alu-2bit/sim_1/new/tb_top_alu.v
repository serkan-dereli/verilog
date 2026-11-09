`timescale 1ns / 1ps

module tb_top_alu();
    reg [1:0] tb_a,tb_b;
    reg tb_sel;
    wire [2:0] tb_toplam,tb_out,tb_fark;
    
    top_alu uut(
        .a(tb_a),
        .b(tb_b),
        .sel(tb_sel),
        .out(tb_out),
        .toplam(tb_toplam),
        .fark(tb_fark)
    );
    
    initial begin
        repeat(10) begin
            {tb_a,tb_b,tb_sel}=$random;
            #10;
        end
    end
    
    initial #110 $finish;
endmodule
