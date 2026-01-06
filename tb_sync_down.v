`timescale 1ns/1ps
module tb_sync_down;
reg clk;
reg rst;
wire [3:0] q;

sync_down dut(.clk(clk),.rst(rst),.q(q));

always #5 clk = ~clk;

initial begin
	clk=0;
	rst=1;
	#10 rst=0;
	#200 $finish;
end

endmodule
