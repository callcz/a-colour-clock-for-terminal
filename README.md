#!/bin/bash
##
## This a LED like clock shell scrip.
## Writen by callcz 20220722
        Usage : ./clock2.sh [ -t || -w || "{WORDS}" ] x-asix y-asix
        -t      Print once clock and exit .
        -w      A while loop to print clock .
        '{WORDS}'       Print some words , they incude {[A..Z],[0..9],:,+,-,!,?,.,,,:,;,",',@} , 
                        Use `echo -e "\/r"` to Create a new line :
                        example :       ./clock2.sh 'VTEC IS BEST!'
                        example :       ./clock2.sh '"ARE YOU OK ?" , I SAY: '\"'I AM OK'"!"\"
                        example :       ./clock2.sh HONDA"`echo -e "\r"`"'VTEC IS BEST!'
        --help or -h    List this help .

【每一秒都充满色彩-哔哩哔哩】 https://b23.tv/WPu09Tx
