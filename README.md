# Line following Robot

## Reference

General references:

- https://www.robotshop.com/community/forum/t/pid-tutorials-for-line-following/13164

HC-06:
How to connect to serial on Linux

- https://gist.github.com/0/c73e2557d875446b9603

PID algorithm:

- https://robotresearchlab.com/2019/02/16/pid-line-follower-tuning/

Current PIN Mapping:
| PIN | Function |
| --- | -------- |
| A0 | 😑 <a style="color: cyan">SONAR_TRIG_PIN</a> |
| A1 | 😑 <a style="color: cyan">SONAR_ECHO_PIN</a> |
| A2 | 😑 SENSOR_7_PIN |
| A3 | 😑 SENSOR_6_PIN |
| A3 | 😑 SENSOR_6_PIN |
| A4 | 😑 SENSOR_5_PIN |
| A5 | 😑 SENSOR_4_PIN |
| A6 | 😀 <a style="color: green">**NOT USED**</a> |
| A7 | 😀 <a style="color: green">**NOT USED**</a> |
| 0 | 🤔 <a style="color: yellow">SERIAL_RX_PIN</a> (can be use when not using Serial)|
| 1 | 🤔 <a style="color: yellow">SERIAL_TX_PIN</a> (can be use when not using Serial) |
| 2 | 😑 SENSOR_EMITTER_PIN |
| 3 | 😑 LEFT_PWM_PIN |
| 4 | 😑 SENSOR_3_PIN |
| 5 | 😑 SENSOR_2_PIN |
| 6 | 😡 <a style="color: red">**DO NOT USE!!!!**</a> (connect to pin 11 to use pin 11 to control Motor) |  
| 7 | 😑 RIGHT_DIR_PIN |
| 8 | 😑 LEFT_DIR_PIN |
| 9 | 😑 SENSOR_1_PIN |
| 10 | 😑 START_BUTTON_PIN |
| 11 | 😑 RIGHT_PWM_PIN |
| 12 | 😑 SENSOR_0_PIN |
| 13 | 😑 LED_PIN |
