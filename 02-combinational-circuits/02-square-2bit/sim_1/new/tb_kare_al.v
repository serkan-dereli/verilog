`timescale 1ns / 1ps

module tb_kare_al();
    reg tb_a,tb_b;
    wire tb_f0,tb_f1,tb_f2,tb_f3;
    
    kare_al uut(
        .a(tb_a),
        .b(tb_b),
        .f0(tb_f0),
        .f1(tb_f1),
        .f2(tb_f2),
        .f3(tb_f3)
    );
    
    initial begin
        tb_a=0; tb_b=0;
        #10;
        tb_a=1; tb_b=0;
        #10;
        tb_a=1; tb_b=1;
        #10;
        tb_a=0; tb_b=1;
    end
    
    initial #60 $finish;
    
endmodule
