
module xor_parity(
    input [7:0] pa_in,
    output pa_out
    );
    
    assign pa_out = pa_in[0] ^ pa_in[1] ^ 
                    pa_in[2] ^ pa_in[3] ^
                    pa_in[4] ^ pa_in[5] ^
                    pa_in[6] ^ pa_in[7];
endmodule
