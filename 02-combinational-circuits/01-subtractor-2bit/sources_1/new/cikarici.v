
module cikarici(
    input a,b,bin,
    output d,bout    
    );
    
    assign d=bin^(a^b);
    assign bout=(~a&b)|(~(a^b)&bin);
endmodule
