module jk_ff (
input J, K, clk, reset,
output reg Q,
output Qbar);

assign Qbar = ~Q;

always @(posedge clk or posedge reset) begin
if (reset)
Q <= 1'b0;
else begin
case ({J,K})
2'b00: Q <= Q;
2'b01: Q <= 1'b0;
2'b10: Q <= 1'b1;
2'b11: Q <= ~Q;
endcase
end
end

endmodule
module sync_down (
input clk, reset,
output wire [3:0] Q);

wire w1, w2;
wire [3:0] Qbar;


assign w1 = Qbar[0];                    
assign w2 = Qbar[0] & Qbar[1];          


jk_ff FF0 (.J(1'b1),.K(1'b1),.clk(clk),.reset(reset),.Q(Q[0]),.Qbar(Qbar[0]));
jk_ff FF1 (.J(Qbar[0]),.K(Qbar[0]),.clk(clk),.reset(reset),.Q(Q[1]),.Qbar(Qbar[1]));
jk_ff FF2 (.J(w2),.K(w2),.clk(clk),.reset(reset),.Q(Q[2]),.Qbar(Qbar[2]));
jk_ff FF3 (.J(w2 & Qbar[2]),.K(w2 & Qbar[2]),.clk(clk),.reset(reset),.Q(Q[3]),.Qbar(Qbar[3]));

endmodule
