module memory 
#(
  parameter NUM_REGS = 32, 
  parameter SIZE = 32
)(
  input clk,
  input rst,
  input  [6:0]  wr_addr,
  input         wr_en,
  input  [31:0] wr_data,
  input  [6:0]  rd_addr,
  output [31:0] rd_data

);
  
    logic [SIZE-1:0] rf [NUM_REGS-1:0];
  
    integer i;
	 always_ff @ (posedge clk) begin
      if (rst) begin
			for (i = 0; i < NUM_REGS; i = i + 1)
				rf[i] <= 9'h 141;
		end
		else  if (wr_en)
        rf[wr_addr] <= wr_data;
		
	end
	
    assign rd_data = rf[rd_addr - 6];

endmodule 