#!/bin/bash
NC='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
UWHITE='\033[4;37m'
UBLACK='\033[4;30m'
UGREEN='\033[4;32m'
CYAN='\033[0;36m'
BGREEN='\033[1;32m'
BBlue='\033[1;34m'
BPURPLE='\033[1;35m'
BCYAN='\033[1;36m'
LRED='\033[0;91m'
LGREEN='\033[0;92m'
IYELLOW='\033[0;93m'
LBLUE='\033[0;94m'
LCYAN='\033[0;96m'
ON_HIGH_IRED='\033[1;91m'
ON_HIGH_IYELLOW='\033[1;93m'
BICYAN='\033[1;96m'
BIWHITE='\033[1;97m'
BIGREEN='\033[1;92m'
USER_MONEY=1000000
DEALER_MONEY=1000000000
declare -A dealer_first_card
ran_num1=0
ran_num2=0
temp=0
temp2=0
d_ran_num1=0
d_ran_num2=0
declare -A shape
declare -A limit
declare -A card_num_limit
declare -A last_limit
cnt2=0

for ((i=0;i<4;i++))
do
	for ((j=0;j<2;j++))
	do
		limit[$i,$j]=0
	done
done
for ((i=0;i<13;i++)) 
do
	card_num_limit[$i,0]=$(($i+1))
done
for ((i=0;i<13;i++))
do
	card_num_limit[$i,1]=0
done
for ((i=0;i<4;i++))
do
	for(( j=0;j<13;j++))
	do
		last_limit[$i,$j]=0
	done
done

shape[0]="◆"
shape[1]="♠"
shape[2]="♥"
shape[3]="♣"
Busted2()
{
	local db=0
	db=$1
	for (( i=0;i<4;i++));
	do
	echo -e "     *****${RED} B U S T E D${NC} *****  "
	sleep 0.4s
	clear
	sleep 0.4s 
done
if (( db==1));
then
	echo -e "     -----${LGREEN}User Win${NC}-----"
elif (( db==2));
then
	echo -e "     -----${LRED}Dealer Win${NC}-----"
fi

}
Busted()
{
	local db=$1
	for (( i=0;i<7;i++))
	do
		echo -en "${BPURPLE}*"
		sleep 0.01s
	done
	echo -en "${NC}${RED}B "
	sleep 0.3s
	echo -n "U "
	sleep 0.3s
	echo -n "S "
	sleep 0.3s
	echo -n "T "
	sleep 0.3s
	echo -n "E "
	sleep 0.3s
	echo -en "D${NC} "
	sleep 0.3s
	for (( i=0;i<7;i++))
	do
		echo -en ${BPURPLE}"*"
		sleep 0.01s
	done
	echo -e "*${NC}"
	sleep 0.01s
	if ((db==1));
	then
		echo -e "${LGREEN}User Win${NC}"
	elif (( db==2));
	then
		echo -e "${LRED}Dealer Win${NC}"
	fi
}
Introduction()
{
	declare -A array_name
#	array_name=("◆ ""♠ ""♥ ""♣ ""B ""L ""A ""C ""K  ""J ""A ""C ""K ""◆ ""♠ ""♥ ""♣")
	clear
	for (( i=0;i<65;i++))
	do
		echo -en "${CYAN}*"
		sleep 0.01s
	done
	echo -e "*${NC}"
	sleep 0.01s
	echo -en "  ${ON_HIGH_IYELLOW}  ◆ "
	sleep 0.1s
	echo -n "♥ "
	sleep 0.1s
	echo -n "♣ "
	sleep 0.1s
	echo -en "♠${NC} "
	sleep 0.1s
	echo -en "${UWHITE} W "
	sleep 0.1s
	echo -n "E "
	sleep 0.1s
	echo -n "L "
	sleep 0.1s
	echo -n "C "
	sleep 0.1s
	echo -n "O "
	sleep 0.1s
	echo -n "M "
	sleep 0.1s
	echo -n "E "
	sleep 0.1s
	echo -n "   T "
	sleep 0.1s
	echo -n "O "
	sleep 0.1s
	echo -n "   B "
	sleep 0.1s
	echo -n "L "
	sleep 0.1s
	echo -n "A "
	sleep 0.1s
	echo -n "C "
	sleep 0.1s
	echo -n "K "
	sleep 0.1s
	echo -n "J "
	sleep 0.1s
	echo -n "A "
	sleep 0.1s
	echo -n "C "
	sleep 0.1s
	echo -en "K${NC} "
	sleep 0.1s
	echo -en "${ON_HIGH_IYELLOW}◆ "
	sleep 0.1s
	echo -n "♥ "
	sleep 0.1s
	echo -n "♣ "
	sleep 0.1s
	echo -e "♠${NC} "
	for (( i=0;i<65;i++))
	do
		echo -en "${CYAN}*"
		sleep 0.01s
	done
	echo -e "*${NC}"
	sleep 3s
}
	

information()
{
	echo -e "         ${UGREEN}  -----Game Start After Betting money-----${NC}"
}
Card_Shuffle()
{
	cnt2=0
	
for ((i=0;i<4;i++))
do
	for ((j=0;j<2;j++))
	do
		limit[$i,$j]=0
	done
done
for ((i=0;i<13;i++))
do
	card_num_limit[$i,1]=0
done
for ((i=0;i<4;i++))
do
	for(( j=0;j<13;j++))
	do
		last_limit[$i,$j]=0
	done
done
clear
for(( i=0;i<3;i++));
do
	sleep 0.3s
	echo -en "${RED}◆${NC} "
	sleep 0.3s
	echo -n "♠ "
	sleep 0.3s
	echo -en "${RED}♥${NC} "
	sleep 0.3s
	echo -n "♣ "
	sleep 0.3s
	clear
done

}
money_bet()
{
	while true; do
		echo -e "${BLUE}Bet Money:${NC}"
		read money
		if ((${USER_MONEY}<money));
		then
			echo "Not Enough Money Try Again"
		else
			return $money
		fi
	done
}
Random_shape()
{
	local count=1
	local shape_num=0
	local num2=0
	local num=$1
	local user_or_dealer=$2
	while true;
	do
		num2=$((RANDOM%13))
		shape_num=$((RANDOM%4))
	        var1=${limit[$shape_num,$cnt2]}
		if ((var1!=13));
		then
			var2=${card_num_limite[$shape_num,1]}
			if ((var2<=4));
			then
				var3=${last_limit[$shape_num,$num2]}
				if ((var3==0));
				then
				#	var3=$(($var3+1))
				last_limit[$shape_num,$num2]=$((${last_limit[$shape_num,$num2]}+1))
				#	var1=$(($var1+1))
				limit[$shape_num,$num2]=$((${limit[$shape_num,$cnt]}+1))
				#	var2=$(($var3+1))
				card_num_limit[$num2,1]=$((${card_num_limit[$num2,1]}+1))
					if ((num==1));
					then
						if ((user_or_dealer==1));
						then
							if ((num2+1==11));
							then
								echo -en "${ON_HIGH_IYELLOW} ${shape[$shape_num]}${NC}""${BIGREEN}J${NC}"
							
							return $(($num2+1))
						
							elif ((num2+1==12));
							then
								echo -en "${ON_HIGH_IYELLOW}${shape[$shape_num]}${NC}""${BIGREEN}Q${NC}"
							
							return $(($num2+1))
							elif ((num2+1==13));
							then
								 echo -en "${ON_HIGH_IYELLOW}${shape[$shape_num]}${NC}""${BIGREEN}K${NC}"
							 
							return $(($num2+1))
							elif ((num2+1==1));
							then
								echo -en "${ON_HIGH_IYELLOW}${shape[$shape_num]}${NC}""${BIGREEN}A${NC}"											
								return $(($num2+1))
							fi
							echo -en "${ON_HIGH_IYELLOW}${shape[$shape_num]}${NC}"	
							echo -en "${BIGREEN}$(($num2+1))${NC}"	
							return $((num2+1))
				        	elif ((user_or_dealer==2));
						then
							if ((num2+1==11));
							then
								echo -en "${ON_HIGH_IRED} ${shape[$shape_num]}${NC}""${BIWHITE}J${NC}"
							
							return $(($num2+1))
							elif ((num2+1==12));
							then
								echo -en "${ON_HIGH_IRED}${shape[$shape_num]}${NC}""${BIWHITE}Q${NC}"
							
							return $(($num2+1))
							elif ((num2+1==13));
							then
								echo -en "${ON_HIGH_IRED}${shape[$shape_num]}${NC}""${BIWHITE}K${NC}"
							
							return $(($num2+1))
						
							elif ((num2+1==1));
							then
								echo -en "${ON_HIGH_IRED}${shape[$shape_num]}${NC}""${BIWHTIE}A${NC}"
								return $(($num2+1))
							fi
					
							echo -en "${ON_HIGH_IRED}${shape[$shape_num]}${NC}"
							echo -en "${BIWHITE}$(($num2+1))${NC}"
							return $((num2+1))
						fi
						
					
				
					elif ((num==2));
					then
					dealer_first_card[0]=${shape[$shape_num]}
					return $(($num2+1))
					fi
				fi

			fi
		fi
	done
}
random_num()
{
	local r_state=$1
	local user_or_dealer=$2
	Random_shape $r_state $user_or_dealer
	rd_num=$?
	if ((${rd_num}==11 ||${rd_num}==12 || ${rd_num}==13));
	then	
		rd_num=10
	 return $rd_num
 else
	 return $rd_num
	fi
}
Casino_Broke()
{
	echo -n "                         카 "
	sleep 0.5s
	echo -n "지 "
	sleep 0.5s
	echo -n "노 "
	sleep 0.5s
	echo -n "  파 "
	sleep 0.5s
	echo  " 산"
	sleep 1s
	echo " ${BGREEN}                        !!!!!USER WIN!!!!!${NC}"
	return 0
}
state()
{
	local game_state=0
	if (($1==3));
	then
		if ((${USER_MONEY}<=0));
		then
			echo "No Money Left T.T"
			return 0
		fi
		if ((DEALER_MONEY<=0));
		then
		Casino_Broke
	fi
			echo -e "${BICYAN}To Play One More Time Type 1,To Stop Type 2, To Shuffle Type 3${NC}"
			read game_state
		if ((${game_state}==2));
		then 
			echo "*****게임을 종료합니다.*****"
			return 0
		elif ((${game_state}==1)); 
		then
			return 1
		elif ((${game_state}==3));
		then 
			Card_Shuffle
			return 1
		fi
	fi
}
Dealer_Lose()
{
	local money=$1
	USER_MONEY=$(($USER_MONEY+$money))
	DEALER_MONEY=$(($DEALER_MONEY-$money))
}
User_Lose()
{
	local money=$1
	USER_MONEY=$(($USER_MONEY-$money))
	DEALER_MONEY=$(($DEALER_MONEY+$money))
}
User_Card()
{
	local state2=0
	local total_user_num=0
	local ran_num1=$1
	local ran_num2=$2
	echo "딜러로부터 카드를 받습니다"
	local random_state=1
	local user_or_dealer=1
	random_num $random_state $user_or_dealer
	ran_num1=$?
	echo -n " "
	random_num $random_state $user_or_dealer
	ran_num2=$?
	echo ""
	if (( (ran_num1==10 && ran_num2==1) || (ran_num1==1 && ran_num2==10) ));
	then
		temp=0
		echo -e "${BIWHITE}*****${LBLUE}Black Jack${BIWHITE}*****${NC}"
		echo -e "${LGREEN}User 승!${NC}"
		Dealer_Lose $money
		echo -e "${CYAN}현재나의 돈${NC} "${USER_MONEY}""
		echo -e "${YELLOW}딜러의 돈${NC} "${DEALER_MONEY}""
		return 3
	fi
	total_user_num=$(($ran_num1+$ran_num2))
	if (( (ran_num1==1 &&ran_num2 !=1) && total_user_num<21));
	then
		temp=1
		ran_num1=11
		if ((ran_num1+ran_num2==21));
		then
			temp=0
		echo -e "${BIWHITE}*****${LBLUE}Black Jack${BIWHITE}*****${NC}"
			echo -e "${LGREEN}User 승!${NC}"
			Dealer_Lose $money
		echo -e "${CYAN}현재나의 돈${NC} "${USER_MONEY}""
		echo -e "${YELLOW}딜러의 돈${NC} "${DEALER_MONEY}""
			return 3
		fi
		ran_num1=1
	elif (( (ran_num1 !=1 &&ran_num2==1) &&total_user_num<21));
	then
		temp=1
		ran_num2=11
		if ((ran_num1+ran_num2==21))
		then
			temp=0
		echo -e "${BIWHITE}*****${LBLUE}Black Jack${BIWHITE}*****${NC}"
			echo -e "${LGREEN}User 승!${NC}"
			Dealer_Lose $money
		echo -e "${CYAN}현재나의 돈${NC} "${USER_MONEY}""
		echo -e "${YELLOW}딜러의 돈${NC} "${DEALER_MONEY}""
			return 3
		fi
		ran_num2=1
	elif (( (ran_num1==1 &&ran_num2==1) &&total_user_num<21 ));
	then
		temp=1
		ran_num2=1
		ran_num1=1
	fi
	total_user_num=$(($ran_num1+$ran_num2))


	while true; do
		if ((total_user_num==21));
		then
			temp=0
			echo "현재 내 카드 합산: "${total_user_num}""
		echo -e "${BIWHITE}*****${LBLUE}Black Jack${BIWHITE}*****${NC}"
			Dealer_Lose $money
		echo -e "${CYAN}현재나의 돈${NC} "${USER_MONEY}""
		echo -e "${YELLOW}딜러의 돈${NC} "${DEALER_MONEY}""
			return 3
		fi
		if ((temp==1 && (total_user_num+10<21) ));
		then
			echo "현재 내 카드 합산 $(($total_user_num+10)) or "${total_user_num}""
		else 
			echo "현재 내 카드 합산: "${total_user_num}""
		fi
		echo -e "${LRED}Hit${BIWHITE} 1번${NC} or${BIGREEN} Stand${BIWHITE} 2번${NC}"
		read state2
		if ((state2==1));
		then
			sleep 3s
			random_num $random_state $user_or_dealer
			ran_num1=$?
			echo " "
			if ((temp==1));
			then
				temp=11
				total_user_num=$(( ($total_user_num-1)+$temp+$ran_num1))
				if ((total_user_num==21))
				then
					temp=0
		echo -e "${BIWHITE}*****${LBLUE}Black Jack${BIWHITE}*****${NC}"
					echo -e "${LGREEN}User 승!${NC}"
					Dealer_Lose $money
		echo -e "${CYAN}현재나의 돈${NC} "${USER_MONEY}""
		echo -e "${YELLOW}딜러의 돈${NC} "${DEALER_MONEY}""
					return 3
				fi
					total_user_num=$((($total_user_num+1)-$temp-$ran_num1))
					temp=1
			fi
			if ((ran_num1==1));
			then
				temp=1
				ran_num1=11
				if ((ran_num1+total_user_num==21));
				then
					temp=0
		echo -e "${BIWHITE}*****${LBLUE}Black Jack${BIWHITE}*****${NC}"
					echo -e "${LGREEN}User 승!${NC}"
					Dealer_Lose $money
		echo -e "${CYAN}현재나의 돈${NC} "${USER_MONEY}""
		echo -e "${YELLOW}딜러의 돈${NC} "${DEALER_MONEY}""
					return 3
				fi
				ran_num1=1
			fi
			total_user_num=$(($total_user_num+$ran_num1))
				
			if ((total_user_num > 21));
			then
				temp=0
				db=2
			#	sleep 3s
			#	clear
				sleep 0.5s
				#echo "*****Busted****"
				Busted $db
			#	echo "Dealer Win"
				User_Lose $3
				if ((temp==1 && (total_user_num+10<21) ));
				then
					echo "현재 내 카드 합산: $(($total_user_num+10)) or "${total_user_num}""
				else
					echo "현재 내 카드 합산: "${total_user_num}""
				fi
		echo -e "${CYAN}현재나의 돈${NC} "${USER_MONEY}""
		echo -e "${YELLOW}딜러의 돈${NC} "${DEALER_MONEY}""
				return 3
			elif ((total_user_num==21));
			then
				temp=0
				echo "현재 내 카드 합산:"${total_user_num}
				echo "*****BLACK JACK*****"
				echo -e "${LGREEN}User 승!${NC}"
				Dealer_Lose $3
		echo -e "${CYAN}현재나의 돈${NC} "${USER_MONEY}""
		echo -e "${YELLOW}딜러의 돈${NC} "${DEALER_MONEY}""
				return 3
			fi
		elif ((state2==2)) ;
		then
			if ((temp==1));
			then
				temp=0
				total_user_num=$(( ($total_user_num-1)+11))
				if ((total_user_num<21));
				then
					return $total_user_num
				else
					total_user_num=$(( ($total_user_num+1)-11))
				fi
			fi
			return $total_user_num
		fi
	done
}
dealer_hit_or_stand()
{
	if (($1>=$2));
	then
		return 1
	elif (($1>21));
	then
				local db=2
			#	clear
				sleep 0.5s
				Busted $db
				#how does it work?
		return 3
	elif (($1<$2));
	then
		return 0
	elif (($1==21))
	then
		echo -e "${LRED}Dealer Win${NC}"
		return 2
	fi
}
Dealer_Card()
{
	local total_dealer_num=0
	local state=0
	local d_num1=$3
	local d_num2=$4
	local money=$2
	local total_user_num=$1
	total_dealer_num=$(($d_num1+$d_num2))
	if ((total_dealer_num>total_user_num)) ;
	then
		temp2=0
		echo -e "${LRED}Dealer Win${NC}"
		User_Lose $money
		echo -e "${CYAN}현재나의 돈${NC} "${USER_MONEY}""
		echo -e "${YELLOW}딜러의 돈${NC} "${DEALER_MONEY}""
		return 3
	fi
	if ((d_num1==1 || d_num2==1));
	then
		temp2=1
	fi
	if ((temp2==1 && (total_dealer_num+10<21) ));
	then
		if ((total_dealer_num+10>total_user_num));
		then
			total_dealer_num=$(($total_dealer_num+10))
			temp2=0
				echo "딜러 합계: "${total_dealer_num}" 내 합계:"${total_user_num}" 딜러 승!"
			User_Lose $money
		echo -e "${CYAN}현재나의 돈${NC} "${USER_MONEY}""
		echo -e "${YELLOW}딜러의 돈${NC} "${DEALER_MONEY}""
			return 3
		fi
		if ((total_dealer_num==21));
		then
		echo -e "${BIWHITE}*****${LBLUE}Black Jack${BIWHITE}*****${NC}"
			echo -e "${LRED}Dealer Win${NC}"
			User_Lose $money
		echo -e "${CYAN}현재나의 돈${NC} "${USER_MONEY}""
		echo -e "${YELLOW}딜러의 돈${NC} "${DEALER_MONEY}""
		fi
		if (( total_dealer_num==total_user_num||total_dealer_num+10==total_user_num));
		then
			temp2=0
			echo "무승부"
		echo -e "${CYAN}현재나의 돈${NC} "${USER_MONEY}""
		echo -e "${YELLOW}딜러의 돈${NC} "${DEALER_MONEY}""
			return 3
		fi
		echo -e "${BIWHITE}Dealer's Total:${NC} $(($total_dealer_num+10)) or "${total_dealer_num}${NC}""
	elif ((temp2==1 && (total_dealer_num+10==21) ));
	then
			temp2=0
		echo -e "${BIWHITE}*****${LBLUE}Black Jack${BIWHITE}*****${NC}"
			echo -e "${LRED}Dealer Win${NC}"
			User_Lose $money
		echo -e "${CYAN}현재나의 돈${NC} "${USER_MONEY}""
		echo -e "${YELLOW}딜러의 돈${NC} "${DEALER_MONEY}""
			return 3
		elif ((temp2==1 && ($(($total_dealer_num+10))==total_user_num) ));
	then

			temp2=0
			echo "무승부"
		echo -e "${CYAN}현재나의 돈${NC} "${USER_MONEY}""
		echo -e "${YELLOW}딜러의 돈${NC} "${DEALER_MONEY}""
			return 3
	else
		echo -e "${BIWHITE}Dealer's Total:${NC} "${total_dealer_num}""
	fi
	if ((($3==1 && $4!=1) && total_dealer_num<21));
	then
		temp2=1
		d_num1=11
		total_dealer_num=$(($d_num1+$d_num2))
		if (($(($d_num1+$d_num2))==21));
		then
			temp2=0
		echo -e "${BIWHITE}*****${LBLUE}Black Jack${BIWHITE}*****${NC}"
			echo -e "${LRED}Dealer Win${NC}"
			User_Lose $money
		echo -e "${CYAN}현재나의 돈${NC} "${USER_MONEY}""
		echo -e "${YELLOW}딜러의 돈${NC} "${DEALER_MONEY}""
			return 3
		elif ((total_dealer_num>total_user_num));
		then
			temp2=0
		echo -e "${BIWHITE}Dealer's Total:${NC} "${total_dealer_num}""
			echo -e "${LRED}Dealer Win${NC}"
			User_Lose $money
		echo -e "${CYAN}현재나의 돈${NC} "${USER_MONEY}""
		echo -e "${YELLOW}딜러의 돈${NC} "${DEALER_MONEY}""
			return 3
		fi
		d_num1=1
	elif ((($3!=1 && $4==1) &&total_dealer_num<21));
	then
		temp2=1
		d_num2=11
		if (($(($d_num1+$d_num2))==21));
		then
			temp2=0
		echo -e "${BIWHITE}*****${LBLUE}Black Jack${BIWHITE}*****${NC}"
		echo -e "${BIWHITE}Dealer's Total:${NC} "${total_dealer_num}""
			echo -e "${LRED}Dealer Win${NC}"
			User_Lose $money
		echo -e "${CYAN}현재나의 돈${NC} "${USER_MONEY}""
		echo -e "${YELLOW}딜러의 돈${NC} "${DEALER_MONEY}""
			return 3
		elif ((total_dealer_num>total_user_num));
		then
			temp2=0
		echo -e "${BIWHITE}Dealer's Total:${NC} "${total_dealer_num}""
			echo -e "${LRED}Dealer Win${NC}"
			User_Lose $money
		echo -e "${CYAN}현재나의 돈${NC} "${USER_MONEY}""
		echo -e "${YELLOW}딜러의 돈${NC} "${DEALER_MONEY}""
			return 3
		fi
		d_num2=1
	elif (( ($3==1 &&$4==1) &&total_dealer_num<21));
	then
		temp2=1
		d_num2=1
		d_num1=1
	fi
	total_dealer_num=$(($d_num1+$d_num2))

	


	while ((total_user_num!=3)); do
		dealer_hit_or_stand $total_dealer_num $total_user_num
		state=$?
		if ((state==3));
		then
			temp2=0
			echo -e "${LGREEN}Dealer Lose${NC}"
				echo "딜러 합계: "${total_dealer_num}" 내 합계:"${total_user_num}""
			money=$(($money*2))
			Dealer_Lose $money
		echo -e "${CYAN}현재나의 돈${NC} "${USER_MONEY}""
		echo -e "${YELLOW}딜러의 돈${NC} "${DEALER_MONEY}""
			break
		elif ((state==2));
		then
			temp2=0
		echo -n "${BIWHITE}Dealer's Total:${NC} "${total_dealer_num}""
			echo -e "${LRED}Dealer Win${NC}"
			User_Lose $money
		echo -e "${CYAN}현재나의 돈${NC} "${USER_MONEY}""
		echo -e "${YELLOW}딜러의 돈${NC} "${DEALER_MONEY}""
			break
		elif ((state==0));
		then
			echo -e "${BIWHITE}Dealer :${LRED} Hit!${NC}"
			sleep 3s
			local random_state=1
			local user_or_dealer=2
			random_num $random_state $user_or_dealer
		d_num1=$?
			if ((d_num1==1));
			then
				temp2=1
			fi
			echo ""
			if (($1==1));
			then
				echo "Card: "${num1}""
				if ((temp2==1));
				then
					temp2=11
					total_dealer_num=$((($total_dealer_num-1)+temp))

					if ((total_user_num==21));
			        	then
		echo -e "${BIWHITE}*****${LBLUE}Black Jack${BIWHITE}*****${NC}"
					User_Lose $money
		echo -e "${CYAN}현재나의 돈${NC} "${USER_MONEY}""
		echo -e "${YELLOW}딜러의 돈${NC} "${DEALER_MONEY}""
					return 3
			        	fi
			        	total_dealer_num=$((($total_dealer_num+1)-temp))
			        	temp=1
		        	fi
		        	if (($1==1));
		         	then
				temp2=1
				d_num1=11
				if (($(($d_num1+$total_dealer_num))==21));
				then
		echo -e "${BIWHITE}*****${LBLUE}Black Jack${BIWHITE}*****${NC}"
				        	temp2=0
				         	return 3
					fi
			                	d_num1=1
				fi
				
		        	if ((total_user_num==21));
		        	then
		echo -e "${BIWHITE}*****${LBLUE}Black Jack${BIWHITE}*****${NC}"
			        	temp2=0
			        	User_Lose $money
		echo -e "${CYAN}현재나의 돈${NC} "${USER_MONEY}""
		echo -e "${YELLOW}딜러의 돈${NC} "${DEALER_MONEY}""
			        	return 3
	                  	fi
			fi
			
			total_dealer_num=$(($total_dealer_num+$d_num1))
			if ((temp2==1 && (total_dealer_num+10<21) ));
			then
				if (((total_dealer_num+10)==total_user_num));
				then
					temp2=0
					echo "무승부"
		echo -e "${CYAN}현재나의 돈${NC} "${USER_MONEY}""
		echo -e "${YELLOW}딜러의 돈${NC} "${DEALER_MONEY}""
					return 3
				fi
			fi
			if ((temp2==1 && (total_dealer_num+10)>total_user_num));
			then
				if (( total_dealer_num>21 ));
				then
				local db=1
			#	sleep 3s
			#	clear
				sleep 0.5s
				#echo "*****Busted****"
				Busted $db
				Dealer_Lose $money
				echo "딜러 합계: "${total_dealer_num}" 내 합계:"${total_user_num}""
		echo -e "${CYAN}현재나의 돈${NC} "${USER_MONEY}""
		echo -e "${YELLOW}딜러의 돈${NC} "${DEALER_MONEY}""
				temp2=0
				break
			elif ((total_dealer_num+10>21));
			then
				if ((total_dealer_num+1>21));
				then
				local db=1
			#	sleep 3s
			#	clear
				sleep 0.5s
				#echo "*****Busted****"
				Busted $db
				Dealer_Lose $money
				echo "딜러 합계: "${total_dealer_num}" 내 합계:"${total_user_num}""
		echo -e "${CYAN}현재나의 돈${NC} "${USER_MONEY}""
		echo -e "${YELLOW}딜러의 돈${NC} "${DEALER_MONEY}""
				temp2=0
				break
				fi
			fi

			if ((total_dealer_num+10>21 &&temp2==1));
			then 
				temp2=0
			elif ((total_dealer_num>total_user_num));
			then
			echo -e "${LRED}Dealer Win${NC}"
			total_dealer_num=$(($total_dealer_num+10))
			echo "딜러 합계: "${total_dealer_num}" 내 합계:"${total_user_num}" 딜러 승!"
			User_Lose $money
		echo -e "${CYAN}현재나의 돈${NC} "${USER_MONEY}""
		echo -e "${YELLOW}딜러의 돈${NC} "${DEALER_MONEY}""
			return 3
		fi
		        fi
			if ((temp2==1&& total_dealer_num+10==21));
			then
				temp2=0
				echo "*****BLACK JACK*****"
				echo -e "${LRED}Dealer Win${NC}"
				User_Lose $money
		echo -e "${CYAN}현재나의 돈${NC} "${USER_MONEY}""
		echo -e "${YELLOW}딜러의 돈${NC} "${DEALER_MONEY}""
				break

			fi
			if ((temp2==1 && (total_dealer_num+10<21) ));
			then
			if ((total_dealer_num+10>total_user_num||total_dealer_num>total_user_num));
				then
				echo -e "${LRED}Dealer Win${NC}"
			total_dealer_num=$(($total_dealer_num+10))
			echo "딜러 합계: "${total_dealer_num}" 내 합계:"${total_user_num}" 딜러 승!"
			User_Lose $money
		echo -e "${CYAN}현재나의 돈${NC} "${USER_MONEY}""
		echo -e "${YELLOW}딜러의 돈${NC} "${DEALER_MONEY}""
			return 3
		         fi

				echo -e "${BIWHITE}Dealer's Total:${NC} $(($total_dealer_num+10)) or "${total_dealer_num}""
			else
				echo -e "${BIWHITE}Dealer's Total:${NC} "${total_dealer_num}""
			fi
			if ((total_dealer_num>21)) ;
			then
				temp2=0
				db=1
			#	sleep 3s
			#	clear
				sleep 0.5s
				#echo "*****Busted****"
				Busted $db
	                 	echo -e "${BIWHITE}Dealer's Total:${NC} "${total_dealer_num}""
				Dealer_Lose $money
		echo -e "${CYAN}현재나의 돈${NC} "${USER_MONEY}""
		echo -e "${YELLOW}딜러의 돈${NC} "${DEALER_MONEY}""
				break
				if ((DEALER_MONEY<=0));
				then
					echo "Dealer has no Money Left"
					echo "USER WIN"
		echo -e "${CYAN}현재나의 돈${NC} "${USER_MONEY}""
		echo -e "${YELLOW}딜러의 돈${NC} "${DEALER_MONEY}""
					break
				fi
			elif ((total_dealer_num==21));
			then
				temp2=0
				echo "*****BLACK JACK*****"
				echo -e "${LRED}Dealer Win${NC}"
				User_Lose $money
		echo -e "${CYAN}현재나의 돈${NC} "${USER_MONEY}""
		echo -e "${YELLOW}딜러의 돈${NC} "${DEALER_MONEY}""
				break
			fi
		elif ((state==1));
		then
			if ((${total_dealer_num}>${total_user_num}));
			then
				if ((total_dealer_num>21));
				then
			#		sleep 3s
			#	clear
				sleep 0.5s
				#echo "*****Busted****"
				Busted $db
	                	echo -e "${BIWHITE}Dealer's Total: "${total_dealer_num}""
				echo "딜러 합계: "${total_dealer_num}" 내 합계:"${total_user_num}"유저 승!"
				Dealer_Lose $money
		echo -e "${CYAN}현재나의 돈${NC} "${USER_MONEY}""
		echo -e "${YELLOW}딜러의 돈${NC} "${DEALER_MONEY}""
				else
				echo "딜러 합계: "${total_dealer_num}" 내 합계:"${total_user_num}" 딜러 승!"
				User_Lose $money
		echo -e "${CYAN}현재나의 돈${NC} "${USER_MONEY}""
		echo -e "${YELLOW}딜러의 돈${NC} "${DEALER_MONEY}""
				fi
			elif ((${total_dealer_num}<${total_user_num}));
			then
				echo "딜러 합계: "${total_dealer_num}" 내 합계:"${total_user_num}"유저 승!"
				Dealer_Lose $money
		echo -e "${CYAN}현재나의 돈${NC} "${USER_MONEY}""
		echo -e "${YELLOW}딜러의 돈${NC} "${DEALER_MONEY}""
			elif ((total_dealer_num==21));
			then
				temp2=0
		echo -e "${BIWHITE}*****${LBLUE}Black Jack${BIWHITE}*****${NC}"
				echo "딜러 합계 "${total_dealer_num}" 내 합계 "${total_user_num}" 딜러 승!"
		echo -e "${CYAN}현재나의 돈${NC} "${USER_MONEY}""
		echo -e "${YELLOW}딜러의 돈${NC} "${DEALER_MONEY}""
			else
				temp2=0
				echo "딜러 합계 "${total_dealer_num}" 내 합계 "${total_user_num}""
				echo "무승부"
		echo -e "${CYAN}현재나의 돈${NC} "${USER_MONEY}""
		echo -e "${YELLOW}딜러의 돈${NC} "${DEALER_MONEY}""
			fi
				break
		fi
	done

}
Introduction
information
game_status=-1
total_user_num=0
total_dealer_num=0
cnt=1
user_state=1
		echo -e "${CYAN}현재나의 돈${NC} "${USER_MONEY}""
		echo -e "${YELLOW}딜러의 돈${NC} "${DEALER_MONEY}""
total_dealer_num=d_ran_num1+d_ran_num2
while true; do
	user_state=1
	echo -e "              ${BIWHITE}**********${BIGREEN}ROUND ${cnt} START${BIWHITE}**********"${NC}
	cnt=$(($cnt+1))
	r_state=2
	ran_dealer_num=2
	random_num $r_state $ran_dealer_num
        d_ran_num2=$?

	while true; do
		echo -e "${LBLUE}Bet Money:${NC}"
		read money
		if ((${USER_MONEY}<money));
		then
			echo "Not Enough Money, Try Again"
		else
			break
		fi
	done
	user_money=$money
	total_dealer_num=$(($d_ran_num1+$d_ran_num2))



echo -n "현재 딜러 카드 한 장:"
r_state2=1
ran_dealer_num=2
random_num $r_state2 $ran_dealer_num
d_ran_num1=$?
echo ""
User_Card $ran_num1 $ran_num2 $user_money
total_user_num=$?
game_status=-1
if ((total_user_num==3));
then
	state $total_user_num
	game_status=$?
fi
if ((game_status==0));
then
	break
elif ((game_status==1));
then
	continue
fi
if ((temp==1));
then
	if (( (total_user_num-1)+11<21));
	then
		total_user_num=$(( ($total_user_num-1)+11))
	fi
	temp=0
fi

echo "현재 내 카드 합산:"${total_user_num}""
echo ""
echo "뒤집어져 있던 딜러의 나머지 한 카드 "

if ((d_ran_num2==1));
then
	echo ""${dealer_first_card[0]}"A"
else
	echo -e ""${ON_HIGH_IRED}${dealer_first_card[0]}${NC}""${BIWHITE}${d_ran_num2}${NC}""
fi

if ((total_user_num!=3));
then
	Dealer_Card $total_user_num $user_money $d_ran_num1 $d_ran_num2
fi
if ((USER_MONEY<=0));
then 
	echo "No Money Left T.T"
	break
fi
if ((DEALER_MONEY<=0));
then
		Casino_Broke
		break
	fi
echo -e "${BICYAN}To Play One More Time Type 1, To Stop Type 2, To Shuffle Card Type 3${NC}"
read game_status
if ((game_status==2));
then
	echo "****Game Over****"
	break
elif ((game_status==3));
then
	Card_Shuffle
fi
done
