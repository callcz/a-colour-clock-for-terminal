#!/bin/bash
##
## This a LED like clock shell scrip.
## Writen by callcz 20220722

#START config
logo_degtal_turn=1
logo_degtal='#'
hiden_mouse=1
clean_screen=1
logo_background=' '
#END config

#Help list
if [[ $1 == --help || $1 == -h ]]
then
	head -n4 $0
echo "	Usage : $0 [ -t || -w || \"{WORDS}\" ] x-asix y-asix
	-t	Print once clock and exit .
	-w	A while loop to print clock .
	'{WORDS}'	Print some words , they incude {[A..Z],[0..9],:,+,-,!,?,.,,,:,;,\",',@} , 
			Use \`echo -e \"\/r\"\` to Create a new line :
			example :	$0 'VTEC IS BEST!'
			example :	$0 '\"ARE YOU OK ?\" , I SAY: '\\\"'I AM OK'\"!\"\\\"
			example :	$0 HONDA\"\`echo -e \"\\r\"\`\"'VTEC IS BEST!'
	--help or -h	List this help .
	"
exit
fi

##Globa value
echo -e '\033c'
if [[ $clean_screen == 1 ]];then echo -e '\033c';fi
if [[ $hiden_mouse == 1 ]];then echo -ne '\033[?25l';trap "my_exit_l" 2;fi
degtal=$1
background_x_max=5
background_y_max=9
start_x=0
start_y=0
tty_xy=(`stty size`)
tty_x=${tty_xy[1]}
tty_y=${tty_xy[0]}

##my_exit_l
my_exit_l(){
	echo -ne '\033[?25h';exit
}

##Main Program for output
output_l(){
	eval local r=('${r'"$1"'[@]}')
	if [[ $1 == null || -z ${r[@]} ]]
	then
		return 33
	fi
	if [[ $2 && $3 ]]
	then
		local start_x=$2
		local start_y=$3
	fi

for ((i=1;i<=$((background_x_max*background_y_max));i++))
do
	field_x=$((i%background_x_max))
	if [[ $field_x -eq 0 ]];then field_x=$background_x_max;fi
	field_y=$(($(($((i-1))/background_x_max))+1))
	field_xy=$field_x,$field_y
#echo background
	echo -ne "\033[$((${field_y}+${start_y}));$((${field_x}+${start_x}))H${logo_background}"
#do rull
#		eval local r=('${r'"$1"'[@]}')
		for j in ${r[@]}
		do
			eval local s=('${s'"$j"'[@]}')
			for k in ${s[@]}
			do
				if [[ $k == $field_xy ]]
				then
#echo NUM
					if [[ $field_y == 1 || $field_y == 2 ]]
					then
						echo -ne "\033[$((${field_y}+${start_y}));$((${field_x}+${start_x}))H\033[37m${logo_degtal}\033[0m"
					elif [[ $field_y == 3 || $field_y == 4 ]]
					then
						echo -ne "\033[$((${field_y}+${start_y}));$((${field_x}+${start_x}))H\033[36m${logo_degtal}\033[0m"
					elif [[ $field_y == 5 ]]
					then
						echo -ne "\033[$((${field_y}+${start_y}));$((${field_x}+${start_x}))H\033[32m${logo_degtal}\033[0m"
					elif [[ $field_y == 6 || $field_y == 7 ]]
					then
						echo -ne "\033[$((${field_y}+${start_y}));$((${field_x}+${start_x}))H\033[33m${logo_degtal}\033[0m"
					elif [[ $field_y == 8 || $field_y == 9 ]]
					then
						echo -ne "\033[$((${field_y}+${start_y}));$((${field_x}+${start_x}))H\033[31m${logo_degtal}\033[0m"
					fi
				fi
			done
		done
done
}

##LED like rule

#   #####
#   12345
##
#1  P22YQ
#2  18T93
#3  1LAU3
#4  1BNC3
#5  I5K5J
#6  4DOEA1
#7  4VFMZ
#8  4GWH6
#9  R7X7S

s1=(1,2 1,3 1,4)
s2=(2,1 3,1 4,1)
s3=(5,2 5,3 5,4)
s4=(1,6 1,7 1,8)
s5=(2,5 3,5 4,5)
s6=(5,6 5,7 5,8)
s7=(2,9 3,9 4,9)
s8=(2,2)
s9=(4,2)
sA=(3,3)
sB=(2,4)
sC=(4,4)
sD=(2,6)
sE=(4,6)
sF=(3,7)
sH=(4,8)
sG=(2,8)
sI=(1,5)
sJ=(5,5)
sK=(3,5)
sL=(2,3)
sM=(4,7)
sN=(3,4)
sO=(3,6)
sP=(1,1)
sQ=(5,1)
sR=(1,9)
sS=(5,9)
sT=(3,2)
sU=(4,3)
sV=(2,7)
sW=(3,8)
sX=(3,9)
sY=(4,1)
sZ=(5,7)
sA1=(5,6)

##number rule
#one two three four five six seven eight nine ten
r1=(Y 3 6 Q S)
r2=(2 3 5 4 7)
r3=(2 3 5 6 7)
r4=(1 3 5 6 P Q S)
r5=(2 1 5 6 7)
r6=(2 1 4 7 6 5)
r7=(2 3 6 S)
r8=(2 1 3 5 4 6 7)
r9=(2 1 3 5 6 7)
r0=(1 2 3 4 6 7 K)
rA=(1 2 3 4 5 6 R S)
rB=(P 1 2 3 5 I 4 R 6 7)
rC=(2 1 4 7)
rD=(P 1 4 R 2 3 6 7)
rE=(1 2 5 4 7)
rF=(1 2 5 4 R)
rG=(2 1 4 7 6 J S)
rH=(P 1 4 R 5 Q 3 6 S)
rI=(2 T A N K O F W 7)
rJ=(Q 3 6 7)
rK=(P 1 4 R 9 A B D F H S Q)
rL=(P 1 4 R 7)
rM=(R 4 1 P 8 A 9 Q 3 6 S)
rN=(P 1 4 R L N K O M S 6 3 Q)
rO=(1 2 3 4 6 7)
rP=(P 1 4 R 2 3 5)
rQ=(1 2 3 4 6 7 H S)
rR=(1 4 R 2 3 5 D F H S P)
rS=(2 1 B K E 6 7)
rT=(P 2 Q T A N K O F W X)
rU=(P 1 4 7 Q 3 6)
rV=(P 1 D V W X M E 3 Q)
rW=(P 1 4 R G F H S 6 3 Q)
rX=(P 1 K 6 S Q 3 4 R)
rY=(P 1 5 3 Q O F W X)
rZ=(2 Q 3 K 4 R 7)
r_colon=(A N O F)
r_space=()
r_plus=(5 N O)
r_minus=(5)
r_exclamatory=(T A N K O F X)

r_period=(X)
r_semicolon=(O W X)
r_comma=(W X)
r_at=(1 2 3 4 7 S K O F M Z A1 J)
r_question=(2 3 K O F X)
r_d_quotation=(T A)
r_s_quotation=(8 L 9 U)

Time_l(){
	if [[ ${d} != `date +%T` ]]
	then
		start_x=$1
		bank=$((start_x-6))
		start_y=$2
		start_xb=$bank
		start_yb=$start_y
#		echo $bank
		d=`date +%T`
		dn=${#d}
	for ((e=0;e<$dn;e++))
	do
		T=${d:$e:1}
		if [[ $logo_degtal_turn -eq 1 ]]
		then
			logo_degtal=$T
		fi
		if [[ ${d:$e:1} == ':' ]]
		then
			T=_colon
		fi
		if [[ $((bank+$((background_x_max+1))*2)) -gt $tty_x ]]
		then
			bank=$start_xb
			start_y=$((start_y+background_y_max+1))
		fi
		if [[ $((start_y+background_y_max+1)) -gt $tty_y ]]
		then
			for ((f=0;f<$tty_y;f++))
			do
				echo -e " "
			done
			start_y=0
		fi
		bank=$((bank+background_x_max+1))
		output_l $T $bank $start_y
#		echo $bank
	done
	echo -e "\033[$((background_y_max+start_y+2));$((${start_x}+3))H\033[37m`date +%Y/%m/%d'    '%A`\n\033[0m"
	fi
}

if [[ ! $2 ]]
then
	start_x=0
else
	start_x=$2
fi
if [[ ! $3 ]]
then
	start_y=0
else
	start_y=$3
fi

if [[ $1 == '-t' ]]
then
	Time_l $start_x $start_y
	my_exit_l
elif [[ $1 == '-w' ]]
then
	while :
	do
		Time_l $start_x $start_y
	done
	my_exit_l
elif [[ $1 ]]
then
	bank=$((start_x-background_x_max-1))
	start_xb=$bank
	start_yb=$start_y
	word=$1
	for ((l=0;l<${#word};l++))
	do
		word_w=${word:$l:1}
		if [[ $logo_degtal_turn -eq 1 ]]
			then
				logo_degtal=$word_w
		fi
#Special character interpretation
		if [[ $word_w == ':' ]]
		then
			word_w=_colon
		elif [[ $word_w == ' ' ]]
		then
			word_w=_space
			word_cut=${word:$(($l+1))}
			word_part=${word_cut%% *}
			if [[ $(($((bank+$((background_x_max+1))*2))+$(($((background_x_max+1))*${#word_part})))) -gt $tty_x ]]
			then
				newbank=1
			fi
		elif [[ $word_w == '+' ]]
		then
			word_w=_plus
		elif [[ $word_w == '-' ]]
		then
			word_w=_minus
		elif [[ $word_w == '!' ]]
		then
			word_w=_exclamatory
		elif [[ $word_w == '.' ]]
		then
			word_w=_period
		elif [[ $word_w == ';' ]]
		then
			word_w=_semicolon
		elif [[ $word_w == ',' ]]
		then
			word_w=_comma
			elif [[ $word_w == '@' ]]
		then
			word_w=_at
		elif [[ $word_w == '?' ]]
		then
			word_w=_question
		elif [[ $word_w == \' ]]
		then
			word_w=_d_quotation
		elif [[ $word_w == \" ]]
		then
			word_w=_s_quotation
		elif [[ $word_w == `echo -e "\r"` ]]
		then
			word_w=null
			newbank=1
		fi
#End
		if [[ $((bank+$((background_x_max+1))*2)) -gt $tty_x || $newline -eq 1 ]]
		then
			bank=$start_xb
			start_y=$((start_y+background_y_max+1))
			if [[ $word_w == _space ]]
			then
				word_w=null
			fi
			echo -ne "\n"
		fi
		if [[ $((start_y+background_y_max+1)) -gt $tty_y ]]
		then
			for ((f=0;f<$tty_y;f++))
			do
				echo -e " "
			done
			start_y=0
		fi
		if [[ $word_w != null ]]
		then
			bank=$((bank+background_x_max+1))
		fi
		output_l $word_w $bank $start_y
		if [[ $newbank -eq 1 ]]
		then
			newline=1
			newbank=0
		else
			newline=0
		fi
	done
	echo -e "\n"
	my_exit_l
else
	Time_l $start_x $start_y
fi

my_exit_l
