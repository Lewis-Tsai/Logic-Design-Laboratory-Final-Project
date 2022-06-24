`timescale 1ns / 100ps
module final_proejct(
    input clk,
    input rst,
    input music_en,
    inout PS2_DATA,
    inout PS2_CLK,
    input set_left,
    input set_right,
    input set_up,
    input set_down,
    input start_stop,
    output reg [3:0] DIGIT,
    output reg [7:0] DISPLAY,
    output reg [15:0] led,
    output audio_mclk,
    output audio_lrck,
    output audio_sclk,
    output audio_sdin
);
//display variable
reg [4:0] BCD0, BCD1, BCD2, BCD3, value;

//FSM variable
parameter WELCOME_PAGE = 4'b0000;
parameter GAME = 4'b001;
parameter AFTER_GAME = 4'b0010;
parameter RECORD_PAGE = 4'b0011;
parameter SETTING = 4'b0100;
parameter SET_ROUND = 4'b0101;
parameter SET_LIGHT_NUMBER = 4'b0110;
parameter SET_SPEED = 4'b0111;
parameter SET_VOLUME = 4'b1000;
reg [3:0] curr_state;
reg [3:0] next_state;

//music
wire [15:0] audio_in_left, audio_in_right;
wire [11:0] ibeatNum;
wire [21:0] freq_outL, freq_outR;
wire [31:0] freqL, freqR, freqL_105, freqR_105;
wire clk_21;
Clock_divider #(.n(21)) clk_21_module (.clk(clk), .clk_div(clk_21));

assign freq_outL = 50000000 / (2*freqL_105);
assign freq_outR = 50000000 / (2*freqR_105);

music_control #(.LEN(511)) musicCtrl_00 (.clk(clk_21), .en(music_en), .rst(rst), .ibeat(ibeatNum));
SongOf105 music_01 (.ibeatNum(ibeatNum), .en(1), .toneL(freqL_105), .toneR(freqR_105));

speaker_control sc(
    .clk(clk), 
    .rst(rst), 
    .audio_in_left(audio_in_left),      // left channel audio data input
    .audio_in_right(audio_in_right),    // right channel audio data input
    .audio_mclk(audio_mclk),            // master clock
    .audio_lrck(audio_lrck),            // left-right clock
    .audio_sck(audio_sclk),              // serial clock
    .audio_sdin(audio_sdin)             // serial audio data input
);

note_gen noteGen_00(
    .clk(clk), 
    .rst(rst), 
    .vol(vol),
    .note_div_left(freq_outL), 
    .note_div_right(freq_outR), 
    .audio_left(audio_in_left),     // left sound audio
    .audio_right(audio_in_right)    // right sound audio
);

//clock
wire clk4display, x_1clk, x_2clk, x_3clk, neon_led_clk;
reg xclk;
clk_divider CD(.clk(clk), .clk_div_1(x_1clk), .clk_div_2(x_2clk), .clk_div_3(x_3clk));
Clock_divider #(.n(16+1)) CD_4Display (.clk(clk), .clk_div(clk4display));
Clock_divider #(.n(25)) CD_4Neon_LED (.clk(clk), .clk_div(neon_led_clk));

always @(*) begin
    if(speed == 1)
        xclk = x_1clk;
    else if(speed == 2)
        xclk = x_2clk;
    else if(speed == 3)
        xclk = x_3clk;
end

//keyboard variables
wire [8:0] last_change;
wire [511:0] key_down;
wire key_valid;

KeyboardDecoder KBD(
	.key_down(key_down),
	.last_change(last_change),
	.key_valid(key_valid),
	.PS2_DATA(PS2_DATA),
	.PS2_CLK(PS2_CLK),
	.rst(rst),
	.clk(clk)
);

//keyboard value converter
wire [7:0] keyboard_value;
keyboard_value_converter KVC(.last_change(last_change[7:0]), .keyboard_value(keyboard_value));

//led pattern generator
wire [15:0] led_ptn_1;
led_pattern_generator_1 LPG1(.clk(neon_led_clk), .rst(rst), .led(led_ptn_1));

//set_left
wire set_left_pulse, set_left_dbc;
debounce DB_1(.pb(set_left), .clk(clk), .pb_debounced(set_left_dbc));
one_pulse OP_1(.clk(clk), .rst(rst), .in_trig(set_left_dbc), .out_pulse(set_left_pulse));
//set_right
wire set_right_pulse, set_right_dbc;
debounce DB_2(.pb(set_right), .clk(clk), .pb_debounced(set_right_dbc));
one_pulse OP_2(.clk(clk), .rst(rst), .in_trig(set_right_dbc), .out_pulse(set_right_pulse));
//set_up
wire set_up_dbc, set_up_pulse;
debounce DB_3(.pb(set_up), .clk(clk), .pb_debounced(set_up_dbc));
one_pulse OP_3(.clk(clk), .rst(rst), .in_trig(set_up_dbc), .out_pulse(set_up_pulse));
//set_down
wire set_down_dbc, set_down_pulse;
debounce DB_4(.pb(set_down), .clk(clk), .pb_debounced(set_down_dbc));
one_pulse OP_4(.clk(clk), .rst(rst), .in_trig(set_down_dbc), .out_pulse(set_down_pulse));
//start_stop
wire start_stop_dbc, start_stop_pulse;
debounce OP_5(.pb(start_stop), .clk(clk), .pb_debounced(start_stop_dbc));
one_pulse OP_6(.clk(clk), .rst(rst), .in_trig(start_stop_dbc), .out_pulse(start_stop_pulse));

//lfsr enable logic
reg lfsr_en;
always @(*) begin
    if(rst)
        lfsr_en = 0;
    else begin
        if(curr_state == GAME)
            lfsr_en = 1;
        else
            lfsr_en = 0;
    end
end

//lfsr
parameter c_NUM_BITS = 4;
wire [c_NUM_BITS-1:0] w_LFSR_Data;
wire w_LFSR_Done;
LFSR #(.NUM_BITS(c_NUM_BITS)) LFSR_inst(
    .i_Clk(xclk),
    .i_Enable(lfsr_en),
    .i_Seed_DV(1'b0),
    .i_Seed_Data({c_NUM_BITS{1'b0}}), // Replication
    .o_LFSR_Data(w_LFSR_Data),
    .o_LFSR_Done(w_LFSR_Done)
);

//lfsr led convertor
wire [15:0] w_led;
wire [3:0] led_index_1, led_index_2, led_index_3;
lfsr_led_convertor M13(
    .lfsr_data(w_LFSR_Data), 
    .curr_state(curr_state), 
    .lfsr_en(lfsr_en),
    .led_num(led_num_limit), 
    .led(w_led),
    .led_index_1(led_index_1),
    .led_index_2(led_index_2),
    .led_index_3(led_index_3)
);

//decide led signal
always @(*) begin
    if(rst)
        led = 0;
    else begin
        if(curr_state == GAME)
            led = w_led;
        else if(curr_state == AFTER_GAME)
            led = led_ptn_1;
        else
            led = curr_state;
    end  
end

//point counting
reg [4:0] points, next_points;
always @(*) begin
    if(curr_state == GAME)
        if(key_valid &&  key_down[last_change]) begin
            if(led_num_limit == 1) begin
                if(led_index_1 == keyboard_value)
                    if(speed == 1)
                        next_points = points + 3;
                    else if(speed == 2)
                        next_points = points + 2;
                    else if(speed == 3)
                        next_points = points + 1;
                    else
                        next_points = points;
                else
                    next_points = points;
            end else if(led_num_limit == 2) begin
                if((led_index_1 == keyboard_value) || (led_index_2 == keyboard_value))
                    if(speed == 1)
                        next_points = points + 3;
                    else if(speed == 2)
                        next_points = points + 2;
                    else if(speed == 3)
                        next_points = points + 1;
                    else
                        next_points = points;
                else
                    next_points = points;
            end else if(led_num_limit == 3) begin
                if((led_index_1 == keyboard_value) || (led_index_2 == keyboard_value) || (led_index_3 == keyboard_value))
                    if(speed == 1)
                        next_points = points + 3;
                    else if(speed == 2)
                        next_points = points + 2;
                    else if(speed == 3)
                        next_points = points + 1;
                    else
                        next_points = points;
                else
                    next_points = points;
            end else
                next_points = points;
        end else begin
            next_points = points;
        end
    else if(curr_state == AFTER_GAME)
        next_points = points;
    else
        next_points = 0;
end
always @(posedge clk, posedge rst) begin
    if(rst)
        points = 0;
    else
        points = next_points;
end

//round counting
reg [4:0] rnd_count, next_rnd_count;
always @(*) begin
    if(curr_state == GAME)
        next_rnd_count = rnd_count + 1;
    else
        next_rnd_count = 0;
end
always @(posedge xclk, posedge rst) begin
    if(rst)
        rnd_count = 0;
    else
        rnd_count = next_rnd_count;
end

//highest score recording
reg [4:0] highest_score;
always @(*) begin
    if(rst)
        highest_score = 0;
    else begin
        if(curr_state == AFTER_GAME) begin
            if(points > highest_score)
                highest_score = points;
            else
                highest_score = highest_score;
        end else
            highest_score = highest_score;
    end
end
//**************************************************************
// setting block
//**************************************************************
reg [6:0] rnd_limit, next_rnd_limit;
reg [1:0] led_num_limit, next_led_num_limit;
reg [1:0] speed, next_speed;
reg [2:0] vol, next_vol;
always @(*) begin
    if(curr_state == SET_ROUND) begin
        next_led_num_limit = led_num_limit;
        next_speed = speed;
        next_vol = vol;

        if(set_up_pulse) begin
            if(rnd_limit == 100)
                next_rnd_limit = 1;
            else
                next_rnd_limit = rnd_limit + 1;
        end else if(set_down_pulse)
            if(rnd_limit == 1)
                next_rnd_limit = 1;
            else
                next_rnd_limit = rnd_limit - 1;
        else
            next_rnd_limit = rnd_limit;
    end else if(curr_state == SET_LIGHT_NUMBER) begin
        next_rnd_limit = rnd_limit;
        next_speed = speed;
        next_vol = vol;

        if(set_up_pulse) begin
            if(led_num_limit == 3)
                next_led_num_limit = 1;
            else
                next_led_num_limit = led_num_limit + 1;
        end else if(set_down_pulse)
            if(led_num_limit == 1)
                next_led_num_limit = 3;
            else
                next_led_num_limit = led_num_limit - 1;
        else
            next_led_num_limit = led_num_limit;
    end else if(curr_state == SET_SPEED) begin
        next_rnd_limit = rnd_limit;
        next_led_num_limit = led_num_limit;
        next_vol = vol;

        if(set_up_pulse) begin
            if(speed == 3)
                next_speed = 1;
            else
                next_speed = speed + 1;
        end else if(set_down_pulse)
            if(speed == 1)
                next_speed = 3;
            else
                next_speed = speed - 1;
        else
            next_speed = speed;
    end else if(curr_state ==  SET_VOLUME) begin
        next_rnd_limit = rnd_limit;
        next_led_num_limit = led_num_limit;
        next_speed = speed;

        if(set_up_pulse) begin
            if(vol == 4)
                next_vol = vol;
            else
                next_vol = vol + 1;
        end else if(set_down_pulse)
            if(vol == 0)
                next_vol = vol;
            else
                next_vol = vol - 1;
        else
            next_vol = vol;
    end else begin
        next_rnd_limit = rnd_limit;
        next_led_num_limit = led_num_limit;
        next_speed = speed;
        next_vol = vol;
    end
end
always @(posedge clk, posedge rst) begin
    if(rst) begin
        rnd_limit <= 20;
        led_num_limit <= 1;
        speed <= 1;
        vol <= 3;
    end else begin
        rnd_limit <= next_rnd_limit;
        led_num_limit <= next_led_num_limit;
        speed <= next_speed;
        vol <= next_vol;
    end
end
//**************************************************************
// FSM block
//**************************************************************
//state reg
always @(posedge clk, posedge rst) begin
    if(rst)
        curr_state <= WELCOME_PAGE;
    else
        curr_state <= next_state;
end
//next state logic
always @(*) begin
    case(curr_state)
        WELCOME_PAGE: begin
            if(start_stop_pulse)
                next_state = GAME;
            else if(set_right_pulse)
                next_state = SETTING;
            else if(set_left_pulse)
                next_state = RECORD_PAGE;
            else
                next_state = WELCOME_PAGE;
        end
        GAME: begin
            if(rnd_count == rnd_limit)
                next_state = AFTER_GAME;
            else
                next_state = GAME;
        end
        AFTER_GAME: begin
            if(start_stop_pulse)
                next_state = RECORD_PAGE;
            else if(set_left_pulse)
                next_state = WELCOME_PAGE;
            else
                next_state = AFTER_GAME;
        end
        RECORD_PAGE: begin
            if(start_stop_pulse)
                next_state = WELCOME_PAGE;
            else
                next_state = RECORD_PAGE;
        end
        SETTING: begin
            if(set_left_pulse)
                next_state = SET_ROUND;
            else if(start_stop_pulse)
                next_state = SET_LIGHT_NUMBER;
            else if(set_right_pulse)
                next_state = SET_SPEED;
            else if(set_up_pulse)
                next_state = SET_VOLUME;
            else if(set_down_pulse)
                next_state = WELCOME_PAGE;
            else
                next_state = SETTING;
        end
        SET_ROUND: begin
            if(set_left_pulse)
                next_state = SETTING;
            else
                next_state = SET_ROUND;
        end
        SET_LIGHT_NUMBER: begin
            if(set_left_pulse)
                next_state = SETTING;
            else
                next_state = SET_LIGHT_NUMBER;
        end
        SET_SPEED: begin
            if(set_left_pulse)
                next_state = SETTING;
            else
                next_state = SET_SPEED;
        end
        SET_VOLUME: begin
            if(set_left_pulse)
                next_state = SETTING;
            else
                next_state = SET_VOLUME;
        end
        default: begin
            next_state = WELCOME_PAGE;
        end
    endcase
end
//output logic
always @(*) begin
    case(curr_state)
        WELCOME_PAGE: begin
            BCD0 = 22;
            BCD1 = 21;
            BCD2 = 20;
            BCD3 = 19;
        end
        GAME: begin
            BCD0 = points % 10;
            BCD1 = (points % 100) / 10;
            BCD2 = (points % 1000) / 100;
            BCD3 = points / 1000;
        end
        AFTER_GAME: begin
            BCD0 = points % 10;
            BCD1 = (points % 100) / 10;
            BCD2 = (points % 1000) / 100;
            BCD3 = 21;
        end
        RECORD_PAGE: begin
            BCD0 = highest_score % 10;
            BCD1 = (highest_score % 100) / 10;
            BCD2 = (highest_score % 1000) / 100;
            BCD3 = 25;
        end
        SETTING: begin
            BCD0 = 18;
            BCD1 = 17;
            BCD2 = 16;
            BCD3 = 15;
        end
        SET_ROUND: begin
            BCD0 = rnd_limit % 10;
            BCD1 = (rnd_limit % 100) / 10;
            BCD2 = (rnd_limit % 1000) / 100;
            BCD3 = 25;
        end
        SET_LIGHT_NUMBER: begin
            BCD0 = led_num_limit;
            BCD1 = 25;
            BCD2 = 25;
            BCD3 = 25;
        end
        SET_SPEED: begin
            BCD0 = speed;
            BCD1 = 25;
            BCD2 = 25;
            BCD3 = 25;
        end
        SET_VOLUME: begin
            BCD0 = vol;
            BCD1 = 25;
            BCD2 = 25;
            BCD3 = 25;
        end
        default: begin
            BCD0 = 26;
            BCD1 = 26;
            BCD2 = 26;
            BCD3 = 26;
        end
    endcase
end

//**************************************************************
// Display block
//**************************************************************
always @(posedge clk4display, posedge rst)begin
    if(rst)begin
        value=BCD0;
        DIGIT=4'b1110;
    end else begin
        case(DIGIT)
            4'b1110: begin
                value=BCD1;
                DIGIT=4'b1101;
            end
            4'b1101: begin
                value=BCD2;
                DIGIT=4'b1011;
            end 
            4'b1011: begin
                value=BCD3;
                DIGIT=4'b0111;
            end
            4'b0111: begin
                value=BCD0;
                DIGIT=4'b1110;
            end
            default:begin
                value=BCD0;
                DIGIT=4'b1110;
            end 
        endcase
    end
end
always @(*) begin
    case (value) 
        5'd0: DISPLAY=8'b00000011;
        5'd1: DISPLAY=8'b10011111;
        5'd2: DISPLAY=8'b00100101;
        5'd3: DISPLAY=8'b00001101;
        5'd4: DISPLAY=8'b10011001;
        5'd5: DISPLAY=8'b01001001;
        5'd6: DISPLAY=8'b01000001;
        5'd7: DISPLAY=8'b00011111;
        5'd8: DISPLAY=8'b00000001;
        5'd9: DISPLAY=8'b00001001;
        5'd10: DISPLAY=8'b00010001;
        5'd11: DISPLAY=8'b11111101;
        5'd12: DISPLAY=8'b10010001;
        5'd13: DISPLAY=8'b10000101;
        5'd14: DISPLAY=8'b01100001;
        5'd15: DISPLAY=8'b01001001; //S
        5'd16: DISPLAY=8'b01100001; //E
        5'd17: DISPLAY=8'b00011111; //T left half
        5'd18: DISPLAY=8'b01110011; //T right half
        5'd19: DISPLAY=8'b11000011; //W left half
        5'd20: DISPLAY=8'b10000111; //W right half
        5'd21: DISPLAY=8'b00010001; //A
        5'd22: DISPLAY=8'b10010001; //M
        5'd23: DISPLAY=8'b01100011; //C
        5'd24: DISPLAY=8'b10010001; //H
        5'd25: DISPLAY=8'b11111111; //dark
        5'd26: DISPLAY=8'b11111101; //-
        default:DISPLAY=8'b00000000;
    endcase
end
endmodule