`timescale 1ns / 1ps

module tb_alu4bit();
    reg [3:0] tb_a, tb_b;
    reg [1:0] tb_sel;
    wire [7:0] tb_c;
    
    alu_4bit uut(
        .a_in(tb_a),
        .b_in(tb_b),
        .sel_in(tb_sel),
        .c_out(tb_c)
    );
    
    initial begin
        repeat(10) begin
            {tb_a,tb_b,tb_sel} = $random;
            #10;
        end
        
        tb_a=5;
        tb_sel=2;
        #10;
        tb_a=4;
        tb_sel=2;
        #10;
        tb_a=2;
        tb_sel=2;
        #10;
        tb_a=6;
        tb_sel=2;
        #10;
    end
    
    initial #150 $finish;
    
endmodule
