
module cikarici_2bit(
    input [1:0] a,b,
    input bin,
    output [1:0] d,
    output bout
    );
    
    wire bout_0;
    
    //0.bitler için
    cikarici bit_0(
        .a(a[0]),
        .b(b[0]),
        .bin(bin),
        .d(d[0]),
        .bout(bout_0)
    );
    
    //1.bitler için
    cikarici bit_1(
        .a(a[1]),
        .b(b[1]),
        .bin(bout_0),
        .d(d[1]),
        .bout(bout)
    );
endmodule
