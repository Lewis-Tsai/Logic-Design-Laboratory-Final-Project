module keyboard_value_converter(
    input [7:0] last_change,
    output reg [7:0] keyboard_value
);

always @(*) begin
    case(last_change)
        16'h15: keyboard_value = 12; //Q
        16'h1D: keyboard_value = 11; //W
        16'h24: keyboard_value = 10; //E
        16'h2D: keyboard_value = 9; //R
        16'h2C: keyboard_value = 8; //T
        16'h35: keyboard_value = 7; //Y
        16'h3C: keyboard_value = 6; //U
        16'h43: keyboard_value = 5; //I
        16'h44: keyboard_value = 4; //O
        16'h4D: keyboard_value = 3; //P
        16'h54: keyboard_value = 2; //[
        16'h5B: keyboard_value = 1; //]
        default: keyboard_value = 0;
    endcase
end

endmodule