#!/bin/bash
##
## This a LED like clock shell scrip.
## Writen by callcz 20220722
  Usage : ./clock.sh [ -t || -w || -r || "{WORDS}" ] [ x-asix ] [ y-asix ]
  -t    Print a clock once .
  -w    A while loop clock .
  -r    Get words to be print over the read program .
  '{WORDS}'     Print words , incude {[A-Z],[0-9],:,+,-,!,?,.,,,:,;,",',@} , Use `echo -e "\r"` to Create a new line .
        example : ./clock.sh 'VTEC IS BEST!'
        example : ./clock.sh '"ARE YOU OK ?" , I SAY: '\"'I AM OK'"!"\"
        example : ./clock.sh HONDA"`echo -e "\r"`"'VTEC IS BEST!'
  --help or -h  List this help .

【每一秒都充满色彩-哔哩哔哩】 https://b23.tv/WPu09Tx
