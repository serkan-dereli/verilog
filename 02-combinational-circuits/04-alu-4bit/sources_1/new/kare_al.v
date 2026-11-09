module kare_al(
        input [3:0] a,      // 4-bit giriþ
        output [7:0] s      // 8-bit çýkýþ
    );
    
    assign s[0]=a[0];
    assign s[1]=1'b0;
    assign s[2]=~a[0]&a[1];
    assign s[3]=(a[0]&a[1]&~a[2]) | (a[0]&~a[1]&a[2]);
    assign s[4]=(~a[0]&~a[1]&a[2]) | (a[0]&a[2]&~a[3]) | (a[0]&~a[2]&a[3]);
    assign s[5]=(a[1]&~a[2]&a[3]) | (a[1]&a[2]&~a[3]) | (a[0]&a[2]&a[3]);
    assign s[6]=(~a[2]&a[3]) | (a[1]&a[3]);
    assign s[7]=a[2]&a[3];    
    
endmodule