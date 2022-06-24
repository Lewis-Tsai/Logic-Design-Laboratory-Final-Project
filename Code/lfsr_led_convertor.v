module lfsr_led_convertor(
    input [3:0] lfsr_data,
    input [3:0] curr_state,
    input lfsr_en,
    input [1:0] led_num,
    output reg [15:0] led,
    output reg [3:0] led_index_1,
    output reg [3:0] led_index_2,
    output reg [3:0] led_index_3
);
always @(*) begin
    if (lfsr_en) begin
        led [0] = 0;
        led [15:13] = 0;

        //some values are according to random number generator, meaningless number assignment
        if(lfsr_data == 0) begin
            if(led_num == 1) begin
                led [5:1] = 0;
                led [6] = 1;
                led [12:7] = 0;
                led_index_1 = 6;
                led_index_2 = 0;
                led_index_3 = 0;
            end else if(led_num == 2) begin
                led [1] = 0;
                led [2] = 1;
                led [5:3] = 0;
                led [6] = 1;
                led [12:7] = 0;
                led_index_1 = 6;
                led_index_2 = 2;
                led_index_3 = 0;
            end else if(led_num == 3) begin
                led [2:1] = 0;
                led [3] = 1;
                led [5:4] = 0;
                led [6] = 1;
                led [8:7] = 0;
                led [9] = 1;
                led [12:10] = 0;
                led_index_1 = 6;
                led_index_2 = 3;
                led_index_3 = 9;
            end else begin
                led [12:1] = 12'b1111_1111_1111;
                led_index_1 = 0;
                led_index_2 = 0;
                led_index_3 = 0;
            end
        end else if(lfsr_data == 1) begin 
            if(led_num == 1) begin
                led [1] = 1;
                led [12:2] = 0;
                led_index_1 = 1;
                led_index_2 = 0;
                led_index_3 = 0;
            end else if(led_num == 2) begin
                led [1] = 1;
                led [9:2] = 0;
                led [10] = 1;
                led [12:11] = 0;
                led_index_1 = 1;
                led_index_2 = 10;
                led_index_3 = 0;
            end else if(led_num == 3) begin
                led [1] = 1;
                led [5:2] = 0;
                led [6] = 1;
                led [7] = 0;
                led [8] = 1;
                led [12:9] = 0;
                led_index_1 = 1;
                led_index_2 = 6;
                led_index_3 = 8;
            end else begin
                led [12:1] = 12'b1111_1111_1111;
                led_index_1 = 0;
                led_index_2 = 0;
                led_index_3 = 0;
            end
        end else if(lfsr_data == 2) begin
            if(led_num == 1) begin
                led [1] = 0;
                led [2] = 1;
                led [12:3] = 0;
                led_index_1 = 2;
                led_index_2 = 0;
                led_index_3 = 0;
            end else if(led_num == 2) begin
                led [1] = 0;
                led [2] = 1;
                led [9:3] = 0;
                led [10] = 1;
                led [12:11] = 0;
                led_index_1 = 2;
                led_index_2 = 10;
                led_index_3 = 0;
            end else if(led_num == 3) begin
                led [1] = 1;
                led [2] = 1;
                led [5:3] = 0;
                led [6] = 1;
                led [12:7] = 0;
                led_index_1 = 2;
                led_index_2 = 1;
                led_index_3 = 6;
            end else begin
                led [12:1] = 12'b1111_1111_1111;
                led_index_1 = 0;
                led_index_2 = 0;
                led_index_3 = 0;
            end
        end else if(lfsr_data == 3) begin
            if(led_num == 1) begin
                led [2:1] = 0;
                led [3] = 1;
                led [12:4] = 0;
                led_index_1 = 3;
                led_index_2 = 0;
                led_index_3 = 0;
            end else if(led_num == 2) begin
                led [1] = 0;
                led [2] = 1;
                led [3] = 1;
                led [12:4] = 0;
                led_index_1 = 3;
                led_index_2 = 2;
                led_index_3 = 0;
            end else if(led_num == 3) begin
                led [1] = 0;
                led [2] = 1;
                led [3] = 1;
                led [11:4] = 0;
                led [12] = 1;
                led_index_1 = 3;
                led_index_2 = 2;
                led_index_3 = 12;
            end else begin
                led [12:1] = 12'b1111_1111_1111;
                led_index_1 = 0;
                led_index_2 = 0;
                led_index_3 = 0;
            end
        end else if(lfsr_data == 4) begin
            if(led_num == 1) begin
                led [3:1] = 0;
                led [4] = 1;
                led [12:5] = 0;
                led_index_1 = 4;
                led_index_2 = 0;
                led_index_3 = 0;
            end else if(led_num == 2) begin
                led [2:1] = 0;
                led [3] = 1;
                led [4] = 1;
                led [12:5] = 0;
                led_index_1 = 4;
                led_index_2 = 3;
                led_index_3 = 0;
            end else if(led_num == 3) begin
                led [3:1] = 0;
                led [4] = 1;
                led [5] = 1;
                led [6] = 0;
                led [7] = 1;
                led [12:8] = 0;
                led_index_1 = 4;
                led_index_2 = 5;
                led_index_3 = 7;
            end else begin
                led [12:1] = 12'b1111_1111_1111;
                led_index_1 = 0;
                led_index_2 = 0;
                led_index_3 = 0;
            end
        end else if(lfsr_data == 5) begin
            if(led_num == 1) begin
                led [4:1] = 0;
                led [5] = 1;
                led [12:6] = 0;
                led_index_1 = 5;
                led_index_2 = 0;
                led_index_3 = 0;
            end else if(led_num == 2) begin
                led [4:1] = 0;
                led [5] = 1;
                led [6] = 1;
                led [12:7] = 0;
                led_index_1 = 5;
                led_index_2 = 6;
                led_index_3 = 0;
            end else if(led_num == 3) begin
                led [1] = 1;
                led [4:2] = 0;
                led [5] = 1;
                led [7:6] = 1;
                led [8] = 1;
                led [12:9] = 0;
                led_index_1 = 5;
                led_index_2 = 1;
                led_index_3 = 8;
            end else begin
                led [12:1] = 12'b1111_1111_1111;
                led_index_1 = 0;
                led_index_2 = 0;
                led_index_3 = 0;
            end
        end else if(lfsr_data == 6) begin
            if(led_num == 1) begin
                led [5:1] = 0;
                led [6] = 1;
                led [12:7] = 0;
                led_index_1 = 6;
                led_index_2 = 0;
                led_index_3 = 0;
            end else if(led_num == 2) begin
                led [1] = 0;
                led [2] = 1;
                led [5:3] = 0;
                led [6] = 1;
                led [12:7] = 0;
                led_index_1 = 6;
                led_index_2 = 2;
                led_index_3 = 0;
            end else if(led_num == 3) begin
                led [4:1] = 0;
                led [5] = 1;
                led [6] = 1;
                led [11:7] = 0;
                led [12] = 1;
                led_index_1 = 6;
                led_index_2 = 5;
                led_index_3 = 12;
            end else begin
                led [12:1] = 12'b1111_1111_1111;
                led_index_1 = 0;
                led_index_2 = 0;
                led_index_3 = 0;
            end
        end else if(lfsr_data == 7) begin
            if(led_num == 1) begin
                led [6:1] = 0;
                led [7] = 1;
                led [12:8] = 0;
                led_index_1 = 7;
                led_index_2 = 0;
                led_index_3 = 0;
            end else if(led_num == 2) begin
                led [4:1] = 0;
                led [5] = 1;
                led [6] = 0;
                led [7] = 1;
                led [12:8] = 0;
                led_index_1 = 7;
                led_index_2 = 5;
                led_index_3 = 0;
            end else if(led_num == 3) begin
                led [4:1] = 0;
                led [5] = 1;
                led [6] = 0;
                led [7] = 1;
                led [8] = 1;
                led [12:9] = 0;
                led_index_1 = 7;
                led_index_2 = 5;
                led_index_3 = 8;
            end else begin
                led [12:1] = 12'b1111_1111_1111;
                led_index_1 = 0;
                led_index_2 = 0;
                led_index_3 = 0;
            end
        end else if(lfsr_data == 8) begin
            if(led_num == 1) begin
                led [7:1] = 0;
                led [8] = 1;
                led [12:9] = 0;
                led_index_1 = 8;
                led_index_2 = 0;
                led_index_3 = 0;
            end else if(led_num == 2) begin
                led [7:1] = 0;
                led [8] = 1;
                led [10:9] = 0;
                led [11] = 1;
                led [12] = 0;
                led_index_1 = 8;
                led_index_2 = 11;
                led_index_3 = 0;
            end else if(led_num == 3) begin
                led [3:1] = 0;
                led [4] = 1;
                led [6:5] = 0;
                led [7] = 1;
                led [8] = 1;
                led [12:9] = 0;
                led_index_1 = 8;
                led_index_2 = 4;
                led_index_3 = 7;
            end else begin
                led [12:1] = 12'b1111_1111_1111;
                led_index_1 = 0;
                led_index_2 = 0;
                led_index_3 = 0;
            end
        end else if(lfsr_data == 9) begin
            if(led_num == 1) begin
                led [8:1] = 0;
                led [9] = 1;
                led [12:10] = 0;
                led_index_1 = 9;
                led_index_2 = 0;
                led_index_3 = 0;
            end else if(led_num == 2) begin
                led [8:1] = 0;
                led [9] = 1;
                led [10] = 1;
                led [12:11] = 0;
                led_index_1 = 9;
                led_index_2 = 10;
                led_index_3 = 0;
            end else if(led_num == 3) begin
                led [1] = 1;
                led [3:2] = 0;
                led [4] = 1;
                led [8:5] = 0;
                led [9] = 1;
                led [12:10] = 0;
                led_index_1 = 9;
                led_index_2 = 1;
                led_index_3 = 4;
            end else begin
                led [12:1] = 12'b1111_1111_1111;
                led_index_1 = 0;
                led_index_2 = 0;
                led_index_3 = 0;
            end
        end else if(lfsr_data == 10) begin
            if(led_num == 1) begin
                led [9:1] = 0;
                led [10] = 1;
                led [12:11] = 0;
                led_index_1 = 10;
                led_index_2 = 0;
                led_index_3 = 0;
            end else if(led_num == 2) begin
                led [8:1] = 0;
                led [9] = 1;
                led [10] = 1;
                led [12:11] = 0;
                led_index_1 = 10;
                led_index_2 = 9;
                led_index_3 = 0;
            end else if(led_num == 3) begin
                led [6:1] = 0;
                led [7] = 1;
                led [8] = 0;
                led [9] = 1;
                led [10] = 1;
                led [12:11] = 0;
                led_index_1 = 10;
                led_index_2 = 7;
                led_index_3 = 9;
            end else begin
                led [12:1] = 12'b1111_1111_1111;
                led_index_1 = 0;
                led_index_2 = 0;
                led_index_3 = 0;
            end
        end else if(lfsr_data == 11) begin
            if(led_num == 1) begin
                led [10:1] = 0;
                led [11] = 1;
                led [12] = 0;
                led_index_1 = 11;
                led_index_2 = 0;
                led_index_3 = 0;
            end else if(led_num == 2) begin
                led [3:1] = 0;
                led [4] = 1;
                led [10:5] = 0;
                led [11] = 1;
                led [12] = 0;
                led_index_1 = 11;
                led_index_2 = 4;
                led_index_3 = 0;
            end else if(led_num == 3) begin
                led [5:1] = 0;
                led [6] = 1;
                led [8:7] = 0;
                led [9] = 1;
                led [10] = 0;
                led [11] = 1;
                led [12] = 0;
                led_index_1 = 11;
                led_index_2 = 6;
                led_index_3 = 9;
            end else begin
                led [12:1] = 12'b1111_1111_1111;
                led_index_1 = 0;
                led_index_2 = 0;
                led_index_3 = 0;
            end
        end else if(lfsr_data == 12) begin
            if(led_num == 1) begin
                led [11:1] = 0;
                led [12] = 1;
                led_index_1 = 12;
                led_index_2 = 0;
                led_index_3 = 0;
            end else if(led_num == 2) begin
                led [6:1] = 0;
                led [7] = 1;
                led [11:8] = 0;
                led [12] = 1;
                led_index_1 = 12;
                led_index_2 = 7;
                led_index_3 = 0;
            end else if(led_num == 3) begin
                led [1] = 0;
                led [2] = 1;
                led [9:3] = 0;
                led [10] = 1;
                led [11] = 0;
                led [12] = 1;
                led_index_1 = 12;
                led_index_2 = 2;
                led_index_3 = 10;
            end else begin
                led [12:1] = 12'b1111_1111_1111;
                led_index_1 = 0;
                led_index_2 = 0;
                led_index_3 = 0;
            end
        end else if(lfsr_data == 13) begin
            if(led_num == 1) begin
                led [1] = 1;
                led [12:2] = 0;
                led_index_1 = 1;
                led_index_2 = 0;
                led_index_3 = 0;
            end else if(led_num == 2) begin
                led [1] = 1;
                led [3:2] = 0;
                led [4] = 1;
                led [12:5] = 0;
                led_index_1 = 1;
                led_index_2 = 4;
                led_index_3 = 0;
            end else if(led_num == 3) begin
                led [1] = 1;
                led [2] = 1;
                led [3] = 1;
                led [12:4] = 0;
                led_index_1 = 1;
                led_index_2 = 2;
                led_index_3 = 3;
            end else begin
                led [12:1] = 12'b1111_1111_1111;
                led_index_1 = 0;
                led_index_2 = 0;
                led_index_3 = 0;
            end
        end else if(lfsr_data == 14) begin
            if(led_num == 1) begin
                led [4:1] = 0;
                led [5] = 1;
                led [12:6] = 0;
                led_index_1 = 5;
                led_index_2 = 0;
                led_index_3 = 0;
            end else if(led_num == 2) begin
                led [4:1] = 0;
                led [5] = 1;
                led [10:6] = 0;
                led [11] = 1;
                led [12] = 0;
                led_index_1 = 5;
                led_index_2 = 11;
                led_index_3 = 0;
            end else if(led_num == 3) begin
                led [3:1] = 0;
                led [4] = 1;
                led [5] = 1;
                led [7:6] = 0;
                led [8] = 1;
                led [12:9] = 0;
                led_index_1 = 5;
                led_index_2 = 4;
                led_index_3 = 8;
            end else begin
                led [12:1] = 12'b1111_1111_1111;
                led_index_1 = 0;
                led_index_2 = 0;
                led_index_3 = 0;
            end
        end else if(lfsr_data == 15) begin
            if(led_num == 1) begin
                led [7:1] = 0;
                led [8] = 1;
                led [12:9] = 0;
                led_index_1 = 8;
                led_index_2 = 0;
                led_index_3 = 0;
            end else if(led_num == 2) begin
                led [4:1] = 0;
                led [5] = 1;
                led [7:6] = 0;
                led [8] = 1;
                led [12:9] = 0;
                led_index_1 = 8;
                led_index_2 = 5;
                led_index_3 = 0;
            end else if(led_num == 3) begin
                led [3:1] = 0;
                led [4] = 1;
                led [5] = 1;
                led [7:6] = 0;
                led [8] = 1;
                led [12:9] = 0;
                led_index_1 = 8;
                led_index_2 = 4;
                led_index_3 = 5;
            end else begin
                led [12:1] = 12'b1111_1111_1111;
                led_index_1 = 0;
                led_index_2 = 0;
                led_index_3 = 0;
            end
        end else begin
            led [12:1] = 12'b1111_1111_1111;
            led_index_1 = 0;
            led_index_2 = 0;
            led_index_3 = 0;
        end        
        
    end else begin
        led = curr_state;
        led_index_1 = 0;
        led_index_2 = 0;
        led_index_3 = 0;
    end
end
endmodule