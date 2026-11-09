module multiplier(
    input clk, rst,
    input [3:0] m_in,q_in,
    output [2:0] durum_out,
    output result_ok_out,
    output [7:0] p_out
    );
    
    localparam s0 = 3'b000;
    localparam s1 = 3'b001;
    localparam s2 = 3'b010;
    localparam s3 = 3'b011;
    localparam s4 = 3'b100;
    localparam s5 = 3'b101;
    
    reg [3:0] mx,qx,cnt;
    reg [4:0] a;
    reg [2:0] durum;
    reg [7:0] px;
    reg ok;
    
    assign p_out=px;
    assign durum_out=durum;
    assign result_ok_out=ok;
    
    always @(posedge clk)
    begin
        if (rst==1'b0) begin
            durum<=s0;
        end
        else begin
            case(durum)
                s0: begin //INIT
                    mx<=m_in;
                    qx<=q_in;
                    a<=0;
                    cnt<=0;
                    ok<=0;
                    durum<=s1;
                end
                
                s1: begin //ADD
                    //q0=1 mi?
                    if (qx[0]==1'b1) begin
                        a<=a+{1'b0,mx};
                    end
                    durum<=s2;
                end
                
                s2: begin //SHIFT
                    a<={1'b0,a[4:1]};
                    qx<={a[0],qx[3:1]};                    
                    durum<=s3;
                end
                
                s3: begin //INC_CNT
                    cnt<=cnt+1;
                    durum<=s4;
                end
                
                s4: begin //
                    if(cnt!=4) begin
                        durum<=s1;
                    end
                    else begin
                        durum<=s5;
                        ok<=1;
                    end
                end
                
                s5: begin //FINAL
                    px<={a[3:0],qx};
                    ok<=0;
                end
            endcase
        end
    end

endmodule