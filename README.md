# 2022 Spring Logic Design Laboratory Final Project
## Goal
Design and implement an whack-a-mole (打地鼠)

## Input/output Concept
**Input**
1.	DIP switch
Use for reset, and hardcore setting (for example, mandatorily change the current state if necessary)
2.	keyboard
Users press the keyboard to indicate the current position of the mole(s)
3.	buttons
In game playing mode, use as game start button, score clear button, and the current highest score button. In setting mode, use as setting buttons.
 
**Output**
1.	7-segment display
Show score and other values (the speed of the game, the highest score, how may leds lightened)
2.	Audio module
Play music while playing


## Functions
**Game function** 
1. Each time the LED will light up randomly (20 times in total), the corresponding position can be indicated by the keyboard. 
2. When the light is on, one point will be added if the light is on at the corresponding position, and the seven-segment display can display the score. 
3. Supports game start button, the score clear button, and the current highest score button.

**Setting function** 
1. Able to set the number of lights lightened at the same time 
2. Able to set the number of rounds per game
3. Able to set the speed of the moles appearing
4. The more difficult the game is (for example, the speed is fast), the higher score the player gets.

**Audio function** 
1. Able to play music while playing the game
2. Support volume changing


## FSM Diagram
![](https://i.imgur.com/i9bkluw.png)


## High value analysis
* Background : althoung it is an 2D game, but we want to make the background looks like 3D
* Enemies : As time passes, the enemies will be harder to beat and its attaking power will grow
* Variety : Besides the enimies on the ground, we let some enemies randomly exits on the sky, so the game will be more interesting
* Sounds : the sound of the helicopter may vary due to its speed or altitude

## Structure Diagram
![](https://i.imgur.com/OdhNZYe.png)

## Design Implementation
**final_project.v**
This is the top module of the whole project. As you can see in the figure above, I derived some modules from this file, though some main functions I still keep in the top module, which are game control, setting block, FSM block (state reg, next state logic, and output logic), and display block. I’ll explain game control and setting block in detail.
* **Game control**
In game control, it decides the led output. If the current state is in GAME, then the led signal is connected with lfsr_led_convertor. If the current state is in AFTER_GAME, the led signal is connected with led_pattern_generator_1. Otherwise, it will show curr_state in the convenience of debugging. Plus, game control also counts the number of rounds, and the points, and records the highest score. Note that the point-counting logic is also based on how fast the LEDs are showing (this is mentioned in the final project proposal), the faster the clock is, the higher points you get.

* **Setting block**
In the proposal, we can set the number of rounds, clock speed, the number of LEDs lightened as well as the song playing. However, though I only finished one music file, the song selection function has been replaced with a volume setting. In the Setting block, there’s a flip flop that controls the buttons' input and the corresponding parameters just like lab6.

**Next, I’ll derive the rest into several parts according to the** [**structural diagram**](##Structure-Diagram) **above.**


* **Clock_divider.v** (for several uses)
Aside from the clock for the game round, the project still needs other clock signals. This module is responsible for generating the clock for music control, the neon frequency that appears after the game, and the clock for 7-segment displays. This module can take a variable in it just like other high-level programming languages so that we can reduce the number of modules, but generates several different clock frequencies at the same time.

* **music_control.v**
This module generates the beat for the music. The beat will affect the tone that SongOf105.v plays. If the music playing function isn’t enabled, the beat will be 0 thus preventing SongOf105.v from playing the music.

* **SongOf105.v**
The left and right frequencies have eight bars (小節) respectively, and 16 beatNums are used to represent a bar, and there are 512 beatnums in total. Control the tempo of clk so that the tempo of beatnum from 0 to 511 matches the tempo of the song. Use cases from 0 to 511, and concatenate each tone to form a song.

* **speaker_control.v** and **P2S.v**
The same as lab7.

* **note_gen.v**
This module generates the notes of the song, the volume is also controlled here.

* **clk_divider (for the time of every game round)**
This module generates one second, 1.6 seconds, and 2.2 seconds according to the set of the speed of the moles appearing.

* **KeyboardDecoder.v**, **KeyboardCtrl.v**, and **Ps2Interface.v**
The same as lab7(provided in lecture attachments)

* **keyboard_value_converter.v**
This module detects keyboard activity and outputs keyboard_value to the game control logic in final_project.v . In the final project, we only use this row on the keyboard to indicate the position of mole(s).
![](https://i.imgur.com/L8NQJqT.png)
Since we use 12 LEDs (LD1~LD12) in the game to indicate the position of mole(s), there are also 12 keys (Q, W……. [, ]) that correspond to the LEDs. For example, if LD12 lightened, then the user can earn points by pressing Q. If LD1 lightened, presses ] can let the user earn points. Thus, with the keyboard value, we can detect whether the user presses the correct key or not.

* **led_pattern_generator_1.v**
This module generates the led signal that appears after the game. It looks like neon lighting, to celebrate the completion of the game.

* **debounce.v, one_pulse.v**
the same as previous labs.

* **LFSR.v**
LFSR (Linear-feedback shift register) is a special type of shift register whose input depends on its previous state. By taking advantage of LFSR, we can stimulate generating random numbers. The output of this module will be connected to lfsr_led_convertor.v before showing its led result.

* **lfsr_led_convertor.v**
The result we get from LFSR.v is completely raw. First, it generates a 4-bit number in each cycle, in other words, the number ranges from 0 to 15. However, we only use 12 LEDs, which means only 1-12 can indicate the position of the LED lightened. Second, since we can set the number of led lights, if we want three LEDs lightened at the same time, for example, instead of connecting three LFSR modules with the LEDs, I’d rather only use one LFSR module. This is because we can’t guarantee every time the three numbers generated by the LFSR modules are unique, if two of the numbers are the same, then there will only be two LEDs lightened, but not three. This contradicts the result we want. In conclusion, lfsr_led_convertor.v is responsible for processing the raw data from the LFSR module before generating the led signal we want.


## Discussion
### Result Analysis
In this project, I successfully implemented a Whac-A-Mole game using an FPGA board and Verilog. It takes the button input for the control settings and takes the keyboard input for gameplay control. The output is the LED signal as the position of moles and the seven-segment display to display the score and setting figures. I also use an audio extension module to play background music, users can set the volume as well.
In my opinion, the key point of this project is the introduction of LFSR, which generates random-like numbers. However, the raw data requires further processing as I mentioned above. If this function can be implemented successfully, then there would be little problem with the whole project.

### Error Analysis
There wasn’t any huge error during the implementation of my final project, despite some little bugs. Nevertheless, when I was about to wind up the whole project, it came to my mind that maybe it would be more close to reality if the LED will darken after the user click the correct key, just like the mole would disappear after someone hit it with a hammer. This was quite annoying because a bunch of code blocks needed to be added to the lfsr_led_convertor to decide the 12 LEDs, which will keep lightened, which will not. In the end, I tried to implement this function but failed. Thus, the gameplay outcome remains the same, players will get points whenever they hit the correct spot of the LED(s).

### Thoughts/Comments/Suggestions
Since I have done some bigger coding projects, this final project wasn’t too complicated for me from a technical perspective. What we only need is a detailed blueprint and to be mindful while working with the code. Plus, it is important to set checkpoints often, and test the function you have just implemented instead of debugging after a long time of work. 
There are some points that I hope I can do better next time. First, is the darken function I mentioned above. Second, lfsr_led_convertor requires a better design. Even though the function works fine, I hope the coding can be cleaner and reduce duplicate code blocks if possible. Verilog is a more rigorous programming language compared to C++ or python, I didn’t want to make any mistakes so I literally table-matching the LED signal. This makes the module even longer than my top module. I hope I can do better with that. Third, I gave up using the VGA display when I was planning my final project. I think VGA is the most interesting part of this lecture, and it expands the possibility and creativity of the project. Unfortunately, I predicted that I would be super busy at the end of the semester because of the five main courses I take, and I’m a dumb kid as well, so I was not sure whether I’m going to implement the desired function wanted.
Aside from the joy of successfully meeting all the requirements on the proposal, I was very proud that I put the black ground music into practice. In comparison to lab7, the music function in this project is more than a hundred times more complicated. Instead of a single tone in lab7, I have to take the tones, speed, and even the main theme, and accompanying theme into consideration. There are about five hundred lines just to take care of the different tones of the song. Even though I’m not able to finish more than one song, I’m still very proud of the work. There’s a link below to the background music I simulate.

## Conclusion
As the final assignment for this class, we made a game of Whac-A-Mole through the FPGA board and Verilog implementation. It is the ultimate combination of all we learned throughout the semester, and I used everything except the VGA display due to technical difficulties. Even though there are some defects in the overall design, I still give high credit for my contribution. I’m proud of myself for doing this alone. Of course, there were burdens, but I eventually find a way out.
In conclusion, I had a deeper understanding of the basics of hardware implementation and am ready for harder tasks in the future. I would like to seize this chance as well to thank the professor and TAs for all you have done.

## References
1. [FPGA产生基于LFSR的伪随机数](https://blog.csdn.net/kebu12345678/article/details/54834763)
This is the website I used to understand how LFSR works and how to implement it into my project.
2. [阿肆 - 熱愛105°C的你【動態歌詞】「Super Idol的笑容 都沒你的甜」](https://www.youtube.com/watch?v=iJAxeafvn8Y)
The source of the background music.