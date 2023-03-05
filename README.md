<a name="readme-top"></a>

<!-- PROJECT SHIELDS -->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

# <center>Logic Design Laboratory Final Project</center>

<div align="center">

  <p align="center">
    <a href="https://github.com/Lewis-Tsai/2022-Spring-Logic-Design-Laboratory-Final-Project"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/Lewis-Tsai/2022-Spring-Logic-Design-Laboratory-Final-Project">View Demo</a>
    ·
    <a href="https://github.com/Lewis-Tsai/2022-Spring-Logic-Design-Laboratory-Final-Project/issues">Report Bug</a>
    ·
    <a href="https://github.com/Lewis-Tsai/2022-Spring-Logic-Design-Laboratory-Final-Project/issues">Request Feature</a>
  </p>
</div>

## Semester and class
2022 Spring NTHU EECS207002	

## Goal
Design and implement a whack-a-mole (打地鼠)

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


## Getting Started

Prepare a FPGA board and read `final_project_report_109000129` for further detail.

## Contact

[![gmail][gmail]][gmail-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/github_username/repo_name.svg?style=for-the-badge
[contributors-url]: https://github.com/Lewis-Tsai/2022-Spring-Logic-Design-Laboratory-Final-Project/contributors
[forks-shield]: https://img.shields.io/github/forks/github_username/repo_name.svg?style=for-the-badge
[forks-url]: https://github.com/Lewis-Tsai/2022-Spring-Logic-Design-Laboratory-Final-Project/network/members
[stars-shield]: https://img.shields.io/github/stars/github_username/repo_name.svg?style=for-the-badge
[stars-url]: https://github.com/Lewis-Tsai/2022-Spring-Logic-Design-Laboratory-Final-Project/stargazers
[issues-shield]: https://img.shields.io/github/issues/github_username/repo_name.svg?style=for-the-badge
[issues-url]: https://github.com/Lewis-Tsai/2022-Spring-Logic-Design-Laboratory-Final-Project/issues
[license-shield]: https://img.shields.io/github/license/github_username/repo_name.svg?style=for-the-badge
[license-url]: https://github.com/Lewis-Tsai/2022-Spring-Logic-Design-Laboratory-Final-Project/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/lewis-tsai-7b570421a
[product-screenshot]: images/screenshot.png

[gmail]: https://img.shields.io/badge/Gmail-D14836?style=for-the-badge&logo=gmail&logoColor=white
[gmail-url]: mailto:A38050787@gmail.com
