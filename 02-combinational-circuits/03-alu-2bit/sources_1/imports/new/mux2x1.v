`timescale 1ns / 1ps

module mux2x1(
    input a,b,sel,
    output f
    );
    
    assign f= sel ? b:a;

endmodule
