
module alu_4bit(
    input [3:0] a_in,b_in,
    output [7:0] c_out,
    input [1:0] sel_in
    );
    
    wire [7:0] topla_sonuc,fark_sonuc,kare_sonuc,karsilastir_sonuc;
    
    topla islem1 (
        .a(a_in),
        .b(b_in),
        .sum(topla_sonuc)
    );
    
    cikar islem2 (
        .a(a_in),
        .b(b_in),
        .diff(fark_sonuc)
    );
    
    kare_al islem3 (
        .a(a_in),
        .s(kare_sonuc)
    );
    
    karsilastir islem4 (
        .a(a_in),
        .b(b_in),
        .m(karsilastir_sonuc)
    );
    
    coklayici islem5 (
        .a(topla_sonuc),   //toplama 
        .b(fark_sonuc),   //çýkarma
        .c(kare_sonuc),   //kare alma
        .d(karsilastir_sonuc),   //karsýlastýr
        .sel(sel_in),
        .cik(c_out)
    );
endmodule
