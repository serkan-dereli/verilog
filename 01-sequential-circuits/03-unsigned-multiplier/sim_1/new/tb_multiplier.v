`timescale 1ns / 1ps

module tb_multiplier();
    reg tb_clk,tb_rst;
    reg [3:0] tb_m,tb_q;
    wire [2:0] tb_durum;
    wire [7:0] tb_p;
    wire tb_ok;
    reg ok;
    reg [4:0] k=0;  
    
    multiplier uut(
        .clk(tb_clk),
        .rst(tb_rst),
        .m_in(tb_m),
        .q_in(tb_q),
        .durum_out(tb_durum),
        .result_ok_out(tb_ok),
        .p_out(tb_p)
    );
    
    task baslat();
    begin                   
        k=0;
        ok=0;
        tb_m=$random;
        tb_q=$random;
        tb_rst=0;
        #15;
        tb_rst=1;        
    end
    endtask 
     
    initial begin
        tb_clk=0;
        forever #5 tb_clk=~tb_clk;
        tb_rst=0;
        //baslat;       
    end
   
    always @(posedge tb_clk) begin
        k=k+1;
        ok=tb_ok;
        if(k>20) begin
            baslat;
        end        
    end    
    
    initial #3000 $finish;
   
endmodule
