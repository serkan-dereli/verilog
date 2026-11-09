
module top_alu(
    input [1:0] a,b,
    input sel,
    output [2:0] out,
    output [2:0] toplam,
    output [2:0] fark
    );
    
    //toplayýcý ara teller
    wire c0;
    
    //çýkarýcý ara teller
    wire b0;
    
    //top modül için ara teller
    wire [2:0] toplam_sonuc;
    wire [2:0] fark_sonuc;
    
    assign toplam=toplam_sonuc;
    assign fark=fark_sonuc;
    
    tam_toplayici s_0(
        .a(a[0]),
        .b(b[0]),
        .cin(cin),
        .s(toplam_sonuc[0]),
        .cout(c0)
    );
    
    tam_toplayici s_1(
        .a(a[1]),
        .b(b[1]),
        .cin(c0),
        .s(toplam_sonuc[1]),
        .cout(toplam_sonuc[2])
    );
    
    tam_cikarici d_0(
        .a(a[0]),
        .b(b[0]),
        .bin(0),
        .d(fark_sonuc[0]),
        .bout(b0)
    );
    
    tam_cikarici d_1(
        .a(a[1]),
        .b(b[1]),
        .bin(b0),
        .d(fark_sonuc[1]),
        .bout(fark_sonuc[2])
    );
    
    mux2x1 out_0(
        .a(toplam_sonuc[0]),
        .b(fark_sonuc[0]),
        .sel(sel),
        .f(out[0])
    );
    
    mux2x1 out_1(
        .a(toplam_sonuc[1]),
        .b(fark_sonuc[1]),
        .sel(sel),
        .f(out[1])
    );
    
    mux2x1 out_2(
        .a(toplam_sonuc[2]),
        .b(fark_sonuc[2]),
        .sel(sel),
        .f(out[2])
    );
    
endmodule
