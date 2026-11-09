`timescale 1ns / 1ps

module tb_cikarici();
    reg tb_a,tb_b,tb_bin;
    wire tb_bout,tb_d;
    
    //dut: design under test
    //uut: unit under test
    cikarici dut(
        .a(tb_a),
        .b(tb_b),
        .bin(tb_bin),
        .bout(tb_bout),
        .d(tb_d)        
    );
    
    initial begin
        repeat(10) begin
            {tb_a,tb_b,tb_bin}=$random;
            #50;
        end
    end
    initial #600 $finish;
endmodule
