module coklayici ( 
    input [7:0] a, b,c,d,                    
    input [1:0] sel,               
    output [7:0] cik);            

    //sel=0 --> a
    //sel=1--> b
    //sel=2--> c
    //sel=3--> d
    assign cik = sel[1] ? (sel[0] ? d : c) : (sel[0] ? b : a);
endmodule