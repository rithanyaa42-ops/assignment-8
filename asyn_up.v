module dff(
input d,clk,rst,
output reg q,q_b);

always @(posedge clk or posedge rst) begin
if(rst) begin q=1'b0; end
else begin q=d; end
end

assign q_b=-q;
endmodule

module asyn_up(
input clk,rst,
output [3:0] q,q_b);

wire q_1,q_2,q_3,q_4;
dff d1(.d(1'b1),.clk(clk),.rst(rst),.q(q[0]),.q_b(q_1));
dff d2(.d(1'b1),.clk(q_1),.rst(rst),.q(q[1]),.q_b(q_2));
dff d3(.d(1'b1),.clk(q_2),.rst(rst),.q(q[2]),.q_b(q_3));
dff d4(.d(1'b1),.clk(q_3),.rst(rst),.q(q[3]),.q_b(q_4));

assign q_b=q_4;

endmodule
