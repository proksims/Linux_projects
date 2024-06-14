#! /bin/bash

# Обозначения цветов: (1 - white, 2 - red, 3 - green, 4 - blue, 5 – purple, 6 - black)
WHITE="\033[97m"
RED="\033[91m"
GREEN="\033[92m"
BLUE="\033[94m"
PURPLE="\033[95m"
BLACK="\033[30m"

BGWHITE="\033[107m"
BGRED="\033[101m"
BGGREEN="\033[102m"
BGBLUE="\033[104m"
BGPURPLE="\033[105m"
BGBLACK="\033[40m"
DEFAULT='\033[0m'

# Параметр 1 - это фон названий значений (HOSTNAME, TIMEZONE, USER и т.д.)
  column1_background_my=$BGBLACK
  color1="black"
  column1_back=$1
      if [[ $1 == 1 ]] ; then column1_background_my=$BGWHITE color1="white"
    elif [[ $1 == 2 ]] ; then column1_background_my=$BGRED color1="red"
    elif [[ $1 == 3 ]] ; then column1_background_my=$BGGREEN color1="green"
    elif [[ $1 == 4 ]] ; then column1_background_my=$BGBLUE color1="blue"
    elif [[ $1 == 5 ]] ; then column1_background_my=$BGPURPLE color1="purple"
    elif [[ $1 == 6 ]] ; then column1_background_my=$BGBLACK color1="black"
    else column1_back="default"
    fi

# Параметр 2 - это цвет шрифта названий значений (HOSTNAME, TIMEZONE, USER и т.д.)
  column1_font_color_my=$WHITE
  color2="white"
  column1_font=$2
      if [[ $2 == 1 ]] ; then column1_font_color_my=$WHITE color2="white"
    elif [[ $2 == 2 ]] ; then column1_font_color_my=$RED color2="red"
    elif [[ $2 == 3 ]] ; then column1_font_color_my=$GREEN color2="green"
    elif [[ $2 == 4 ]] ; then column1_font_color_my=$BLUE color2="blue"
    elif [[ $2 == 5 ]] ; then column1_font_color_my=$PURPLE color2="purple"
    elif [[ $2 == 6 ]] ; then column1_font_color_my=$BLACK color2="black"
    else column1_font="default"
    fi

# Параметр 3 - это фон значений (после знака '=')
  column2_background_my=$BGRED
  color3="red"
  column2_back=$3
      if [[ $3 == 1 ]] ; then column2_background_my=$BGWHITE color3="white"
    elif [[ $3 == 2 ]] ; then column2_background_my=$BGRED color3="red"
    elif [[ $3 == 3 ]] ; then column2_background_my=$BGGREEN color3="green"
    elif [[ $3 == 4 ]] ; then column2_background_my=$BGBLUE color3="blue"
    elif [[ $3 == 5 ]] ; then column2_background_my=$BGPURPLE color3="purple"
    elif [[ $3 == 6 ]] ; then column2_background_my=$BGBLACK color3="black"
    else column2_back="default"
    fi

# Параметр 4 - это цвет шрифта значений (после знака '=')
  column2_font_color_my=$BLUE
  color4="blue"
  column2_font=$4
      if [[ $4 == 1 ]] ; then column2_font_color_my=$WHITE color4="white"
    elif [[ $4 == 2 ]] ; then column2_font_color_my=$RED color4="red"
    elif [[ $4 == 3 ]] ; then column2_font_color_my=$GREEN color4="green"
    elif [[ $4 == 4 ]] ; then column2_font_color_my=$BLUE color4="blue"
    elif [[ $4 == 5 ]] ; then column2_font_color_my=$PURPLE color4="purple"
    elif [[ $4 == 6 ]] ; then column2_font_color_my=$BLACK color4="black"
    else column2_font="default"
    fi
