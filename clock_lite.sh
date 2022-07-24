#!/bin/bash
##
## This a LED like clock shell scrip.
## Writen by callcz 20220722
if [[ $1 == --help || $1 == -h ]]
then
	head -n4 $0
echo "	Usage : $0 [ -t || -w || {[0..9],:} ] x-asix y-asix
	-t	Print once clock and exit .
	-w	A while loop to print clock .
	{[0..9],:}	print Incude [0..9] and \":\" .
	--help or -h List this help .
	"
exit
fi
#START config
logo_degtal_turn=1
hiden_mouse=0
clean_screen=1
#END config
if [[ $clean_screen == 1 ]];then echo -e '\033c';fi
if [[ $hiden_mouse == 1 ]];then echo -ne '\033[?25l';trap "echo -ne '\033[?25h';exit" 2;fi
##background
degtal=$1
#logo_background=□
logo_background=' '
#logo_degtal=■
logo_degtal='#'
background_x_max=5
background_y_max=9
start_x=0
start_y=0
##background
output_l(){
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
		eval local r=('${r'"$1"'[@]}')
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
#1  P22TQ
#2  18 93
#3  1LA 3
#4  1BNC3
#5  I5K5J
#6  4DOE6
#7  4 FM6
#8  4G H6
#9  R777S

s1=(1,2 1,3 1,4)
s2=(2,1 3,1 4,1)
s3=(5,2 5,3 5,4)
s4=(1,6 1,7 1,8)
s5=(2,5 3,5 4,5)
s6=(5,6 5,7 5,8)
s7=(2,9 3,9 4,9)
s8=(2,2)
sA=(3,3)
sB=(2,4)
sC=(4,4)
sD=(2,6)
sE=(4,6)
sH=(4,8)
sF=(3,7)
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
sT=(4,1)

##number rule
#one two three four five six seven eight nine ten
r1=(T 3 6 Q S)
r2=(2 3 5 4 7)
r3=(2 3 5 6 7)
r4=(1 3 5 6 P Q S)
r5=(2 1 5 6 7)
r6=(2 1 4 7 6 5)
r7=(2 3 6 S)
r8=(2 1 3 5 4 6 7)
r9=(2 1 3 5 6 7)
r0=(1 2 3 4 6 7 K)
r_colon=(A N O F)


Time_l(){
	if [[ ${d} != `date +%T` ]]
	then
		start_x=$1
		bank=$((start_x-6))
#		echo $bank
		start_y=$2
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
	exit
elif [[ $1 == '-w' ]]
then
	while :
	do
		Time_l $start_x $start_y
	done
	exit
elif [[ $1 ]]
then
	start_x=$((start_x-6))
	word=$1
	for ((l=0;l<${#word};l++))
	do
		word_w=${word:$l:1}
		if [[ $logo_degtal_turn -eq 1 ]]
			then
				logo_degtal=$word_w
		fi
		if [[ $word_w == ':' ]]
		then
			word_w=_colon
		fi
		start_x=$((start_x+6))
		output_l $word_w $start_x $start_y
		echo -en "\n"
	done
	exit
else
	Time_l $start_x $start_y
fi

exit
