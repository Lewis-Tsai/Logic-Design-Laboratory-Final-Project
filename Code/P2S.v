`timescale 1ns / 1ps
module P2S(
    input [15:0] in_left,
    input [15:0] in_right,
    input reset,
    input in_clk,
    input out_clk,
    output reg out
    );

reg [4:0] count, next;
reg [15:0] curr_in_left, curr_in_right;

// audio input data buffer
always @(posedge in_clk, posedge reset) begin
    if (reset) begin
        curr_in_left <= 0;
        curr_in_right <= 0;
    end else begin
        curr_in_left = in_left;
        curr_in_right = in_right;
    end
end

always @*
    next = count + 1'b1;
    
always @(posedge out_clk, posedge reset)
    if (reset)
        count <= 5'd0;
    else
        count <= next;

always @*
    case (count)
        5'b00000: out = curr_in_right[0];
        5'b00001: out = curr_in_left[15];
        5'b00010: out = curr_in_left[14];
        5'b00011: out = curr_in_left[13];
        5'b00100: out = curr_in_left[12];
        5'b00101: out = curr_in_left[11];
        5'b00110: out = curr_in_left[10];
        5'b00111: out = curr_in_left[9];
        5'b01000: out = curr_in_left[8];
        5'b01001: out = curr_in_left[7];
        5'b01010: out = curr_in_left[6];
        5'b01011: out = curr_in_left[5];
        5'b01100: out = curr_in_left[4];
        5'b01101: out = curr_in_left[3];
        5'b01110: out = curr_in_left[2];
        5'b01111: out = curr_in_left[1];
        5'b10000: out = curr_in_left[0];
        5'b10001: out = curr_in_right[15];
        5'b10010: out = curr_in_right[14];
        5'b10011: out = curr_in_right[13];
        5'b10100: out = curr_in_right[12];
        5'b10101: out = curr_in_right[11];
        5'b10110: out = curr_in_right[10];
        5'b10111: out = curr_in_right[9];
        5'b11000: out = curr_in_right[8];
        5'b11001: out = curr_in_right[7];
        5'b11010: out = curr_in_right[6];
        5'b11011: out = curr_in_right[5];
        5'b11100: out = curr_in_right[4];
        5'b11101: out = curr_in_right[3];
        5'b11110: out = curr_in_right[2];
        5'b11111: out = curr_in_right[1];
        default: out = 1'b0;
    endcase

endmodule
