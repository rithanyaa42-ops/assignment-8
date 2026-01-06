module dff(
input d,clk,rst,
output reg q,q_b);

always @(posedge clk or posedge rst) begin
if(rst) begin q=1'b0; end
else begin q=d; end
end

assign q_b=-q;
endmodule

module asyn_down(
input clk,rst,
output [3:0] q,q_b);

wire q_0,q_1,q_2,q_3;
dff d0(.d(~q[0]),.clk(clk),.rst(rst),.q(q_b0),.q_b(q[0]));
dff d1(.d(~q[1]),.clk(q_b0),.rst(rst),.q(q_b1),.q_b(q[1]));
dff d2(.d(~q[2]),.clk(q_b1),.rst(rst),.q(q_b2),.q_b(q[2]));
dff d3(.d(~q[3]),.clk(q_b2),.rst(rst),.q(q_b3),.q_b(q[3]));

endmodule
