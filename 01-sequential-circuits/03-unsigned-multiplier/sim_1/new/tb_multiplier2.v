`timescale 1ns / 1ns

module tb_multiplier2();
    parameter n=5;
    
    reg tb_clk,tb_rst;
    reg [n-1:0] tb_m,tb_q;
    wire [2:0] tb_durum;
    wire [2*n-1:0] tb_p;
    wire tb_ok;
    reg ok;
    reg [n:0] k=0;
    
    integer i=0;
    reg [n-1:0] array_m [0:4];
    reg [n-1:0] array_q [0:4];     
    
    multiplier2 #(.n(n)) 
    uut(
        .clk(tb_clk),
        .rst(tb_rst),
        .m_in(tb_m),
        .q_in(tb_q),
        .durum_out(tb_durum),
        .result_ok_out(tb_ok),
        .p_out(tb_p)
    );
    
    task dizi_doldur();
    begin
        array_m[0]=15;
        array_m[1]=12;
        array_m[2]=20;
        array_m[3]=18;
        array_m[4]=10;
        array_q[0]=9;
        array_q[1]=13;
        array_q[2]=5;
        array_q[3]=8;
        array_q[4]=7;
    end
    endtask
    task baslat();
    begin                   
        k=0;
        ok=0;        
        tb_m=array_m[i];
        tb_q=array_q[i];
        i=i+1;
        tb_rst=0;
        #15;
        tb_rst=1;        
    end
    endtask 
     
    initial begin
        dizi_doldur;
        tb_clk=0;
        forever #5 tb_clk=~tb_clk;
        tb_rst=0;             
    end
   
    always @(posedge tb_clk) begin
        k=k+1;
        ok=tb_ok;
        if(k>23) begin
            baslat;
        end        
    end    
    
    initial #1000 $finish;
   
endmodule
