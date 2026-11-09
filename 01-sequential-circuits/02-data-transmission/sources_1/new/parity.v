//8-bitin gönderilme biçimi
//parity_type=0 ise çift parity gönder
//parity_type=1 ise tek parity gönder

module parity(
    input clk,rst, parity_type,
    input [7:0] data_in,
    output [8:0] data_out,
    output parity_ok_out,
    output [1:0] durum_out
    );
    
    reg [7:0] dix;
    reg [8:0] dox;
    reg [1:0] durum;
    reg pa_typex;
    reg pa_okx;
    
    wire parity_bit;
    xor_parity uut(
        .pa_in(dix),
        .pa_out(parity_bit)
    );
    
    assign durum_out=durum;
    assign data_out = dox;
    assign parity_ok_out = pa_okx;
    
    always@(posedge clk)
    begin
        if(rst==1'b0) begin
            durum<=0;
        end
        else begin
            case(durum)
                0: begin
                    dix<=data_in;
                    pa_okx<=0;
                    pa_typex <= parity_type;
                    durum<=1;
                end
                
                1: begin
                    case(pa_typex)
                        //çift parity gönder
                        0: begin
                            if(parity_bit==1'b0)                            
                                dox <= {1'b0,dix};
                            else
                                dox <= {1'b1,dix};
                        end
                        //tek parity gönder
                        1: begin
                            if(parity_bit==1'b0)                            
                                dox <= {1'b1,dix};
                            else
                                dox <= {1'b0,dix};
                        end                     
                    endcase
                    pa_okx <= 1;
                    durum<=2;
                end
                2: begin
                    pa_okx <= 0;
                end
            endcase
        end
    end
endmodule
