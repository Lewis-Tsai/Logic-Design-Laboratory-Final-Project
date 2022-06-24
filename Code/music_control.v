module music_control (
	input clk, 
	input en,
	input rst,
	output reg [11:0] ibeat
);
	parameter LEN = 4095;
    reg [11:0] next_ibeat;
    reg [3:0] next_cnt;
	always @(posedge clk, posedge rst) begin
		if (rst)
			ibeat <= 0;
		else
            ibeat <= next_ibeat;
	end
	always @* begin
        if(en) begin
            if(ibeat + 1 < LEN)
                next_ibeat = ibeat + 1;
            else
                next_ibeat = 0;
        end else
            next_ibeat = 0;
    end

endmodule