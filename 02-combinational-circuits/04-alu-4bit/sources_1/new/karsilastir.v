module karsilastir (
    input [3:0] a, b,     // 4-bit girisler
    output [7:0] m        // Çýkýslar: Esit, Büyük, Küçük
);
    assign m[7:3] = 5'b00000;
    assign m[2] = (a == b);  // Esitlik kontrolü
    assign m[1] = (a > b);   // a büyüktür b kontrolü
    assign m[0] = (a < b);   // a küçüktür b kontrolü
endmodule
