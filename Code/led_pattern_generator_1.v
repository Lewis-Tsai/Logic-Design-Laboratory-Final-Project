module led_pattern_generator_1(
    input clk,
    input rst,
    output reg[15:0] led
);
reg [3:0] count, next_count;
always @(*) begin
    if(count == 8)
        next_count = 0;
    else
        next_count = count + 1;
end
always @(posedge clk, posedge rst) begin
    if(rst)
        count <= 0;
    else
        count <= next_count;
end

always @(*) begin
    if(count == 0) led = 16'b0000_0000_0000_0000;  
    else if(count == 1) led = 16'b0000_0001_1000_0000;  
    else if(count == 2) led = 16'b0000_0011_1100_0000;  
    else if(count == 3) led = 16'b0000_0111_1110_0000; 
    else if(count == 4) led = 16'b0000_1111_1111_0000;   
    else if(count == 5) led = 16'b0001_1111_1111_1000;   
    else if(count == 6) led = 16'b0011_1111_1111_1100;   
    else if(count == 7) led = 16'b0111_1111_1111_1110;   
    else led = 16'b1111_1111_1111_1111;
end
endmodule