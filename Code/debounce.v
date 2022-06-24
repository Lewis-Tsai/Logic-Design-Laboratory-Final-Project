module debounce(
    input pb,
    input clk,
    output pb_debounced
);
reg [3:0] shiftreg;
    
always @(posedge clk)begin
    shiftreg[3:1]<=shiftreg[2:0];
    shiftreg[0]<=pb;
end
 
assign pb_debounced=(shiftreg==4'b1111)?1'b1:1'b0;
    
endmodule