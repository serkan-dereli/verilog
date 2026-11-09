
module kare_al(
    input a,b,
    output f0,f1,f2,f3
    );
    
    wire a_degil,b_degil,t1,t2;
    
    //f0 alde edildi
    not(a_degil,a);
    not(b_degil,b);
    and(t2,a_degil,b);
    and(t1,a,b);
    or(f0,t1,t2);
    
    //f1 elde edildi
    and(f1,a_degil,a);
    
    //f2 elde edildi
    and(f2,b_degil,a);
    
    //f3 elde edildi
    and(f3,a,b);
        
endmodule
