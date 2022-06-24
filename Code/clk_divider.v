module clk_divider(
    input clk,
    output reg clk_div_1,
    output reg clk_div_2,
    output reg clk_div_3
);
parameter n = 28;
reg [n-1:0] count_1, count_2, count_3;
wire [n-1:0] next_count_1, next_count_2, next_count_3;

initial begin
    clk_div_1 = 0;
    clk_div_2 = 0;
    clk_div_3 = 0;

    count_1 = 0;
    count_2 = 0;
    count_3 = 0;
end

assign next_count_1 = count_1 + 1;
assign next_count_2 = count_2 + 1;
assign next_count_3 = count_3 + 1;

always @(posedge clk) begin
    if(count_1 == 50000000) begin
        clk_div_1 <= ~clk_div_1;
        count_1 <= 0;
    end else
        count_1 <= next_count_1;
end
always @(posedge clk) begin
    if(count_2 == 80000000) begin
        clk_div_2 <= ~clk_div_2;
        count_2 <= 0;
    end else
        count_2 <= next_count_2;
end
always @(posedge clk) begin
    if(count_3 == 110000000) begin
        clk_div_3 <= ~clk_div_3;
        count_3 <= 0;
    end else
        count_3 <= next_count_3;
end
endmodule