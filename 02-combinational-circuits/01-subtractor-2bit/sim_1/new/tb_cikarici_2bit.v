`timescale 1ns / 1ps

module tb_cikarici_2bit();
    reg [1:0] tb_a,tb_b;
    reg tb_bin;
    wire tb_bout;
    wire [1:0] tb_d;
    wire [2:0] tb_sonuc;
    
    cikarici_2bit uut(
        .a(tb_a),
        .b(tb_b),
        .bin(tb_bin),
        .d(tb_d),
        .bout(tb_bout)
    );
    
    assign tb_sonuc={tb_bout,tb_d};
    
    initial begin
        repeat(10) begin
            {tb_a,tb_b,tb_bin}=$random;
            #50;
        end
        tb_a=2'b10;
        tb_b=2'b11;
        tb_bin=0;
        #50;
        
        tb_a=2'b10;
        tb_b=2'b11;
        tb_bin=1;
        #50;
    end
endmodule
