`timescale 1ns / 1ps

module tb_parity();
    reg tb_clk, tb_rst, tb_parity_type;
    reg [7:0] tb_data_in;
    wire [8:0] tb_data_out;
    wire tb_parity_ok_out;
    wire [1:0] tb_durum;
    reg [3:0] k=0;
    
    parity p1(
        .clk(tb_clk),
        .rst(tb_rst),
        .parity_type(tb_parity_type),
        .data_in(tb_data_in),
        .data_out(tb_data_out),
        .parity_ok_out(tb_parity_ok_out),
        .durum_out(tb_durum)
    );
    
    task basla();
    begin
        tb_rst=0;
        tb_parity_type=$random;
        tb_data_in=$random;
        #15
        tb_rst=1;  
    end
    endtask
    
    initial begin     
        tb_clk=0;   
        //basla();
        forever #5 tb_clk=~tb_clk;        
    end
    
    always @(posedge tb_clk)
    begin
        k=k+1;
        if(k>2) begin
            k=0;
            basla;
        end
    end
    
    initial #1500 $finish;
endmodule
