module be_asyn_up(
input clk,rst,
output reg [3:0] q);

always @(posedge clk or posedge rst) begin
if(rst) begin q=4'b0000; end
else begin q= q+1; end
end
endmodule
