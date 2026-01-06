module jk_ff (
    input j,
    input k,
    input clk,
    input rst,
    output reg q);

always @(posedge clk or posedge rst)
begin
    if (rst)
        q <= 1'b0;
    else
        case ({j,k})
            2'b00: q <= q;      
            2'b01: q <= 1'b0;   
            2'b10: q <= 1'b1;   
            2'b11: q <= ~q;  
        endcase
end

endmodule

module sync_up_4 (
    input clk,
    input rst,
    output [3:0] q
);

wire j0, k0;
wire j1, k1;
wire j2, k2;
wire j3, k3;

wire w1, w2;

assign j0 = 1'b1;
assign k0 = 1'b1;

assign j1 = q[0];
assign k1 = q[0];

and (w1, q[0], q[1]);
assign j2 = w1;
assign k2 = w1;

and (w2, q[0], q[1], q[2]);
assign j3 = w2;
assign k3 = w2;

jk_ff ff0 (j0, k0, clk, rst, q[0]);
jk_ff ff1 (j1, k1, clk, rst, q[1]);
jk_ff ff2 (j2, k2, clk, rst, q[2]);
jk_ff ff3 (j3, k3, clk, rst, q[3]);

endmodule
